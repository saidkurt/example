import 'dart:convert';

import 'package:example/model/order_model.dart';
import 'package:example/view/menudetailpage/menu_detail_page.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:yaml/yaml.dart';

class MenuController extends GetxController {
  final RxMap _menuModel = Map().obs;
  final RxList _mainMenuModel = [].obs;
  final RxList selectedMainMenuItem = [].obs;
  final RxString selectedAppBarTitle = "Menü".obs;
  final RxList<OrderModel> selectedBasketItem = <OrderModel>[].obs;
  final RxDouble totalPrice = 0.0.obs;
  RxList discountMenuSelectedChooseItem = [].obs;
  final RxInt selectLenght = 1.obs;
  final RxInt selectedIndex = 1.obs;
  final RxBool selectedImage = false.obs;
  RxInt selectedDiscountImagePathIndex = 0.obs;
  final RxList<Map<int, int>> indexControl = [
    {0: 0}
  ].obs;

  Map get menuModel => _menuModel.value;
  List get mainMenuModel => _mainMenuModel.value;

  Future<dynamic> loaddata() async {
    final data = await rootBundle.loadString('assets/menu.yaml');
    _menuModel.value = loadYaml(data);
    _mainMenuModel.value = _menuModel.value['menus'][0]['items'];
  }

  void discountMenuChoose(List value) {
    List discountMenu = menuModel['menus'];
    for (int i = 0; i < value.length; i++) {
      for (int j = 0; j < discountMenu.length; j++) {
        if (value[i] == discountMenu[j]['key']) {
          discountMenuSelectedChooseItem.add(discountMenu[j]);
        }
      }
    }
  }

  void createIndexControl(int lenght) {
    for (int i = 0; i < lenght; i++) {
      // print(i);
      indexControl.add({i: 0});
    }
    //print(indexControl.length);
  }

  void checkIndexControl(int index, int item) {
    indexControl.value[index].update(index, (value) => item);
  }

  void checkAction(int index) {
    selectedIndex.value = index + 1;
    if ((discountMenuSelectedChooseItem.length == selectedIndex.value)) {
      null;
    } else {
      if (selectLenght.value == selectedIndex.value) {
        selectLenght.value += 1;
      }
    }
  }

  void addBasketItemOrder(
      String name, double price, String imagePath, String caption) {
    totalPrice.value += price;
    selectedBasketItem.value.add(OrderModel(
        name: name, price: price, imagePath: imagePath, caption: caption));
  }

  void deleteBasketItem(OrderModel orderModel) {
    totalPrice.value -= orderModel.price!;
    selectedBasketItem.remove(orderModel);
  }

  @override
  void onInit() {
    loaddata();

    super.onInit();
  }
}
