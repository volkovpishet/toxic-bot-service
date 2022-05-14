import 'package:injectable/injectable.dart';
import 'package:toxic_bot_service/services/toxic_level_service.dart';
import 'package:toxic_bot_service/toxic_bot_service.dart';

void disposeToxicLevelService(ToxicLevelService instance) {
  instance.dispose();
}

void disposeToxicDiscordBot(ToxicBotDiscord instance) {
  instance.dispose();
}

@module
abstract class BotModule {
  @LazySingleton(dispose: disposeToxicLevelService)
  ToxicLevelService toxicLevelService() => ToxicLevelService();

  @LazySingleton(dispose: disposeToxicDiscordBot)
  ToxicBotDiscord toxicBotDiscord(
    ConfigurationService configurationService,
    ToxicLevelService toxicLevelService,
  ) =>
      ToxicBotDiscord(
        configurationService,
        toxicLevelService,
      );
}
