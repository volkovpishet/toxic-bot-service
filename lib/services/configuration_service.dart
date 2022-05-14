import 'package:dotenv/dotenv.dart';

class ConfigurationService {
  final DotEnv _dotEnv;

  ConfigurationService._(this._dotEnv);

  static Future<ConfigurationService> init() async {
    final env = DotEnv(includePlatformEnvironment: true)..load();

    return ConfigurationService._(env);
  }

  int get serverPort => int.parse(_dotEnv['SERVER_PORT'] ?? '8080');

  String get discordBotToken => _dotEnv['DISCORD_BOT_TOKEN'] ?? '';

  int? get discordChannelId => int.parse(_dotEnv['DISCORD_CHANNEL_ID'] ?? '');
}
