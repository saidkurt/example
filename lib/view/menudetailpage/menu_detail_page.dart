// ignore_for_file: invalid_use_of_protected_member

import 'package:example/controller/menu_controller.dart';
import 'package:example/core/theme/app_theme.dart';
import 'package:example/view/global/app_bar.dart';
import 'package:example/view/global/basket_widget.dart';
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
      appBar: CustomAppBar(),
      body: Obx(
        () => ListView.builder(
          itemCount:
              Get.find<MenuController>().selectedMainMenuItem.value.length,
          itemBuilder: (context, index) => Column(
            children: [
              Stack(
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
                    top: 20,
                    child: MoneyWidget(
                      title: Get.find<MenuController>()
                              .selectedMainMenuItem
                              .value[index]["price"]
                              .toString() +
                          " TL",
                    ),
                  ),
                  BasketWidget(
                    name: Get.find<MenuController>()
                        .selectedMainMenuItem
                        .value[index]["name"]
                        .toString(),
                    price: double.parse(Get.find<MenuController>()
                        .selectedMainMenuItem
                        .value[index]["price"]
                        .replaceFirst(",", ".")),
                    image: Get.find<MenuController>()
                        .selectedMainMenuItem
                        .value[index]["image"]
                        .toString(),
                    caption: Get.find<MenuController>()
                        .selectedMainMenuItem
                        .value[index]["caption"]
                        .toString(),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
