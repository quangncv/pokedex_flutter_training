import 'package:dio/dio.dart';
import 'package:pokedex_app/data/model/item.dart';
import 'package:pokedex_app/data/model/move.dart';
import 'package:pokedex_app/data/model/page_response.dart';
import 'package:pokedex_app/data/model/pokemon.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/pokemon")
  Future<PageResponse<Pokemon>> getPokemons(@Query('offset') int offset, @Query('limit') int limit);
  @GET("/pokemon/{name}")
  Future<Pokemon> getPokemon(@Path('name') String name);

  @GET("/move")
  Future<PageResponse<Move>> getMoves(@Query('offset') int offset, @Query('limit') int limit);
  @GET('/move/{name}')
  Future<Move> getMove(@Path('name') String name);

  @GET("/item")
  Future<PageResponse<Item>> getItems(@Query('offset') int offset, @Query('limit') int limit);
  @GET("/item/{name}")
  Future<Item> getItem(@Path('name') String name);
}