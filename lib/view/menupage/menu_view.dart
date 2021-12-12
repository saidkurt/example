import 'package:example/controller/menu_controller.dart';
import 'package:example/view/global/spinkit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../global/app_bar.dart';
import 'widget/menu_listview_builder.dart';

class MenuView extends StatelessWidget {
  MenuView({Key? key}) : super(key: key);

  final menuController = Get.put(MenuController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Obx(
        () => menuController.mainMenuModel.isEmpty
            ? const CustomSpinKit()
            : MenuListViewBuilder(
                menuList: menuController.mainMenuModel,
              ),
      ),
    );
  }
}
