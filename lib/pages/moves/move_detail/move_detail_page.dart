import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex_app/common/constants.dart';
import 'package:pokedex_app/data/model/move.dart';
import 'package:pokedex_app/extensions/string_ext.dart';
import 'package:pokedex_app/utils/theme.dart';
import 'package:pokedex_app/widgets/pokemon_tag_widget.dart';

class MoveDetailPage extends StatefulWidget {
  const MoveDetailPage({Key? key, required this.move}) : super(key: key);

  final Move move;

  @override
  State<MoveDetailPage> createState() => _MoveDetailPageState();
}

class _MoveDetailPageState extends State<MoveDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: widget.move.getType().bgGradient),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                delegate: _BuildSliverAppBar(widget.move, expandedHeight: 200),
                pinned: true,
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Container(
                  padding: const EdgeInsets.only(top: 50),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(48),
                      topRight: Radius.circular(48),
                    ),
                  ),
                  child: _BuildInfo(move: widget.move),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BuildSliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final Move move;

  _BuildSliverAppBar(this.move, {required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: move.getType().bgGradient,
          ),
        ),
        Center(
          child: Opacity(
            opacity: shrinkOffset / expandedHeight,
            child: Text(
              move.name.capitalize(),
              style: PrimaryFont.book(20).copyWith(color: Colors.white),
            ),
          ),
        ),
        Positioned(
          top: expandedHeight / 1.4 - shrinkOffset,
          left: MediaQuery.of(context).size.width / 4,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: Card(
              elevation: 0,
              color: Colors.transparent,
              child: SizedBox(
                height: expandedHeight / 2,
                width: MediaQuery.of(context).size.width / 2,
                child: SvgPicture.asset(move.getType().image),
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

class _BuildInfo extends StatelessWidget {
  const _BuildInfo({
    Key? key, required this.move,
  }) : super(key: key);

  final Move move;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          move.name.capitalize(),
          style: PrimaryFont.book(40),
        ),
        PokemonTagWidget(type: move.getType()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            move.getDesc(),
            style: PrimaryFont.book(15).copyWith(
              color: kColorPrimaryText,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 50,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Base Power',
                        style: PrimaryFont.medium(15).copyWith(color: move.getType().color),
                      ),
                      const SizedBox(height: 10,),
                      Text('${move.power ?? '--'}', style: PrimaryFont.book(19).copyWith(color: kColorPrimaryText),),
                    ],
                  ),
                ),
                const VerticalDivider(color: kColorDivider,),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Accuracy',
                        style: PrimaryFont.medium(15).copyWith(color: move.getType().color),
                      ),
                      const SizedBox(height: 10,),
                      Text(move.accuracy != null ? '${move.accuracy}%' : '--', style: PrimaryFont.book(19).copyWith(color: kColorPrimaryText),),
                    ],
                  ),
                ),
                const VerticalDivider(color: kColorDivider,),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'PP',
                        style: PrimaryFont.medium(15).copyWith(color: move.getType().color),
                      ),
                      const SizedBox(height: 10,),
                      Text('${move.pp ?? '--'}', style: PrimaryFont.book(19).copyWith(color: kColorPrimaryText),),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
