import 'package:get/get.dart';
import 'package:trotters/adminpannelscreen.dart';
import 'package:trotters/adminscreen.dart';
import 'package:trotters/home.dart';

import 'package:trotters/route/routing.dart';
import 'package:trotters/splashscreen.dart';

class AppRouter {
  final getPages = <GetPage>[
    GetPage(
        name: AppRoute.home,
        page: () => const homeScreen(),
        transitionDuration: Duration(seconds: 3),
        transition: Transition.leftToRightWithFade),
    GetPage(name: AppRoute.splash, page: () => const splashScreen()),
    GetPage(name: AppRoute.admin, page: () => const Adminscreen()),
    GetPage(name: AppRoute.adminpannel, page: () => const Adminpannelscreen())
  ];
}
