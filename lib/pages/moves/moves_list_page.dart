import 'package:flutter/material.dart';
import 'package:pokedex_app/common/constants.dart';
import 'package:pokedex_app/data/model/response/move_response.dart';
import 'package:pokedex_app/data/repositories/move_repository.dart';
import 'package:pokedex_app/di/injection.dart';
import 'package:pokedex_app/extensions/string_ext.dart';
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

  int offset = 0;
  final int limit = 20;
  bool hasNextPage = true;
  bool isFirstLoadRunning = false;
  bool isLoadMoreRunning = false;

  final List<MoveResponse> moveList = [];

  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _firstLoad();
    _scrollController = ScrollController()
      ..addListener(() {
        _loadMore();
      });
  }

  void _firstLoad() async {
    setState(() {
      isFirstLoadRunning = true;
    });

    final data = await repository.getMoves(offset, limit);
    if (data.isNotEmpty) {
      setState(() {
        moveList.addAll(data);
      });
    }

    setState(() {
      isFirstLoadRunning = false;
    });
  }

  void _loadMore() async {
    if (hasNextPage &&
        !isFirstLoadRunning &&
        !isLoadMoreRunning &&
        _scrollController.position.extentAfter < 300) {
      setState(() {
        isLoadMoreRunning = true;
      });

      offset += limit;

      final data = await repository.getMoves(offset, limit);
      if (data.isNotEmpty) {
        setState(() {
          moveList.addAll(data);
        });
      } else {
        hasNextPage = false;
      }

      setState(() {
        isLoadMoreRunning = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppBarSearchWidget(
          title: 'Moves',
        ),
        if (isFirstLoadRunning)
          const Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        else
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
        if (isLoadMoreRunning == true)
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 20),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
      ],
    );
  }
}

class _BuildItemMoves extends StatelessWidget {
  const _BuildItemMoves({Key? key, required this.move,})
      : super(key: key);

  final MoveResponse move;

  @override
  Widget build(BuildContext context) {
    final type = PokemonTypes.getType(move.type?.name ?? '');

    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Container(
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
    );
  }
}
