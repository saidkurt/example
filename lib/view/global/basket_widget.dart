import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/menu_controller.dart';

class BasketWidget extends StatelessWidget {
  BasketWidget({Key? key, this.name, this.image, this.price, this.caption})
      : super(key: key);
  String? name;
  double? price;
  String? image;
  String? caption;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      bottom: 20,
      child: InkWell(
        onTap: () {
          Get.find<MenuController>()
              .addBasketItemOrder(name!, price!, image!, caption!);
        },
        child: const Icon(
          EvaIcons.shoppingCart,
          color: Colors.orange,
          size: 40,
        ),
      ),
    );
  }
}
