import 'package:e_commerce/constance.dart';
import 'package:e_commerce/core/view_model/home_view_model.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'details_view.dart';

class HomeView extends StatelessWidget {
  final List<String> categoriesNames = [
    'Men',
    'Women',
    'Devices',
    'Gadgets',
    'Gaming'
  ];
  final List categoriesIcon = [
    'assets/images/Men_icon.png',
    'assets/images/Women_icon.png',
    'assets/images/Devices_icon.png',
    'assets/images/Gadgets_icon.png',
    'assets/images/Gaming_icon.png'
  ];

  final Map productInfo = {
    'name': ["Classic Watch", "HairCare", "Classic Watch", "HairCare"],
    'location': ['Alex', "Mans", "Cairo", "Aswan"],
    'price': ['15', '152', '221', '522'],
    'productImg': [
      'assets/products/watch.png',
      'assets/products/haircare.png',
      'assets/products/watch.png',
      'assets/products/haircare.png'
    ]
  };

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => Scaffold(
        backgroundColor: Colors.white,
        body:
            controller.loading.value
                ? loadingPage()
                : SafeArea(
                    child: SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(top: 40, left: 20, right: 20),
                        child: Column(
                          children: [
                            searchTextFiled(),
                            SizedBox(height: 20),
                            CustomText(
                              txt: 'Categories',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(height: 15),
                            categriesListView(width),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  txt: 'Best Selling',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                FlatButton(
                                  child: CustomText(
                                    txt: 'See all',
                                  ),
                                  onPressed: () {},
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            productListView(),
                          ],
                        ),
                      ),
                    ),
                  ),
      ),
    );
  }

  Widget loadingPage() {
    return Container(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Loading... ',
                          style:
                              TextStyle(color: primaryColor, fontSize: 18.0),
                        ),
                        SizedBox(height: 15),
                        CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(primaryColor)),
                      ],
                    ),
                  ),
                );
  }

  Widget categriesListView(double width) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => Container(
        // color: Colors.red,
        height: 100,
        width: width,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  width: 80,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.shade100,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.network(
                      controller.categoryModel[index].image,
                      fit: BoxFit.contain,
                      width: 10,
                      height: 10,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                CustomText(
                  txt: controller.categoryModel[index].name,
                ),
              ],
            );
          },
          itemCount: controller.categoryModel.length,
          separatorBuilder: (context, index) => SizedBox(
            width: 10,
          ),
        ),
      ),
    );
  }

  Widget searchTextFiled() {
    var outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
      borderRadius: BorderRadius.circular(50.0),
    );
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10),
        fillColor: Colors.grey.shade200,
        filled: true,
        prefixIcon: Icon(Icons.search, color: Colors.black),
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        errorBorder: outlineInputBorder,
      ),
    );
  }

  Widget productListView() {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => Container(
        height: 310,
        // color: Colors.amber,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return FlatButton(

              padding: EdgeInsets.all(0),
              onPressed: (){
                Get.to(DetailsView(model: controller.productModel[index],));
              },
              child: Container(
                // color: Colors.amber,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .4,
                      height: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade300,
                      ),
                      child: Center(
                        child: Image.network(
                          controller.productModel[index].image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(height: 7),
                    CustomText(
                      txt: controller.productModel[index].name,
                      fontWeight: FontWeight.w600,
                    ),
                    CustomText(
                      txt:
                          '${controller.productModel[index].description.toString().substring(1, 8)}...',
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 5),
                    CustomText(
                      txt: '\$ ${controller.productModel[index].price}',
                      color: primaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: controller.productModel.length,
          separatorBuilder: (context, index) => SizedBox(
            width: 10,
          ),
        ),
      ),
    );
  }
}
