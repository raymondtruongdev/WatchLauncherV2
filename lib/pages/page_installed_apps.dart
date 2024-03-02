import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:device_apps/device_apps.dart';
import 'package:get/get.dart';
import 'package:watch_launcher/controller/controller.dart';
import '../template/page_template.dart';
import '../utilts/bubble_len.dart';

class PageInstalledApps extends StatelessWidget {
  const PageInstalledApps({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageTemplate(color: Colors.white, child: CircleApp());
  }
}

class CircleApp extends StatelessWidget {
  const CircleApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalController globalController =
        Get.put(GlobalController(), permanent: true);

    double watchSize = (globalController.getWatchSize());
    // We design a watch at 390 resolution, for other screen will be scale to 390
    double scaleRatio = watchSize / 390;
    return Obx(() => globalController.appTotal < 0
        ? Container()
        : Scaffold(
            body: PageTemplate(
            child: Center(
              child: BubbleLens(
                  width: watchSize,
                  height: watchSize,
                  size: 100 * scaleRatio,
                  paddingX: 5 * scaleRatio,
                  paddingY: 4 * scaleRatio,
                  color: Colors.black,
                  widgets: globalController.getInstalledAppList().map((app) {
                    return GestureDetector(
                      onTap: () {
                        _openApp(app);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: Image.asset(
                              'lib/assets/bg_icon795px.png',
                            ).image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Center(
                          child: Container(
                            width: 55 * scaleRatio,
                            height: 55 * scaleRatio,
                            decoration: BoxDecoration(
                              image: (app is ApplicationWithIcon)
                                  ? DecorationImage(
                                      image: MemoryImage(app.icon),
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList()),
            ),
          )));
  }

  Future<void> _openApp(Application app) async {
    await LaunchApp.openApp(
      androidPackageName: app.packageName,
      iosUrlScheme: '//',
      appStoreLink:
          ('https://play.google.com/store/apps/details?id=${app.packageName}&hl=en&gl=US'),
    );

    // print(' apkFilePath: ${app.apkFilePath}');
    // print(' appName: ${app.appName}');
    // print(' category_name: ${app.category.name}');
    // print(' packageName: ${app.packageName}');
    // print(' dataDir: ${app.dataDir}');
    // print(' enabled: ${app.enabled}');
  }
}
