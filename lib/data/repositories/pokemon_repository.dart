import 'dart:developer';

import 'package:pokedex_app/data/model/pokemon.dart';
import 'package:pokedex_app/data/model/response/pokemon_response.dart';
import 'package:pokedex_app/data/model/response/species_response.dart';
import 'package:pokedex_app/data/model/response/type_response.dart';
import 'package:pokedex_app/data/network/api_service.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> getPokemons(int offset, int limit);

  Future<Pokemon> getInfoPokemon(Pokemon pokemon);
}

class DefaultPokemonRepository implements PokemonRepository {
  final ApiService _apiService;

  DefaultPokemonRepository({required ApiService apiService})
      : _apiService = apiService;

  @override
  Future<List<Pokemon>> getPokemons(int offset, int limit) async {
    final data = await _apiService.getPokemons(offset, limit);
    final pokemonList = data.results;

    final List<PokemonResponse> newPokemonList = [];

    await Future.forEach(pokemonList, (pokemon) async {
      final pokemonData = await _apiService.getPokemon(pokemon.name ?? "");
      newPokemonList.add(pokemonData);
    });
    return newPokemonList.map((e) => e.toDisplayModel()).toList();
  }

  @override
  Future<Pokemon> getInfoPokemon(Pokemon pokemon) async {
    final speciesData = await _apiService.getSpecies(pokemon.id ?? 0);
    pokemon.species = speciesData.getDesc();
    pokemon.eggGroups = speciesData.eggGroups?.map((e) => e.name.toString()).toList();
    pokemon.hatchCounter = speciesData.hatchCounter;
    pokemon.genderRate = speciesData.genderRate;
    pokemon.habitat = speciesData.habitat?.name;
    pokemon.generation = speciesData.generation?.name;
    pokemon.captureRate = speciesData.captureRate;

    // Evolution
    final pathEvolutionUrl = speciesData.evolutionChain?.url?.split('/');
    final String? evolutionId = pathEvolutionUrl?[pathEvolutionUrl.length - 2];
    final evolutionData = await _apiService.getEvolution(evolutionId.toString());
    pokemon.evolutions = evolutionData.toEvolutionModel();

    // Weaknesses
    final typeData = await _apiService.getType(pokemon.mainType().name);
    pokemon.damageRelations = typeData.damageRelations;

    // Abilities
    final List<Ability> abilities = pokemon.abilities ?? [];
    final List<Ability> newAbilities = [];
    await Future.forEach(abilities, (ability) async {
      final abilityData = await _apiService.getAbility(ability.name ?? '');
      final abilityModel = Ability(name: ability.name, desc: abilityData.getDesc());
      newAbilities.add(abilityModel);
    });
    pokemon.abilities = newAbilities;

    // Moves
    final List<Move> moves = pokemon.moves ?? [];
    final List<Move> newMoves = [];
    await Future.forEach(moves, (move) async {
      final moveData = await _apiService.getMove(move.name);
      final moveModel = Move(moveData.name ?? '', move.level, moveData.type?.name);
      newMoves.add(moveModel);
    });
    pokemon.moves = newMoves;

    return pokemon;
  }
}
