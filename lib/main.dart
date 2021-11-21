import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uitest/Router/nav_router.dart';
import 'package:uitest/Router/route_constant.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UI Test',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      getPages: NavRouter.generateRoute,
      initialRoute: view,
    );
  }
}
