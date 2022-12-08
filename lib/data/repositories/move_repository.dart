import 'package:pokedex_app/data/model/move.dart';
import 'package:pokedex_app/data/network/api_service.dart';

abstract class MoveRepository {
  Future<List<Move>> getMoves(int offset, int limit);
}

class DefaultMoveRepository implements MoveRepository {
  final ApiService _apiService;
  DefaultMoveRepository({required ApiService apiService}) :
      _apiService = apiService;

  @override
  Future<List<Move>> getMoves(offset, limit) async {
    final data = await _apiService.getMoves(offset, limit);
    final moveList = data.results;

    final List<Move> newMoveList = [];

    await Future.forEach(moveList, (move) async {
      final moveData = await _apiService.getMove(move.name ?? '');
      newMoveList.add(moveData.toDisplayModel());
    });

    return newMoveList;
  }
}