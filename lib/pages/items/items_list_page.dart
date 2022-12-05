import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/common/constants.dart';
import 'package:pokedex_app/data/model/item.dart';
import 'package:pokedex_app/data/repositories/item_repository.dart';
import 'package:pokedex_app/di/injection.dart';
import 'package:pokedex_app/extensions/string_ext.dart';
import 'package:pokedex_app/utils/theme.dart';
import 'package:pokedex_app/widgets/appbar_search_widget.dart';

class ItemsListPage extends StatefulWidget {
  const ItemsListPage({Key? key}) : super(key: key);

  @override
  State<ItemsListPage> createState() => _ItemsListPageState();
}

class _ItemsListPageState extends State<ItemsListPage> {
  final repository = getIt.get<ItemRepository>();

  int offset = 0;
  final int limit = 20;
  bool hasNextPage = true;
  bool isFirstLoadRunning = false;
  bool isLoadMoreRunning = false;

  final List<Item> itemList = [];

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

    final data = await repository.getItems(offset, limit);
    if (data.isNotEmpty) {
      setState(() {
        itemList.addAll(data);
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

      final data = await repository.getItems(offset, limit);
      if (data.isNotEmpty) {
        setState(() {
          itemList.addAll(data);
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
          title: 'Items',
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
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                final item = itemList[index];
                return _BuildSingleItem(
                  item: item,
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

class _BuildSingleItem extends StatelessWidget {
  const _BuildSingleItem({Key? key, required this.item}) : super(key: key);

  final Item item;

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
            CachedNetworkImage(
              imageUrl: item.sprites?.image ?? '',
              placeholder: (context, url) => const Center(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
            Expanded(
              child: Text(
                item.name.toString().capitalize(),
                style: PrimaryFont.medium(19),
              ),
            ),
            Text(
              item.cost.toString(),
              style: PrimaryFont.book(15).copyWith(color: kColorSecondaryText),
            ),
            const SizedBox(
              width: 5,
            ),
            Image.asset(ImageAssets.ic_item_count)
          ],
        ),
      ),
    );
  }
}
