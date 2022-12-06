import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pokedex_app/common/constants.dart';
import 'package:pokedex_app/data/model/pokemon.dart';
import 'package:pokedex_app/data/repositories/pokemon_repository.dart';
import 'package:pokedex_app/di/injection.dart';
import 'package:pokedex_app/extensions/string_ext.dart';
import 'package:pokedex_app/pages/pokemon_detail/evolution/evolution_page.dart';
import 'package:pokedex_app/pages/pokemon_detail/moves/moves_page.dart';
import 'package:pokedex_app/pages/pokemon_detail/stats/stats_page.dart';
import 'package:pokedex_app/utils/theme.dart';
import 'package:pokedex_app/widgets/pokemon_tag_widget.dart';

class PokemonDetailPage extends StatefulWidget {
  const PokemonDetailPage({Key? key, required this.pokemon}) : super(key: key);

  final Pokemon pokemon;

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  final pokemonRepository = getIt.get<PokemonRepository>();
  late Pokemon pokemon;

  bool _isLoading = false;

  @override
  void initState() {
    pokemon = widget.pokemon;
    super.initState();
    fetchInfo();
  }

  void fetchInfo() async {
    setState(() {
      _isLoading = true;
    });
    final data = await pokemonRepository.getInfoPokemon(pokemon);
    setState(() {
      pokemon = data;
      _isLoading = false;
    });

    // setState(() {
    //   _isLoading = false;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:
            BoxDecoration(gradient: pokemon.mainType().bgGradient),
        child: SafeArea(
          child: (!_isLoading) ? CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                delegate: _BuildSliverAppBar(
                  pokemon,
                  expandedHeight: 200,
                ),
                pinned: true,
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.only(top: 50),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(48),
                      topRight: Radius.circular(48),
                    ),
                  ),
                  child: _BuildInfo(pokemon: pokemon,),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.white,
                  child: _BuildTabAttributes(pokemon: pokemon,),
                ),
              ),
            ],
          ) : const Center(child: CircularProgressIndicator(color: Colors.white,)),
        ),
      ),
    );
  }
}

class _BuildInfo extends StatelessWidget {
  const _BuildInfo({
    Key? key, required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    var types = pokemon.getTypes();

    return Column(
      children: [
        Text(
          pokemon.name.toString().capitalize(),
          style: PrimaryFont.book(40),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: types.map((e) => PokemonTagWidget(type: PokemonTypes.getType(e))).toList(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            pokemon.species.toString(),
            style: PrimaryFont.book(15).copyWith(
              color: kColorPrimaryText,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class _BuildTabAttributes extends StatefulWidget {
  const _BuildTabAttributes({Key? key, required this.pokemon}) : super(key: key);

  final Pokemon pokemon;

  @override
  State<_BuildTabAttributes> createState() => _BuildTabAttributesState();
}

class _BuildTabAttributesState extends State<_BuildTabAttributes>
    with SingleTickerProviderStateMixin {
  final tabs = [
    const Tab(text: 'STATS'),
    const Tab(text: 'EVOLUTION'),
    const Tab(text: 'MOVES'),
  ];

  int _tabSelected = 0;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            onTap: (index) {
              setState(() {
                if (_tabSelected != index) {
                  _tabSelected = index;
                }
              });
            },
            indicator: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: widget.pokemon.mainType().color,
              shadows: [
                BoxShadow(color: widget.pokemon.mainType().color.withOpacity(0.7), blurRadius: 10)
              ],
            ),
            unselectedLabelColor: widget.pokemon.mainType().color,
            labelStyle: PrimaryFont.medium(13),
            controller: _tabController,
            tabs: tabs,
          ),
          IndexedStack(
            index: _tabSelected,
            children: [
              StatsPage(pokemon: widget.pokemon,),
              EvolutionPage(evolutions: widget.pokemon.evolutions,),
              MovesPage(moves: widget.pokemon.moves,),
            ],
          ),
        ],
      ),
    );
  }
}

class _BuildSliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final Pokemon pokemon;

  _BuildSliverAppBar(this.pokemon, {required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: pokemon.mainType().bgGradient,
          ),
        ),
        Center(
          child: Opacity(
            opacity: shrinkOffset / expandedHeight,
            child: Text(
              pokemon.name.toString().capitalize(),
              style: PrimaryFont.book(20).copyWith(color: Colors.white),
            ),
          ),
        ),
        Positioned(
          top: expandedHeight / 4 - shrinkOffset,
          left: MediaQuery.of(context).size.width / 4,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: Card(
              elevation: 0,
              color: Colors.transparent,
              child: SizedBox(
                height: expandedHeight,
                width: MediaQuery.of(context).size.width / 2,
                child: Image.network('$pokemonImageUrl${pokemon.id}.png', fit: BoxFit.fitHeight,),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
