import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:trotters/mongo.dart';
import 'package:trotters/route/approute.dart';
import 'package:trotters/route/routing.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    loadadmin();
  }

  Future<void> loadadmin() async {
    await MongoDatabase.adminLogin();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.splash,
      getPages: AppRouter().getPages,
      transitionDuration: const Duration(milliseconds: 600),
    );
  }
}
