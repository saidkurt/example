import 'package:example/core/const/app_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomSpinKit extends StatelessWidget {
  const CustomSpinKit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitDoubleBounce(
        color: AppConst.spinKitColor,
        size: AppConst.spinKitSize,
      ),
    );
  }
}
