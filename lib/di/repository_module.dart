import 'package:pokedex_app/data/network/api_service.dart';
import 'package:pokedex_app/data/repositories/pokemon_repository.dart';
import 'package:pokedex_app/di/injection.dart';

abstract class RepositoryModule {
  static Future<void> init() async {
    getIt
    .registerLazySingleton<PokemonRepository>(() => providePokemonRepository(getIt()));
  }

  static PokemonRepository providePokemonRepository(ApiService apiService) {
    return DefaultPokemonRepository(apiService: apiService);
  }
}