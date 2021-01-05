import 'package:e_commerce/constance.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

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

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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
    );
  }

  Widget categriesListView(double width) {
    return Container(
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
                  child: Image.asset(
                    categoriesIcon[index],
                    fit: BoxFit.contain,
                    width: 10,
                    height: 10,
                  ),
                ),
              ),
              SizedBox(height: 20),
              CustomText(
                txt: categoriesNames[index],
              ),
            ],
          );
        },
        itemCount: categoriesNames.length,
        separatorBuilder: (context, index) => SizedBox(
          width: 10,
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
    return Container(
      height: 295,
      // color: Colors.amber,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
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
                  child: Image.asset(
                    productInfo['productImg'][index],
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 12),
              CustomText(
                txt: productInfo['name'][index],
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
              CustomText(
                txt: productInfo['location'][index],
                fontSize: 15,
                color: Colors.grey,
              ),
              SizedBox(height: 5),
              CustomText(
                txt: '\$ ${productInfo['price'][index]}',
                color: primaryColor,
                fontWeight: FontWeight.w700,
                fontSize: 17,
              ),
            ],
          );
        },
        itemCount: productInfo['name'].length,
        separatorBuilder: (context, index) => SizedBox(
          width: 10,
        ),
      ),
    );
  }
}
