import 'package:dio/dio.dart';
import 'package:pokedex_app/data/model/page_response.dart';
import 'package:pokedex_app/data/model/pokemon.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://pokeapi.co/api/v2/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/pokemon")
  Future<PageResponse<Pokemon>> getPokemons();
  @GET("/pokemon/{name}")
  Future<Pokemon> getPokemon(@Path('name') String name);
}