import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_app/common/constants.dart';
import 'package:pokedex_app/data/model/pokemon.dart';
import 'package:pokedex_app/di/injection.dart';
import 'package:pokedex_app/extensions/string_ext.dart';
import 'package:pokedex_app/pages/pokemon/bloc/pokemon_list_cubit.dart';
import 'package:pokedex_app/pages/pokemon/bloc/pokemon_list_state.dart';
import 'package:pokedex_app/pages/pokemon_detail/pokemon_detail_page.dart';
import 'package:pokedex_app/utils/theme.dart';
import 'package:pokedex_app/widgets/appbar_search_widget.dart';
import 'package:pokedex_app/widgets/pokemon_type_chart_widget.dart';
import 'package:pokedex_app/widgets/pokemon_type_widget.dart';

class PokemonListPage extends StatefulWidget {
  const PokemonListPage({Key? key}) : super(key: key);

  @override
  State<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  final pokemonListCubit = getIt.get<PokemonListCubit>();

  int offset = 0;
  final int limit = 15;
  bool hasNextPage = true;
  bool isFirstLoadRunning = false;
  bool isLoadMoreRunning = false;

  final List<Pokemon> pokemonList = [];

  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    pokemonListCubit.getPokemonList(offset, limit);
    _scrollController = ScrollController()
      ..addListener(() {
        _loadMore();
      });
  }

  @override
  void dispose() {
    _scrollController.removeListener(() {
      _loadMore();
    });
    super.dispose();
  }

  void _loadMore() async {
    if (hasNextPage &&
        !isFirstLoadRunning &&
        !isLoadMoreRunning &&
        _scrollController.position.extentAfter < 300) {
      isLoadMoreRunning = true;
      offset += limit;
      pokemonListCubit.getMorePokemonList(offset, limit);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppBarSearchWidget(
          title: 'Pokemon',
        ),
        BlocProvider(
          create: (_) => pokemonListCubit,
          child: BlocConsumer<PokemonListCubit, PokemonListState>(
            builder: (context, state) {
              return _buildPokemonList(state);
            },
            listener: (context, state) {
              if (state is PokemonListError) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message!)));
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPokemonList(PokemonListState state) {
    if (state is PokemonListLoaded) {
      isFirstLoadRunning = false;
      isLoadMoreRunning = false;
      if (state.pokemonList.isEmpty) {
        hasNextPage = false;
      }
      pokemonList.addAll(state.pokemonList);
    } else if (state is PokemonListInitial || state is PokemonListLoading) {
      isFirstLoadRunning = true;
    } else {
      isLoadMoreRunning = false;
      isFirstLoadRunning = false;
    }

    return Expanded(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  controller: _scrollController,
                  itemCount: pokemonList.length,
                  itemBuilder: (context, index) {
                    final pokemon = pokemonList[index];
                    return _BuildItemPokemon(
                      pokemon: pokemon,
                    );
                  },
                ),
              ),
              if (state is PokemonListLoadingMore)
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            ],
          ),
          if (state is PokemonListInitial || state is PokemonListLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}

class _BuildItemPokemon extends StatelessWidget {
  const _BuildItemPokemon({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    final types = pokemon.types ?? [];
    final typeViews = [];
    for (var type in types) {
      typeViews.add(PokemonTypes.getType(type.type?.name ?? ""));
    }

    return GestureDetector(
      onTap: () {
        // showDialog(
        //     context: context,
        //     builder: (context) {
        //       return const _BuildWeaknessDialog();
        //     });
        Navigator.of(context)
            .pushNamed('$PokemonDetailPage', arguments: pokemon);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: kColorDivider)),
          ),
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl: '$pokemonImageUrl${pokemon.id}.png',
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                  ),
                ),
                width: 50,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pokemon.name.toString().capitalize(),
                      style: PrimaryFont.medium(19)
                          .copyWith(color: kColorPrimaryText),
                    ),
                    Text(
                      '#${pokemon.id.toString().padLeft(3, '0')}',
                      style: PrimaryFont.book(15)
                          .copyWith(color: kColorSecondaryText),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children:
                    typeViews.map((e) => PokemonTypeWidget(type: e)).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BuildWeaknessDialog extends StatelessWidget {
  const _BuildWeaknessDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: kColorDivider,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Image.asset(ImageAssets.img_bulbasaur),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bulbasaur',
                          style: PrimaryFont.medium(19)
                              .copyWith(color: kColorPrimaryText),
                        ),
                        Text(
                          '#001',
                          style: PrimaryFont.book(15)
                              .copyWith(color: kColorSecondaryText),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      PokemonTypeWidget(
                        type: PokemonTypes.grass,
                      ),
                      PokemonTypeWidget(
                        type: PokemonTypes.poison,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              shrinkWrap: true,
              childAspectRatio: 5 / 2,
              children: const [
                PokemonTypeChartWidget(
                    type: PokemonTypes.bug, effectiveness: '1x'),
                PokemonTypeChartWidget(
                    type: PokemonTypes.fire, effectiveness: '1x'),
                PokemonTypeChartWidget(
                    type: PokemonTypes.dark, effectiveness: '1x'),
                PokemonTypeChartWidget(
                    type: PokemonTypes.ice, effectiveness: '1x'),
                PokemonTypeChartWidget(
                    type: PokemonTypes.grass, effectiveness: '1x'),
                PokemonTypeChartWidget(
                    type: PokemonTypes.steel, effectiveness: '1x'),
                PokemonTypeChartWidget(
                    type: PokemonTypes.water, effectiveness: '1x'),
                PokemonTypeChartWidget(
                    type: PokemonTypes.electric, effectiveness: '1x'),
                PokemonTypeChartWidget(
                    type: PokemonTypes.dragon, effectiveness: '1x'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
