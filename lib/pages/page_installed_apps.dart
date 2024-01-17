import 'package:flutter/material.dart';
import 'package:android_intent_plus/android_intent.dart';
import 'package:device_apps/device_apps.dart';

import '../template/page_template.dart';

class PageInstalledApps extends StatelessWidget {
  final Future<List<Application>> apps;

  const PageInstalledApps({Key? key, required this.apps}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PageTemplate(child: CircleApp(apps: apps));
  }
}

class CircleApp extends StatelessWidget {
  final Future<List<Application>> apps;

  const CircleApp({Key? key, required this.apps}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              return Center(
                child: ClipOval(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    alignment: Alignment.topLeft,
                    // padding: const EdgeInsets.only(left: 8),
                    decoration: const BoxDecoration(color: Colors.green),
                    child: ListView.builder(
                      itemCount: installedApps.length,
                      itemBuilder: (context, index) {
                        Application app = installedApps[index];
                        return Container(
                          // height: 60,
                          padding: const EdgeInsets.only(left: 20),
                          margin: const EdgeInsets.only(bottom: 20),
                          decoration: const BoxDecoration(color: Colors.green),
                          // color: Colors.amber,
                          child: ListTile(
                            leading: app is ApplicationWithIcon
                                ? CircleAvatar(
                                    radius: 30,
                                    backgroundImage: MemoryImage(app.icon),
                                  )
                                : null,
                            title: Text(app.appName,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            // subtitle: Text('Package: ${app.packageName}'),
                            onTap: () => _openApp(app),
                          ),
                        );
                      },
                    ),
                  ),
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
}

Future<void> _openApp(Application app) async {
  AndroidIntent intent = AndroidIntent(
    action: 'android.intent.action.MAIN',
    package: app.packageName,
  );
  await intent.launch();
}
