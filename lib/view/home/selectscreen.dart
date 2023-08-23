import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vkreta/controllers/app_text.dart';
import 'package:vkreta/controllers/categoryController.dart';
import 'package:vkreta/getx_controllers/homepage.dart';
import 'package:vkreta/new/dashboard.dart';
import 'package:vkreta/view/account/account.dart';
import 'package:vkreta/view/product/cart.dart';
import 'package:vkreta/view/home/home.dart';
import 'package:vkreta/view/wishlist/wishlist.dart';

import 'controller/home_controller.dart';


class SelectScreen extends StatefulWidget {
  const SelectScreen({ Key? key }) : super(key: key);

  @override
  State<SelectScreen> createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  final homeController = Get.put(HomeController());
  final homePageController = Get.put(HomePage());
  final catController = Get.put(CategoryController());
  int currentindex=0;

  List<Widget> screen=[
    DashboardView(),
    WishList(),
    Cart(),
    Account()
  ];

  Future<bool>onWillPop()async{
    return false;
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        if(currentindex==0){
          return false;
        }
        setState(() {
          currentindex=0;
        });
        return false;

      },
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.white,
           bottomNavigationBar: BottomNavigationBar(
             elevation: 0,
             onTap: (index){
               setState(() {
                 currentindex=index;
               });
             },
             type: BottomNavigationBarType.fixed,
             currentIndex: currentindex,
           unselectedLabelStyle: GoogleFonts.poppins(
             textStyle:TextStyle(
               color: Colors.grey.shade700,
               fontWeight: FontWeight.bold
             )
           ),
             unselectedFontSize: 9,
             selectedLabelStyle: GoogleFonts.poppins(
               textStyle: TextStyle(
                 color: Colors.blue.shade900,fontWeight: FontWeight.bold
               )
             ),
             unselectedItemColor: Colors.grey.shade700,
             selectedFontSize: 10,
             selectedItemColor: Colors.blue.shade900,
             iconSize: 25,
             items: const[
               BottomNavigationBarItem(
               icon: Icon(Icons.home,),
               label: 'Home',
               backgroundColor: Colors.white
),
 BottomNavigationBarItem(
               icon: Icon(Icons.favorite),
               label: 'WishList',
               backgroundColor: Colors.white
),
 BottomNavigationBarItem(
               icon: Icon(Icons.shopping_cart),
               label: 'Cart',
               backgroundColor: Colors.white
),
 BottomNavigationBarItem(
               icon: Icon(Icons.person_outline,),
               label: 'My Account',
               backgroundColor: Colors.white
),
  ]),
  body: screen[currentindex],
            ),
          Obx(
            () {
              return Positioned(
                right: homePageController.cartList.isEmpty?Get.width*0.34:Get.width*0.34,
                bottom: Get.height*0.042,
                child:
                homePageController.cartList.isEmpty?SizedBox.shrink():
                Obx(
                  () {
                    return Container(
                        height: homePageController.cartList.isEmpty?20: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade900,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Obx(
                            () {
                              return Center(
                                child: Text(
                                  homePageController.cartList.length.toString(),
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10)),
                                ),
                              );
                            }
                          ),
                        ));
                  }
                ),
              );
            }
          )

        ],
      ),
    );
  }
}