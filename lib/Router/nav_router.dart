import 'package:get/route_manager.dart';
import 'package:uitest/Designs/view.dart';
import 'package:uitest/Router/route_constant.dart';

class NavRouter {
  static final generateRoute = [
    GetPage(
      name: view,
      page: () => const View(),
    ),
  ];
}
