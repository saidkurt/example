import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class AppConst {
  ///[Appbar Background Color]
  static const Color appBarBackColor = Colors.transparent;

  ///[Main Card]
  static final BorderRadius mainMenuPageCardBorderRadius =
      BorderRadius.circular(30);
  static const Color mainMenuPAgeCardColor = Colors.black54;
  static const double mainMenuPAgeCardSizedHeight = 10;

  ///[Onloading Spinkit]
  static const Color spinKitColor = Colors.black;
  static const double spinKitSize = 30;

  ///[Default Page Transition]
  static const Transition pageTransition = Transition.fadeIn;
  static const Duration pageDuration = Duration(milliseconds: 500);

  static const iconDeletePath =
      "https://mpng.subpng.com/20191102/zut/transparent-bin-icon-delete-icon-remove-icon-5dbe1082968a29.4612454215727371546166.jpg";
}
