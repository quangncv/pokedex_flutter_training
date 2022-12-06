import 'package:pokedex_app/data/model/response/move_response.dart';
import 'package:pokedex_app/data/network/api_service.dart';

abstract class MoveRepository {
  Future<List<MoveResponse>> getMoves(int offset, int limit);
}

class DefaultMoveRepository implements MoveRepository {
  final ApiService _apiService;
  DefaultMoveRepository({required ApiService apiService}) :
      _apiService = apiService;

  @override
  Future<List<MoveResponse>> getMoves(offset, limit) async {
    final data = await _apiService.getMoves(offset, limit);
    final moveList = data.results;

    final List<MoveResponse> newMoveList = [];

    await Future.forEach(moveList, (move) async {
      final moveData = await _apiService.getMove(move.name ?? '');
      newMoveList.add(moveData);
    });

    return newMoveList;
  }
}