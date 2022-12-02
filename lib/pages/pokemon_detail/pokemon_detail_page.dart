import 'package:flutter/material.dart';
import 'package:pokedex_app/common/constants.dart';
import 'package:pokedex_app/pages/pokemon_detail/evolution/evolution_page.dart';
import 'package:pokedex_app/pages/pokemon_detail/moves/moves_page.dart';
import 'package:pokedex_app/pages/pokemon_detail/stats/stats_page.dart';
import 'package:pokedex_app/utils/theme.dart';
import 'package:pokedex_app/widgets/pokemon_tag_widget.dart';

class PokemonDetailPage extends StatefulWidget {
  const PokemonDetailPage({Key? key}) : super(key: key);

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:
            BoxDecoration(gradient: PrimaryGradient.waterGradientBackground),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                delegate: _BuildSliverAppBar(expandedHeight: 200),
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
                  child: const _BuildInfo(),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.white,
                  child: const _BuildTabAttributes(),
                ),
              )
              // SliverFillRemaining(
              //   hasScrollBody: false,
              //   child: Container(
              //     padding: const EdgeInsets.all(16),
              //     decoration: const BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.only(
              //         topLeft: Radius.circular(48),
              //         topRight: Radius.circular(48),
              //       ),
              //     ),
              //     child: Column(
              //       children: const [
              //         SizedBox(
              //           height: 50,
              //         ),
              //         _BuildInfo(),
              //         SizedBox(
              //           height: 20,
              //         ),
              //         _BuildTabAttributes()
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BuildInfo extends StatelessWidget {
  const _BuildInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Squirtle',
          style: PrimaryFont.book(40),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            PokemonTagWidget(type: PokemonTypes.water),
            PokemonTagWidget(type: PokemonTypes.fairy),
          ],
        ),
        Text(
          'Squirtle’s shell is not merely used for protection.\n'
          'The shell’s rounded shape and the grooves on its '
          'surface help minimize resistance in water, '
          'enabling this pokemon to swim at high speed.',
          style: PrimaryFont.book(15).copyWith(
            color: kColorPrimaryText,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _BuildTabAttributes extends StatefulWidget {
  const _BuildTabAttributes({Key? key}) : super(key: key);

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
              color: kColorWater,
              shadows: [
                BoxShadow(color: kColorWater.withOpacity(0.7), blurRadius: 10)
              ],
            ),
            unselectedLabelColor: kColorWater,
            labelStyle: PrimaryFont.medium(13),
            controller: _tabController,
            tabs: tabs,
          ),
          IndexedStack(
            index: _tabSelected,
            children: const [
              StatsPage(),
              EvolutionPage(),
              MovesPage(),
            ],
          ),
        ],
      ),
    );
  }
}

class _BuildSliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  _BuildSliverAppBar({required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: PrimaryGradient.waterGradientBackground,
          ),
        ),
        Center(
          child: Opacity(
            opacity: shrinkOffset / expandedHeight,
            child: Text(
              "Squirtle",
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
                  child: Image.asset(ImageAssets.img_squirtle)),
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
