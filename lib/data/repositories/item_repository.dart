import 'package:pokedex_app/data/model/item.dart';
import 'package:pokedex_app/data/network/api_service.dart';

abstract class ItemRepository {
  Future<List<Item>> getItems(int offset, int limit);
}

class DefaultItemRepository implements ItemRepository {
  final ApiService _apiService;

  DefaultItemRepository({required ApiService apiService}) :
      _apiService = apiService;

  @override
  Future<List<Item>> getItems(int offset, int limit) async {
    final data = await _apiService.getItems(offset, limit);
    final itemList = data.results;

    final List<Item> newItemList = [];

    await Future.forEach(itemList, (item) async {
      final itemData = await _apiService.getItem(item.name ?? '');
      newItemList.add(itemData);
    });

    return newItemList;
  }
}