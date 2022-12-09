import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_app/data/repositories/pokemon_repository.dart';
import 'package:pokedex_app/pages/pokemon/bloc/pokemon_list_state.dart';

class PokemonListCubit extends Cubit<PokemonListState> {
  late PokemonRepository _pokemonRepository;

  PokemonListCubit({required PokemonRepository pokemonRepository}): super(PokemonListInitial()) {
    _pokemonRepository = pokemonRepository;
  }

  Future<void> getPokemonList(int offset, int limit) async {
    try {
      emit(PokemonListLoading());
      final pokemonList = await _pokemonRepository.getPokemons(offset, limit);
      emit(PokemonListLoaded(pokemonList));
    } on Exception catch (_, ex) {
      emit(PokemonListError(ex.toString()));
    }
  }

  Future<void> getMorePokemonList(int offset, int limit) async {
    try {
      emit(PokemonListLoadingMore());
      final pokemonList = await _pokemonRepository.getPokemons(offset, limit);
      emit(PokemonListLoaded(pokemonList));
    } catch (ex) {
      emit(PokemonListError(ex.toString()));
    }
  }
}