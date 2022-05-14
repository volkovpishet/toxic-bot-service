import 'dart:async';

class ToxicLevelService {
  final StreamController<int> _toxicLevelController =
      StreamController.broadcast();

  Stream<int> get toxicLevelStream => _toxicLevelController.stream;

  void updateToxicLevel(int level) {
    _toxicLevelController.add(level);
  }

  void dispose() {
    _toxicLevelController.close();
  }
}
