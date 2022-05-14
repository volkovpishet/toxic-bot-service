import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:toxic_bot_service/toxic_bot_service.dart';

void main(List<String> args) async {
  await configureDependencies();

  locator<ToxicBotDiscord>().run();
  await _initServer();
}

Future<void> _initServer() async {
  final ip = InternetAddress.anyIPv4;

  final router = RoutesProvider().getRouter();
  final handler = Pipeline().addMiddleware(logRequests()).addHandler(router);

  final configurationService = locator<ConfigurationService>();
  final server = await serve(handler, ip, configurationService.serverPort);

  print('Server listening on port ${server.port}');
}
