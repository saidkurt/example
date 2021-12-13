import 'package:example/core/routes/app_routes_name.dart';
import 'package:example/view/discount%20menu/discount_menu.dart';
import 'package:example/view/discount%20menu/discount_menu_detail_page.dart';
import 'package:example/view/menudetailpage/menu_detail_page.dart';
import 'package:get/route_manager.dart';
import '../../view/menupage/menu_view.dart';
import '../../view/orderpage/order_page_dateil.view.dart';

class AppRoutes {
  static final pages = [
    GetPage(
      name: AppRouteName.initialRoute,
      page: () => MenuView(),
    ),
    GetPage(
      name: AppRouteName.menuPageDetail,
      page: () => MenuDetailPageView(),
    ),
    GetPage(
      name: AppRouteName.orderPageDetail,
      page: () => OrderPageDetail(),
    ),
    GetPage(
      name: AppRouteName.discontMenuDetail,
      page: () => DiscountMenuDetail(),
    ),
    GetPage(
      name: AppRouteName.discontMenu,
      page: () => DiscountMenu(),
    ),
  ];
}
