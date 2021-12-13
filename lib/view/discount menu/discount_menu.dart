// ignore_for_file: invalid_use_of_protected_member

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:example/model/menu_model.dart';
import 'package:example/view/discount%20menu/discount_menu_detail_page.dart';
import 'package:example/view/global/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/menu_controller.dart';
import '../../core/theme/app_theme.dart';
import '../global/basket_widget.dart';
import '../global/menu_card.dart';
import '../menudetailpage/widget/money_widget.dart';

class DiscountMenu extends StatelessWidget {
  const DiscountMenu({Key? key}) : super(key: key);

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
                  Get.find<MenuController>().selectedMainMenuItem[index]
                              ['subMenus'] !=
                          null
                      ? Positioned(
                          right: 0,
                          bottom: 30,
                          child: GestureDetector(
                            onTap: () {
                              Get.find<MenuController>().indexControl.clear();
                              Get.find<MenuController>().createIndexControl(
                                  Get.find<MenuController>()
                                      .selectedMainMenuItem[index]['subMenus']
                                      .length);
                              print(Get.find<MenuController>()
                                  .indexControl
                                  .value);

                              Get.find<MenuController>().selectLenght.value = 1;
                              Get.find<MenuController>().selectedIndex.value =
                                  1;

                              Get.to(() => DiscountMenuDetail());
                              Get.find<MenuController>().discountMenuChoose(
                                  Get.find<MenuController>()
                                      .selectedMainMenuItem[index]['subMenus']);
                            },
                            child: Row(
                              children: [
                                Text(
                                  Get.find<MenuController>().menuModel['menus']
                                      [0]['description'],
                                  style: AppTheme.darkTheme.textTheme.headline1,
                                ),
                                const Icon(
                                  EvaIcons.arrowRight,
                                  color: Colors.orange,
                                  size: 30,
                                )
                              ],
                            ),
                          ),
                        )
                      : BasketWidget(
                          name: Get.find<MenuController>()
                              .selectedMainMenuItem
                              .value[index]["name"]
                              .toString(),
                          price: double.parse(Get.find<MenuController>()
                              .selectedMainMenuItem
                              .value[index]["price"]
                              .toString()
                              .replaceFirst(",", ".")),
                          image: Get.find<MenuController>()
                              .selectedMainMenuItem
                              .value[index]["image"]
                              .toString(),
                          caption: Get.find<MenuController>()
                              .selectedMainMenuItem
                              .value[index]["caption"]
                              .toString(),
                        )
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
