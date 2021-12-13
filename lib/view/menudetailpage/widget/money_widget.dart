import 'package:flutter/material.dart';
import 'package:example/core/extension/imagepath_string_extension.dart';
import '../../../core/const/app_const.dart';
import '../../../core/theme/app_theme.dart';

class MoneyWidget extends StatelessWidget {
  MoneyWidget({Key? key, required this.title}) : super(key: key);
  String? title;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black54.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: AppConst.mainMenuPageCardBorderRadius,
          color: Colors.black54),
      width: 70,
      height: 50,
      child: Center(
        child: Text(
          title!,
          style: AppTheme.darkTheme.textTheme.headline1!.copyWith(
              fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
