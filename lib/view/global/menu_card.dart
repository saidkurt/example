import 'package:example/core/extension/imagepath_string_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/const/app_const.dart';
import '../../core/theme/app_theme.dart';

class MenuCard extends StatelessWidget {
  MenuCard({Key? key, this.menuTitle, this.imagePath, this.textStyle})
      : super(key: key);
  String? menuTitle;
  String? imagePath;
  TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: Get.width,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(imagePath!.imagePath())),
          border: Border.all(color: Colors.orange, width: 2),
          borderRadius: AppConst.mainMenuPageCardBorderRadius,
          color: AppConst.mainMenuPAgeCardColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            menuTitle!,
            style: textStyle,
          ),
          const SizedBox(height: AppConst.mainMenuPAgeCardSizedHeight),
        ],
      ),
    );
  }
}
