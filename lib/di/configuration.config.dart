// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../services/configuration_service.dart' as _i3;
import '../services/toxic_level_service.dart' as _i4;
import '../toxic_bot_service.dart' as _i6;
import 'modules/bot_module.dart' as _i5;
import 'modules/general_module.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $configureDependencies(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final generalModule = _$GeneralModule();
  final botModule = _$BotModule();
  await gh.singletonAsync<_i3.ConfigurationService>(
      () => generalModule.configurationService(),
      preResolve: true);
  gh.lazySingleton<_i4.ToxicLevelService>(() => botModule.toxicLevelService(),
      dispose: _i5.disposeToxicLevelService);
  gh.lazySingleton<_i6.ToxicBotDiscord>(
      () => botModule.toxicBotDiscord(
          get<_i6.ConfigurationService>(), get<_i4.ToxicLevelService>()),
      dispose: _i5.disposeToxicDiscordBot);
  return get;
}

class _$GeneralModule extends _i7.GeneralModule {}

class _$BotModule extends _i5.BotModule {}
