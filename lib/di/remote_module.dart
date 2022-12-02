
import 'package:dio/dio.dart';
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
      ..options.baseUrl = 'https://nit-api-dev.tk/'
      ..options.connectTimeout = 15000
      ..options.receiveTimeout = 15000
      ..options.headers = {'Content-Type': 'application/json; charset=utf-8'}
      ..interceptors.add(LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
      ));
    return dio;
  }

  static ApiService provideApiService(Dio dio) {
    return ApiService(dio);
  }
}