import 'package:flutter/material.dart';
import 'package:example/core/extension/imagepath_string_extension.dart';
import '../../../core/const/app_const.dart';
import '../../../core/theme/app_theme.dart';

class MoneyWidget extends StatelessWidget {
  MoneyWidget({Key? key, required this.money}) : super(key: key);
  String? money;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: AppConst.mainMenuPageCardBorderRadius,
          color: Colors.orange),
      width: 70,
      height: 50,
      child: Center(
        child: Text(
          money!.moneyTL(),
          style: AppTheme.darkTheme.textTheme.headline1!.copyWith(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
