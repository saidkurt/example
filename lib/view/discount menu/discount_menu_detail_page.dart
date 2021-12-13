import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:example/controller/menu_controller.dart';
import 'package:example/core/extension/imagepath_string_extension.dart';
import 'package:example/core/theme/app_theme.dart';
import 'package:example/view/global/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiscountMenuDetail extends StatelessWidget {
  DiscountMenuDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Obx(
              () => ListView.builder(
                  itemCount: Get.find<MenuController>().selectLenght.value,
                  itemBuilder: (contex, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          child: SizedBox(
                            height: 300,
                            width: Get.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  (Get.find<MenuController>()
                                          .discountMenuSelectedChooseItem[index]
                                      ['description']),
                                  style: AppTheme.darkTheme.textTheme.headline1,
                                ),
                                SizedBox(
                                  height: 250,
                                  width: Get.width,
                                  child: imageBuilder(index),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }

  ListView imageBuilder(int index) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: Get.find<MenuController>()
          .discountMenuSelectedChooseItem[index]['items']
          .length,
      itemBuilder: (context, item) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(children: [
            GestureDetector(
              onTap: () {
                Get.find<MenuController>()
                    .selectedDiscountImagePathIndex
                    .value = item;
                Get.find<MenuController>().checkIndexControl(index, item);
                print(Get.find<MenuController>().indexControl.value[index]
                    [index]);
                Get.find<MenuController>().checkAction(index);
                Get.find<MenuController>().selectedImage.value =
                    !Get.find<MenuController>().selectedImage.value;
              },
              child: Image.asset(Get.find<MenuController>()
                  .discountMenuSelectedChooseItem[index]['items'][item]['image']
                  .toString()
                  .imagePath()),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                Get.find<MenuController>()
                    .discountMenuSelectedChooseItem[index]['items'][item]
                        ['name']
                    .toString(),
                style: AppTheme.darkTheme.textTheme.headline1,
              ),
            ),
            Visibility(
              visible: Get.find<MenuController>()
                              .discountMenuSelectedChooseItem[index]['items']
                          [item]['price'] ==
                      null
                  ? false
                  : true,
              child: Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: 50,
                    width: 50,
                    color: Colors.orange,
                    child: Center(
                      child: Text(
                        "+" +
                            Get.find<MenuController>()
                                .discountMenuSelectedChooseItem[index]['items']
                                    [item]['price']
                                .toString()
                                .moneyTL(),
                        style: AppTheme.darkTheme.textTheme.headline1!.copyWith(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
            ),
            Visibility(
              visible: Get.find<MenuController>().indexControl.value[index]
                          [index] ==
                      item
                  ? true
                  : false,
              child: const Positioned(
                  left: 0,
                  top: 0,
                  child: Icon(
                    EvaIcons.doneAllOutline,
                    color: Colors.orange,
                    size: 40,
                  )),
            )
          ]),
        );
      },
    );
  }
}
