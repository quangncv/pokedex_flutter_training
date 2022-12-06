import 'package:dio/dio.dart';
import 'package:pokedex_app/data/model/response/ability_detail_response.dart';
import 'package:pokedex_app/data/model/response/evolution_response.dart';
import 'package:pokedex_app/data/model/response/item_response.dart';
import 'package:pokedex_app/data/model/response/move_response.dart';
import 'package:pokedex_app/data/model/response/page_response.dart';
import 'package:pokedex_app/data/model/response/pokemon_response.dart';
import 'package:pokedex_app/data/model/response/species_response.dart';
import 'package:pokedex_app/data/model/response/type_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/pokemon")
  Future<PageResponse<PokemonResponse>> getPokemons(@Query('offset') int offset, @Query('limit') int limit);
  @GET("/pokemon/{name}")
  Future<PokemonResponse> getPokemon(@Path('name') String name);

  @GET("/move")
  Future<PageResponse<MoveResponse>> getMoves(@Query('offset') int offset, @Query('limit') int limit);
  @GET('/move/{name}')
  Future<MoveResponse> getMove(@Path('name') String name);

  @GET("/item")
  Future<PageResponse<ItemResponse>> getItems(@Query('offset') int offset, @Query('limit') int limit);
  @GET("/item/{name}")
  Future<ItemResponse> getItem(@Path('name') String name);

  @GET("/pokemon-species/{id}")
  Future<SpeciesResponse> getSpecies(@Path('id') int id);
  @GET("/type/{name}")
  Future<TypeResponse> getType(@Path('name') String name);
  @GET("/ability/{name}")
  Future<AbilityDetailResponse> getAbility(@Path('name') String name);
  @GET("/evolution-chain/{id}")
  Future<EvolutionResponse> getEvolution(@Path('id') String id);
}