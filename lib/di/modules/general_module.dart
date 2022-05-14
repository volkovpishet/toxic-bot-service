import 'package:injectable/injectable.dart';

import '../../services/configuration_service.dart';

@module
abstract class GeneralModule {
  @singleton
  @preResolve
  Future<ConfigurationService> configurationService() =>
      ConfigurationService.init();
}
