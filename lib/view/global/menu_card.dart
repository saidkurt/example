import 'package:example/core/extension/imagepath_string_extension.dart';
import 'package:flutter/material.dart';

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
      decoration: BoxDecoration(
          borderRadius: AppConst.mainMenuPageCardBorderRadius,
          color: AppConst.mainMenuPAgeCardColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            menuTitle!,
            style: textStyle,
          ),
          const SizedBox(height: AppConst.mainMenuPAgeCardSizedHeight),
          Image.asset(imagePath!.imagePath())
        ],
      ),
    );
  }
}
