import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/common/constants.dart';
import 'package:pokedex_app/data/model/pokemon.dart';
import 'package:pokedex_app/data/repositories/pokemon_repository.dart';
import 'package:pokedex_app/di/injection.dart';
import 'package:pokedex_app/extensions/string_ext.dart';
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
  final repository = getIt.get<PokemonRepository>();

  int offset = 0;
  final int limit = 20;
  bool hasNextPage = true;
  bool isFirstLoadRunning = false;
  bool isLoadMoreRunning = false;

  final List<Pokemon> pokemonList = [];

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

    final data = await repository.getPokemons(offset, limit);
    if (data.isNotEmpty) {
      setState(() {
        pokemonList.addAll(data);
      });
    }

    setState((){
      isFirstLoadRunning = false;
    });
  }

  void _loadMore() async {
    if (hasNextPage &&
        !isFirstLoadRunning &&
        !isLoadMoreRunning &&
        _scrollController.position.extentAfter < 300) {
      setState((){
        isLoadMoreRunning = true;
      });

      offset += limit;

      final data = await repository.getPokemons(offset, limit);
      if (data.isNotEmpty) {
        setState((){
          pokemonList.addAll(data);
        });
      } else {
        hasNextPage = false;
      }

      setState((){
        isLoadMoreRunning = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppBarSearchWidget(
          title: 'Pokemon',
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
        if (isLoadMoreRunning == true)
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 20),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ],
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
        Navigator.of(context).pushNamed('$PokemonDetailPage');
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
                imageUrl:'$pokemonImageUrl${pokemon.id}.png',
                placeholder: (context, url) => const Center(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: CircularProgressIndicator(),
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
