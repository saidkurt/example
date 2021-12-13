import 'package:example/controller/menu_controller.dart';
import 'package:example/core/const/app_const.dart';
import 'package:example/core/extension/imagepath_string_extension.dart';
import 'package:example/core/theme/app_theme.dart';
import 'package:example/view/global/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderPageDetail extends StatelessWidget {
  OrderPageDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: Obx(
          () => SizedBox(
            child: ListView.builder(
                itemCount: Get.find<MenuController>().selectedBasketItem.length,
                itemBuilder: (context, item) => ListTile(
                      textColor: Colors.white,
                      trailing: GestureDetector(
                        onTap: () => Get.find<MenuController>()
                            .deleteBasketItem(Get.find<MenuController>()
                                .selectedBasketItem[item]),
                        child: SizedBox(
                          width: 30,
                          child: Image.network(AppConst.iconDeletePath),
                        ),
                      ),
                      leading: Image.asset(Get.find<MenuController>()
                          .selectedBasketItem[item]
                          .imagePath
                          .toString()
                          .imagePath()),
                      title: Text(
                        Get.find<MenuController>()
                            .selectedBasketItem[item]
                            .name
                            .toString(),
                        style: AppTheme.darkTheme.textTheme.headline1!
                            .copyWith(fontSize: 15),
                      ),
                      subtitle: Text(Get.find<MenuController>()
                          .selectedBasketItem[item]
                          .price
                          .toString()
                          .moneyTL()),
                    )),
          ),
        ));
  }
}
