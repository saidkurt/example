import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:example/controller/menu_controller.dart';
import 'package:example/core/theme/app_theme.dart';
import 'package:example/view/orderpage/order_page_dateil.view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/const/app_const.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Obx(
          () => GestureDetector(
            onTap: () {
              Get.to(() => OrderPageDetail());
              Get.find<MenuController>().selectedAppBarTitle.value =
                  "Sipariş Detayı";
            },
            child: Visibility(
              visible:
                  Get.find<MenuController>().selectedBasketItem.value.isEmpty
                      ? false
                      : true,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: AppConst.mainMenuPageCardBorderRadius,
                      color: Colors.orange),
                  child: Row(
                    children: [
                      const Expanded(
                          child: SizedBox(
                            child: Center(
                                child: Icon(
                              EvaIcons.shoppingCartOutline,
                              color: Colors.black,
                            )),
                          ),
                          flex: 1),
                      Expanded(
                          child: Container(
                            color: Colors.orange,
                            child: Center(
                              child: Text(
                                Get.find<MenuController>()
                                        .totalPrice
                                        .value
                                        .toStringAsFixed(2) +
                                    " TL",
                                style: AppTheme.darkTheme.textTheme.headline1!
                                    .copyWith(
                                        color: Colors.black, fontSize: 13),
                              ),
                            ),
                          ),
                          flex: 2)
                    ],
                  ),
                  width: 100,
                ),
              ),
            ),
          ),
        )
      ],
      leading: Visibility(
        visible: Get.find<MenuController>().selectedAppBarTitle.value == "Menü"
            ? false
            : true,
        child: IconButton(
          onPressed: () {
            Get.find<MenuController>().selectedAppBarTitle.value = "Menü";
            Get.back();
          },
          icon: const Icon(
            EvaIcons.arrowLeft,
            color: Colors.white,
          ),
        ),
      ),
      title: Text(
        Get.find<MenuController>().selectedAppBarTitle.value,
        style: AppTheme.darkTheme.textTheme.headline1!.copyWith(fontSize: 20),
      ),
    );
  }
}
