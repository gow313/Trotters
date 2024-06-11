import 'package:get/get.dart';
import 'package:trotters/home.dart';

import 'package:trotters/route/routing.dart';

class AppRouter {
  final getPages = <GetPage>[
    GetPage(name: AppRoute.home, page: () => const homeScreen())
  ];
}
