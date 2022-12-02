import 'package:get_it/get_it.dart';
import 'package:pokedex_app/di/remote_module.dart';
import 'package:pokedex_app/di/repository_module.dart';

final getIt = GetIt.instance;

Future<void> setupDI() async {
  await RemoteModule.init();
  await RepositoryModule.init();
}