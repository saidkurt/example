import 'package:example/core/const/app_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/routes/app_routes.dart';
import 'core/routes/app_routes_name.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRouteName.initialRoute,
      theme: AppTheme.darkTheme,
      transitionDuration: AppConst.pageDuration,
      debugShowCheckedModeBanner: false,
      defaultTransition: AppConst.pageTransition,
      getPages: AppRoutes.pages,
    );
  }
}
