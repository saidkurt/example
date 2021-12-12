import 'package:example/view/menudetailpage/menu_detail_page.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:yaml/yaml.dart';

class MenuController extends GetxController {
  final RxMap _menuModel = Map().obs;
  final RxList _mainMenuModel = [].obs;
  final RxList selectedMainMenuItem = [].obs;

  Map get menuModel => _menuModel.value;
  List get mainMenuModel => _mainMenuModel.value;

  void transitionMenuDetailPage() {
    Get.to(() => MenuDetailPageView());
  }

  Future<dynamic> loaddata() async {
    final data = await rootBundle.loadString('assets/menu.yaml');
    _menuModel.value = loadYaml(data);
    _mainMenuModel.value = _menuModel.value['menus'][0]['items'];
  }

  @override
  void onInit() {
    loaddata();
    super.onInit();
  }
}
