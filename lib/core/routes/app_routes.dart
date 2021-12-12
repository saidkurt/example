import 'package:example/core/routes/app_routes_name.dart';
import 'package:get/route_manager.dart';
import '../../view/menupage/menu_view.dart';

class AppRoutes {
  static final pages = [
    GetPage(
      name: AppRouteName.initialRoute,
      page: () => MenuView(),
    ),
  ];
}
