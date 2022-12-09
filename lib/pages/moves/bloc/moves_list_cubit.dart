import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_app/data/repositories/move_repository.dart';
import 'package:pokedex_app/pages/moves/bloc/moves_list_state.dart';

class MovesListCubit extends Cubit<MovesListState> {
  late MoveRepository _moveRepository;

  MovesListCubit({required MoveRepository moveRepository}):super(MovesListInitial()) {
    _moveRepository = moveRepository;
  }

  Future<void> getMoveList(int offset, int limit) async {
    try {
      emit(MovesListLoading());
      final moveList = await _moveRepository.getMoves(offset, limit);
      emit(MovesListLoaded(moveList));
    } on Exception catch (_, ex) {
      emit(MovesListError(ex.toString()));
    }
  }

  Future<void> getMoreMoveList(int offset, int limit) async {
    try {
      emit(MovesListLoadingMore());
      final moveList = await _moveRepository.getMoves(offset, limit);
      emit(MovesListLoaded(moveList));
    } on Exception catch (_, ex) {
      emit(MovesListError(ex.toString()));
    }
  }
}