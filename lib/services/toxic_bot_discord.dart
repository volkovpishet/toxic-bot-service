import 'dart:async';

import 'package:nyxx/nyxx.dart';
import 'package:toxic_bot_service/services/toxic_level_service.dart';
import 'package:toxic_bot_service/toxic_bot_service.dart';

class ToxicBotDiscord {
  final ConfigurationService _configurationService;
  final ToxicLevelService _toxicLevelService;
  StreamSubscription? _toxicLevelSub;

  late INyxxWebsocket _bot;

  ToxicBotDiscord(
    this._configurationService,
    this._toxicLevelService,
  );

  void run() {
    _bot = NyxxFactory.createNyxxWebsocket(
      _configurationService.discordBotToken,
      GatewayIntents.allUnprivileged,
    )
      ..registerPlugin(Logging())
      ..registerPlugin(CliIntegration())
      ..registerPlugin(IgnoreExceptions())
      ..connect();

    _bot.eventsWs.onReady.listen(
      (_) {
        _toxicLevelSub =
            _toxicLevelService.toxicLevelStream.listen((toxicLevel) {
          for (final channel in _bot.channels.values) {
            final isSupportedChannelType =
                channel.channelType == ChannelType.text;
            final isSupportedChannel = channel.id.toString() ==
                _configurationService.discordChannelId?.toString();

            if (isSupportedChannelType &&
                isSupportedChannel &&
                channel is ITextChannel) {
              final message = MessageBuilder.content(
                'Воу! Уровень токсичности в офисе изменился. Теперь это ${toxicLevel + 1} уровень',
              );
              channel.sendMessage(message);
            }
          }
        });
      },
    );

    _bot.eventsWs.onMessageReceived.listen((e) {
      if (e.message.content == '!ping') {
        e.message.channel.sendMessage(MessageBuilder.content('Pong!'));
      }
    });
  }

  void dispose() {
    _toxicLevelSub?.cancel();
    _bot.dispose();
  }
}
