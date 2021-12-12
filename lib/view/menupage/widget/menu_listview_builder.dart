import 'package:example/controller/menu_controller.dart';
import 'package:example/view/global/menu_card.dart';
import 'package:example/view/menudetailpage/menu_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_theme.dart';

class MenuListViewBuilder extends StatelessWidget {
  MenuListViewBuilder({Key? key, required this.menuList}) : super(key: key);

  List menuList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: menuList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              Get.find<MenuController>().selectedMainMenuItem.value =
                  menuList[index]['items'];
              Get.to(() => MenuDetailPageView());
              Get.find<MenuController>().selectedAppBarTitle.value =
                  menuList[index]['caption'];
            },
            child: Column(
              children: [
                MenuCard(
                  menuTitle: menuList[index]['caption'],
                  imagePath: menuList[index]['image'],
                  textStyle: AppTheme.darkTheme.textTheme.headline1!
                      .copyWith(fontSize: 30),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ));
      },
    );
  }
}
