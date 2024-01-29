import 'package:get/state_manager.dart';

class GlobalController extends GetxController {
  final RxDouble _watchSize = 0.0.obs;

  RxDouble getWatchSize() => _watchSize;

  @override
  void onInit() {
    _watchSize.value = 1080.0;

    super.onInit();
  }

  void updateWatchSize(double widthScreen) {
    _watchSize.value = 1080.0;
    double maxScreen = 1080;
    // If widthScreen <       0   : _watchSize = 0;
    // if widthScreen > maxScreen : _watchSize = maxScreen;
    _watchSize.value = widthScreen.clamp(0, maxScreen);
  }
}
