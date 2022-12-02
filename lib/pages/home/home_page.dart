import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex_app/common/constants.dart';
import 'package:pokedex_app/pages/items/items_list_page.dart';
import 'package:pokedex_app/pages/moves/moves_list_page.dart';
import 'package:pokedex_app/pages/pokemon/pokemon_list_page.dart';
import 'package:pokedex_app/utils/theme.dart';
import 'package:pokedex_app/widgets/default_background_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: const [
            PokemonListPage(),
            MovesListPage(),
            ItemsListPage(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: PrimaryGradient.defaultGradientBackground,
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: kColorDarkWhite80,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 3,
                decoration: BoxDecoration(
                  gradient: PrimaryGradient.defaultGradientBackground,
                ),
              ),
              BottomNavigationBar(
                backgroundColor: Colors.transparent,
                unselectedLabelStyle: PrimaryFont.medium(12),
                unselectedItemColor: Colors.black38,
                selectedLabelStyle: PrimaryFont.medium(12),
                selectedItemColor: Colors.black,
                currentIndex: _currentIndex,
                elevation: 0,
                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      ImageAssets.ic_pokemon,
                      color: _currentIndex == 0 ? Colors.black : Colors.black38,
                    ),
                    label: 'Pokemon',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      ImageAssets.ic_moves,
                      color: _currentIndex == 1 ? Colors.black : Colors.black38,
                    ),
                    label: 'Moves',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      ImageAssets.ic_items,
                      color: _currentIndex == 2 ? Colors.black : Colors.black38,
                    ),
                    label: 'Items',
                  ),
                ],
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
