import 'package:equatable/equatable.dart';
import 'package:pokedex_app/data/model/pokemon.dart';

abstract class PokemonListState extends Equatable {
  const PokemonListState();
}

class PokemonListInitial extends PokemonListState {
  @override
  List<Object?> get props => [];
}
class PokemonListLoading extends PokemonListState {
  @override
  List<Object?> get props => [];
}
class PokemonListLoadingMore extends PokemonListState {
  @override
  List<Object?> get props => [];
}
class PokemonListLoaded extends PokemonListState {
  final List<Pokemon> pokemonList;

  const PokemonListLoaded(this.pokemonList);
  @override
  List<Object?> get props => [pokemonList];
}

class PokemonListError extends PokemonListState {
  final String? message;
  const PokemonListError(this.message);
  @override
  List<Object?> get props => [message];
}
