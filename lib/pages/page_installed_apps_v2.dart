import 'package:flutter/material.dart';
import 'package:android_intent_plus/android_intent.dart';
import 'package:device_apps/device_apps.dart';

import 'package:get/get.dart';
import 'package:watch_launcher/controller.dart';

import '../template/page_template.dart';
import '../utilts/bubble_len.dart';

class PageInstalledAppsV2 extends StatelessWidget {
  final Future<List<Application>> apps;

  const PageInstalledAppsV2({Key? key, required this.apps}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PageTemplate(color: Colors.white, child: CircleApp(apps: apps));
  }
}

class CircleApp extends StatelessWidget {
  final Future<List<Application>> apps;

  const CircleApp({Key? key, required this.apps}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalController globalController =
        Get.put(GlobalController(), permanent: true);

    double watchSize = (globalController.getWatchSize().value);

    return Scaffold(
      body: FutureBuilder<List<Application>>(
        future: apps,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Error loading installed apps'),
              );
            } else {
              List<Application> installedApps = snapshot.data!;
              return PageTemplate(
                child: Center(
                  child: BubbleLens(
                      width: watchSize,
                      height: watchSize,
                      size: watchSize * 0.25,
                      paddingX: watchSize * 0.012,
                      paddingY: watchSize * 0.01,
                      color: Colors.black,
                      widgets: installedApps.map((app) {
                        return GestureDetector(
                          onTap: () {
                            _openApp(app);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: Image.asset(
                                  'lib/assets/bg_icon.png', // Replace with the actual path to your image asset
                                ).image,
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Center(
                              child: Container(
                                width: watchSize * 0.16,
                                height: watchSize * 0.16,
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
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<void> _openApp(Application app) async {
    AndroidIntent intent = AndroidIntent(
      action: 'android.intent.action.MAIN',
      package: app.packageName,
    );
    await intent.launch();
  }
}
