import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:watch_launcher/utilts/get_app.dart';
import 'package:watch_launcher/utilts/logger_custom.dart';

class GlobalController extends GetxController {
  @override
  // ignore: unnecessary_overrides
  void onInit() {
    super.onInit();
  }

  // ==================== Variables ============================================
  final RxInt _indexWatchFace = 0.obs;
  late double _watchSize = 1080.0;
  double widthScreenDevice = 0.0;
  double heightScreenDevice = 0.0;
  double _scaleRatio = 0.0;
  bool _isCircleDevice = false;

  late List<Widget> _watchFaceList = [];
  late Widget pageInstalledApp;
  late Future<List<Application>> installedAppList =
      GetApp.getInstalledApplications();

// ==================== Getters ============================================
  List<Widget> getWatchFaceList() => _watchFaceList;
  Widget getPageInstalledApp() => pageInstalledApp;
  Future<List<Application>> getInstalledAppList() => installedAppList;
  RxInt getIndexWatchFace() => _indexWatchFace;
  double getWatchSize() => _watchSize;
  double getScaleRatio() => _scaleRatio;
// ==================== Setters ============================================
  void setInstalledAppList(Future<List<Application>> appList) {
    installedAppList = appList;
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

// ==================== Uitlilty Functions ============================================
  void updateWatchSize(double widthScreen, double heightScreen) {
    final CustomLogger logger = CustomLogger();
    // If widthScreen <       0   : _watchSize = 0;
    // If widthScreen > maxScreen : _watchSize = maxScreen;
    // If 0 <= widthScreen <= maxScreen : _watchSize = widthScreen;
    double maxScreen = 1080.0;
    _watchSize = widthScreen.clamp(0, maxScreen);

    double defaultWatchSize = 390;

    _scaleRatio = _watchSize.toDouble() / defaultWatchSize;

    if (heightScreen <= widthScreen * 1.1) {
      // heigth < 110% of width => circle face
      _isCircleDevice = true;
      logger.warning('This is circle device');
    } else {
      _isCircleDevice = false;
      logger.warning('This is NOT circle device');
    }
    logger.debug('widthScreen Controller: $widthScreen');
    logger.debug('heightScreen Controller: $heightScreen');
    logger.debug('ScreenIsCircle Controller: $_isCircleDevice()');

    widthScreenDevice = widthScreen;
    heightScreenDevice = heightScreen;
  }
}
