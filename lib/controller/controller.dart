import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class GlobalController extends GetxController {
  final RxDouble _watchSize = 0.0.obs;
  final RxInt _indexWatchFace = 0.obs;
  late List<Widget> _watchFaceList = [];
  late Widget pageInstalledApp;

  RxDouble getWatchSize() => _watchSize;
  RxInt getIndexWatchFace() => _indexWatchFace;
  List<Widget> getWatchFaceList() => _watchFaceList;
  Widget getPageInstallApp() => pageInstalledApp;

  @override
  void onInit() {
    _watchSize.value = 1080.0;

    super.onInit();
  }

  void setPageInstalledApp(Widget newpage) {
    pageInstalledApp = newpage;
  }

  void setIndexWatchFace(int newIndexWatchFace) {
    _indexWatchFace.value = newIndexWatchFace;
  }

  void setWatchFaceList(List<Widget> newWatchFaceList) {
    _watchFaceList = newWatchFaceList;
  }

  void updateWatchSize(double widthScreenDevice) {
    // If widthScreenDevice <       0   : _watchSize = 0;
    // If widthScreenDevice > maxScreen : _watchSize = maxScreen;
    // If 0 <= widthScreenDevice <= maxScreen : _watchSize = widthScreenDevice;
    double maxScreen = 1080.0; // 384.0;
    _watchSize.value = widthScreenDevice.clamp(0, maxScreen);
  }
}
