import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_app/common/constants.dart';
import 'package:pokedex_app/data/model/move.dart';
import 'package:pokedex_app/data/repositories/move_repository.dart';
import 'package:pokedex_app/di/injection.dart';
import 'package:pokedex_app/extensions/string_ext.dart';
import 'package:pokedex_app/pages/moves/bloc/moves_list_cubit.dart';
import 'package:pokedex_app/pages/moves/bloc/moves_list_state.dart';
import 'package:pokedex_app/pages/moves/move_detail/move_detail_page.dart';
import 'package:pokedex_app/utils/theme.dart';
import 'package:pokedex_app/widgets/appbar_search_widget.dart';
import 'package:pokedex_app/widgets/pokemon_type_widget.dart';

class MovesListPage extends StatefulWidget {
  const MovesListPage({Key? key}) : super(key: key);

  @override
  State<MovesListPage> createState() => _MovesListPageState();
}

class _MovesListPageState extends State<MovesListPage> {
  final repository = getIt.get<MoveRepository>();
  final moveListCubit = getIt.get<MovesListCubit>();

  int offset = 0;
  final int limit = 15;
  bool hasNextPage = true;
  bool isFirstLoadRunning = false;
  bool isLoadMoreRunning = false;

  final List<Move> moveList = [];

  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    moveListCubit.getMoveList(offset, limit);
    _scrollController = ScrollController()
      ..addListener(() {
        _loadMore();
      });
  }

  void _loadMore() async {
    if (hasNextPage &&
        !isFirstLoadRunning &&
        !isLoadMoreRunning &&
        _scrollController.position.extentAfter < 300) {
      isLoadMoreRunning = true;
      offset += limit;
      moveListCubit.getMoreMoveList(offset, limit);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppBarSearchWidget(
          title: 'Moves',
        ),
        BlocProvider(
          create: (_) => moveListCubit,
          child: BlocConsumer<MovesListCubit, MovesListState>(
            builder: (context, state) {
              return _buildMoveList(state);
            },
            listener: (context, state) {},
          ),
        ),
      ],
    );
  }

  Widget _buildMoveList(MovesListState state) {
    if (state is MovesListLoaded) {
      isFirstLoadRunning = false;
      isLoadMoreRunning = false;
      if (state.moveList.isEmpty) {
        hasNextPage = false;
      }
      moveList.addAll(state.moveList);
    } else if (state is MovesListInitial || state is MovesListLoading) {
      isFirstLoadRunning = true;
    } else if (state is MovesListLoadingMore) {
      isLoadMoreRunning = true;
    } else if (state is MovesListError) {
      isFirstLoadRunning = false;
      isLoadMoreRunning = false;
    }

    return Expanded(
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: moveList.length,
                  itemBuilder: (context, index) {
                    final move = moveList[index];
                    return _BuildItemMoves(
                      move: move,
                    );
                  },
                ),
              ),
              if (state is MovesListLoadingMore)
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            ],
          ),
          if (state is MovesListLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}

class _BuildItemMoves extends StatelessWidget {
  const _BuildItemMoves({
    Key? key,
    required this.move,
  }) : super(key: key);

  final Move move;

  @override
  Widget build(BuildContext context) {
    final type = PokemonTypes.getType(move.type ?? '');

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('$MoveDetailPage', arguments: move);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 16, 8, 16),
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: kColorDivider)),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  move.name.toString().capitalize(),
                  style: PrimaryFont.medium(19),
                ),
              ),
              PokemonTypeWidget(
                type: type,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
