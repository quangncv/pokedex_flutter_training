import 'package:equatable/equatable.dart';
import 'package:pokedex_app/data/model/move.dart';

abstract class MovesListState extends Equatable {
  const MovesListState();
}

class MovesListInitial extends MovesListState {
  @override
  List<Object?> get props => [];
}

class MovesListLoading extends MovesListState {
  @override
  List<Object?> get props => [];
}

class MovesListLoadingMore extends MovesListState {
  @override
  List<Object?> get props => [];
}

class MovesListLoaded extends MovesListState {
  final List<Move> moveList;

  const MovesListLoaded(this.moveList);

  @override
  List<Object?> get props => [];
}

class MovesListError extends MovesListState {
  final String? message;
  const MovesListError(this.message);
  @override
  List<Object?> get props => [message];
}