import 'package:dio/dio.dart';
import 'package:dio_http_cache_lts/dio_http_cache_lts.dart';
import 'package:pokedex_app/data/network/api_service.dart';
import 'package:pokedex_app/di/injection.dart';

abstract class RemoteModule {
  static Future<void> init() async {
    getIt
      ..registerLazySingleton<Dio>(() => provideDioClient())
      ..registerLazySingleton<ApiService>(() => provideApiService(getIt()));
  }

  static Dio provideDioClient() {
    final dio = Dio();

    dio
    ..options.baseUrl = 'https://pokeapi.co/api/v2/'
      ..options.receiveTimeout = 15000
      ..options.sendTimeout = 15000
      ..options.headers = {'Content-Type': 'application/json; charset=utf-8'}
      ..interceptors.add(LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
      ))
      ..interceptors.add(
          DioCacheManager(CacheConfig(baseUrl: 'https://pokeapi.co/api/v2/'))
              .interceptor);
    return dio;
  }

  static ApiService provideApiService(Dio dio) {
    return ApiService(dio);
  }
}
