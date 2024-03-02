import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:watch_launcher/clock_widget/widget_demo.dart';
import 'package:watch_launcher/pages/page_installed_apps.dart';
import 'package:watch_launcher/pages/page_watchface.dart';
import 'package:watch_launcher/utilts/get_app.dart';
import 'package:watch_launcher/utilts/logger_custom.dart';

class GlobalController extends GetxController {
  @override
  // ignore: unnecessary_overrides
  void onInit() {
    super.onInit();
    updateInstalledAppList();
  }

  // ==================== Variables ============================================
  final RxInt _indexWatchFace = 0.obs;
  final RxInt appTotal = 0.obs;
  late double _watchSize = 1080.0;
  double widthScreenDevice = 0.0;
  double heightScreenDevice = 0.0;
  double _scaleRatio = 0.0;
  bool _isCircleDevice = false;

  late List<Widget> _watchFaceList = [];
  late Widget pageInstalledApp;
  List<Application> installedAppList = [];
  late List<Widget> launcherPages = [];

// ==================== Getters ============================================
  List<Widget> getWatchFaceList() => _watchFaceList;
  Widget getPageInstalledApp() => pageInstalledApp;
  List<Application> getInstalledAppList() => installedAppList;
  RxInt getIndexWatchFace() => _indexWatchFace;
  double getWatchSize() => _watchSize;
  double getScaleRatio() => _scaleRatio;
  bool isCircleDevice() => _isCircleDevice;

// ==================== Setters ============================================
  void updateInstalledAppList() async {
    // installedAppList = GetApp.getInstalledApplications();

    Future<List<Application>> appsFuture = GetApp.getInstalledApplications();
    await appsFuture.then((value) {
      if (value.isNotEmpty) {
        installedAppList = value;
        int numberOfApps = value.length;
        print('Number of installed apps: $numberOfApps');
        appTotal.value = numberOfApps;
      }
    });
  }

  void setPageInstalledApp() async {
    pageInstalledApp = const PageInstalledApps();
  }

  void setIndexWatchFace(int newIndexWatchFace) {
    _indexWatchFace.value = newIndexWatchFace;
  }

  void setWatchFaceList(List<Widget> newWatchFaceList) {
    _watchFaceList = newWatchFaceList;
  }

// ==================== Uitlilty Functions ============================================
  void updateWatchSize(double widthScreen, double heightScreen) {
    // final CustomLogger logger = CustomLogger();
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
      // logger.warning('This is circle device');
    } else {
      _isCircleDevice = false;
      // logger.warning('This is NOT circle device');
    }
    // logger.debug('widthScreen Controller: $widthScreen');
    // logger.debug('heightScreen Controller: $heightScreen');
    // logger.debug('ScreenIsCircle Controller: $_isCircleDevice()');

    widthScreenDevice = widthScreen;
    heightScreenDevice = heightScreen;
  }

  void createLauncherPages() {
    launcherPages = [
      const WidgetTextCircleV2(
          // text: 'Wellness',
          color: Colors.green,
          imageBg: 'lib/assets/tempImages/tempWellness.png'),
      const PageWatchFace(),
      const WidgetTextCircleV2(
        text: 'Weather',
        color: Colors.red,
        imageBg: 'lib/assets/tempImages/tempWeather.png',
      ),
      // PageInstalledApps(apps: globalController.getInstalledAppList()),
      const WidgetTextCircleV2(
          // text: 'GoogleMap',
          color: Colors.green,
          imageBg: 'lib/assets/tempImages/tempGoogleMap.png'),
      const WidgetTextCircleV2(
          // text: 'Workout',
          color: Colors.green,
          imageBg: 'lib/assets/tempImages/tempLiveWorkout.png'),
      const WidgetTextCircleV2(
          // text: 'Music',
          color: Colors.green,
          imageBg: 'lib/assets/tempImages/tempMusic.png'),
      // WidgetTextButtonCircle(
      //     text: 'Comming Soon',
      //     color: Colors.white,
      //     textButton: 'Add Page',
      //     onPressed: () {
      //       addNewPage();
      //     }),
    ];
  }

  void addNewLauncherPage() {
    // Add new page into pages list
    launcherPages.add(WidgetTextCircle(
        text: 'NEW PAGE (${launcherPages.length + 1})', color: Colors.orange));
    // Go to the second page (index 1)
    // _pageController.animateToPage(2,
    //     duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}
