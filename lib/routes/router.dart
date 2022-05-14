import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:toxic_bot_service/di/locator.dart';
import 'package:toxic_bot_service/services/toxic_level_service.dart';

part 'root_routes.dart';
part 'toxic_level_routes.dart';

class RoutesProvider {
  RoutesProvider();

  Router getRouter() => Router()
    ..get('/', _rootHandler)
    ..post('/toxic-level-updated', _toxicLevelUpdatedRoute);
}
