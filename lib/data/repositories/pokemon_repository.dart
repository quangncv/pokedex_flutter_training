import 'package:pokedex_app/data/model/pokemon.dart';
import 'package:pokedex_app/data/network/api_service.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> getPokemons(int offset, int limit);
}

class DefaultPokemonRepository implements PokemonRepository {
  final ApiService _apiService;

  DefaultPokemonRepository({required ApiService apiService})
      : _apiService = apiService;

  @override
  Future<List<Pokemon>> getPokemons(int offset, int limit) async {
    final data = await _apiService.getPokemons(offset, limit);
    final pokemonList = data.results;

    final List<Pokemon> newPokemonList = [];

    await Future.forEach(pokemonList, (pokemon) async {
      final pokemonData = await _apiService.getPokemon(pokemon.name ?? "");
      newPokemonList.add(pokemonData);
    });
    return newPokemonList;
  }
}
