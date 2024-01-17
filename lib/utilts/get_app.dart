import 'package:device_apps/device_apps.dart';

class GetApp {
  static Future<List<Application>> getInstalledApplications() async {
    List<Application> apps = await DeviceApps.getInstalledApplications(
      includeAppIcons: true,
      includeSystemApps: true,
      onlyAppsWithLaunchIntent: true,
    );

    List<Application> filteredApps = apps;

    // ignore: unused_local_variable
    List<String> myApps = [
      'watch_laucher',
      'Chrome',
      'YouTube',
      'Maps',
      'Settings',
      'Google',
      'Google Play Store',
      'Contact',
      'Camera',
      'Gmail',
      'Drive',
      'Phone',
      'Pixel Launcher',
      'Calendar',
      'Bluetooth'
    ];
    List<String> ignoreKeyWords = [
      'services',
    ];

// Find app which is in the list
    // filteredApps = apps.where((app) => myApps.contains(app.appName)).toList();

// Ignore App which has any of the keywords in the name
    filteredApps = apps
        .where(
            (app) => !ignoreKeyWords.any((word) => app.appName.contains(word)))
        .toList();
    return filteredApps;
  }
}
