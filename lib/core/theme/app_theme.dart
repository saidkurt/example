import 'package:example/core/const/app_const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final darkTheme = ThemeData(
      appBarTheme: const AppBarTheme(backgroundColor: AppConst.appBarBackColor),
      textTheme: TextTheme(
          headline1: GoogleFonts.nunito(fontSize: 20, color: Colors.white)),
      scaffoldBackgroundColor: Colors.black);
}
