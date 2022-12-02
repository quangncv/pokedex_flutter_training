import 'package:flutter/material.dart';
import 'package:pokedex_app/common/constants.dart';
import 'package:pokedex_app/utils/theme.dart';
import 'package:pokedex_app/widgets/appbar_search_widget.dart';

class ItemsListPage extends StatefulWidget {
  const ItemsListPage({Key? key}) : super(key: key);

  @override
  State<ItemsListPage> createState() => _ItemsListPageState();
}

class _ItemsListPageState extends State<ItemsListPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppBarSearchWidget(
          title: 'Items',
        ),
        Expanded(
          child: ListView(
            children: const [
              _BuildSingleItem(),
              _BuildSingleItem(),
            ],
          ),
        ),
      ],
    );
  }
}

class _BuildSingleItem extends StatelessWidget {
  const _BuildSingleItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: kColorDivider),
          ),
        ),
        child: Row(
          children: [
            Image.asset(ImageAssets.img_ball),
            Expanded(
              child: Text(
                'Master Ball',
                style: PrimaryFont.medium(19),
              ),
            ),
            Text(
              '1000',
              style: PrimaryFont.book(15).copyWith(color: kColorSecondaryText),
            ),
            const SizedBox(width: 5,),
            Image.asset(ImageAssets.ic_item_count)
          ],
        ),
      ),
    );
  }
}
