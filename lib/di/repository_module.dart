import 'package:pokedex_app/data/network/api_service.dart';
import 'package:pokedex_app/data/repositories/item_repository.dart';
import 'package:pokedex_app/data/repositories/move_repository.dart';
import 'package:pokedex_app/data/repositories/pokemon_repository.dart';
import 'package:pokedex_app/di/injection.dart';

abstract class RepositoryModule {
  static Future<void> init() async {
    getIt
    ..registerLazySingleton<PokemonRepository>(() => providePokemonRepository(getIt()))
    ..registerLazySingleton<MoveRepository>(() => provideMoveRepository(getIt()))
    ..registerLazySingleton<ItemRepository>(() => provideItemRepository(getIt()));
  }

  static PokemonRepository providePokemonRepository(ApiService apiService) {
    return DefaultPokemonRepository(apiService: apiService);
  }

  static MoveRepository provideMoveRepository(ApiService apiService) {
    return DefaultMoveRepository(apiService: apiService);
  }

  static ItemRepository provideItemRepository(ApiService apiService) {
    return DefaultItemRepository(apiService: apiService);
  }
}