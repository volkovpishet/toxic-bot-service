import 'package:injectable/injectable.dart';

import 'configuration.config.dart';
import 'locator.dart';

@InjectableInit(
  generateForDir: ['lib'],
  initializerName: r'$configureDependencies',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configureDependencies() => $configureDependencies(locator);
