import 'package:get/get.dart';
import 'package:trotters/home.dart';

import 'package:trotters/route/routing.dart';
import 'package:trotters/splashscreen.dart';

class AppRouter {
  final getPages = <GetPage>[
    GetPage(name: AppRoute.home, page: () => const homeScreen()),
    GetPage(name: AppRoute.splash, page: () => const splashScreen())
  ];
}
