// ignore_for_file: invalid_use_of_protected_member

import 'package:example/controller/menu_controller.dart';
import 'package:example/core/const/app_const.dart';

import 'package:example/core/theme/app_theme.dart';
import 'package:example/view/global/app_bar.dart';
import 'package:example/view/global/menu_card.dart';
import 'package:example/view/menudetailpage/widget/money_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuDetailPageView extends StatelessWidget {
  MenuDetailPageView({Key? key, this.menuDetailList}) : super(key: key);

  List? menuDetailList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Seçim"),
      body: Obx(
        () => ListView.builder(
          itemCount:
              Get.find<MenuController>().selectedMainMenuItem.value.length,
          itemBuilder: (context, index) => Stack(
            children: [
              MenuCard(
                menuTitle: Get.find<MenuController>()
                    .selectedMainMenuItem
                    .value[index]["name"]
                    .toString(),
                textStyle: AppTheme.darkTheme.textTheme.headline1!.copyWith(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                imagePath: Get.find<MenuController>()
                    .selectedMainMenuItem
                    .value[index]["image"]
                    .toString(),
              ),
              Positioned(
                  right: 0,
                  bottom: 0,
                  child: MoneyWidget(
                    money: Get.find<MenuController>()
                        .selectedMainMenuItem
                        .value[index]["price"]
                        .toString(),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
