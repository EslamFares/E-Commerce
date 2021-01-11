import 'dart:ui';
import 'package:e_commerce/model/product_model.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsView extends StatelessWidget {
  ProductModel model;
  DetailsView({this.model});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                appBarImage(width),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  child: Column(
                    children: [
                      CustomText(
                        txt: model.name,
                        fontSize: 26,
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          sizeColorInfo(
                              tile: 'Size', value: model.sized, width: width),
                          sizeColorInfo(
                              tile: 'Color', color: model.color, width: width),
                        ],
                      ),
                      SizedBox(height: 20),
                      CustomText(
                        txt: 'Details',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 10),
                      Wrap(
                        children: [
                          Text(
                            model.description,
                            style: TextStyle(
                                height: 1.7,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container sizeColorInfo(
      {double width, String tile, String value, String color}) {
    return Container(
      width: width * .5 - 40,
      height: 45,
      // padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: .4),
          borderRadius: BorderRadius.circular(25.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomText(
            txt: tile,
            fontSize: 18,
            alignment: Alignment.center,
          ),
          color == null
              ? CustomText(
                  txt: value,
                  fontSize: 18,
                  alignment: Alignment.center,
                )
              : Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: color.length == 6
                        ? Color(int.parse("0xFF" + color))
                        : color.length == 8
                            ? Color(int.parse("0x" + color))
                            : Colors.amber,
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                ),
        ],
      ),
    );
  }

  Container appBarImage(double width) {
    return Container(
      height: 250,
      width: width,
      child: Stack(
        children: [
          Container(
            height: 250,
            width: width,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
            ),
            child: Center(child: Image.network(model.image)),
          ),
          appBarButtonCenter(width)
        ],
      ),
    );
  }

  Center appBarButtonCenter(double width) {
    return Center(
      child: Container(
        // color: Colors.amber,
        width: width,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                onPressed: () {
                  Get.back();
                }),
            FlatButton(
              padding: EdgeInsets.all(0),
              child: Material(
                elevation: 10,
                shape: CircleBorder(),
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Icon(
                    Icons.star_border,
                    size: 30,
                  ),
                ),
              ),
              onPressed: () {
                print('Star');
              },
            ),
          ],
        ),
      ),
    );
  }
}
