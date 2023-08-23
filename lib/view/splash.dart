import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vkreta/custom_widgets/widgets.dart';
import 'package:vkreta/view/home/selectscreen.dart';
import 'package:vkreta/view/login_signup/login.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  String id = "";



  @override
  void initState() {
    super.initState();
    HelperFunctions.getFromPreference("userId").then((value) {
      setState(() {
        id = value;
      });
      log(id);
     moveToNext();
    });
  }

  void moveToNext() async{
    Timer(const Duration(seconds: 1), () {
      if (id != "") {
        Get.offAll(()=>SelectScreen(),
            transition: Transition.cupertinoDialog
        );

      } else {
        Get.offAll(()=>LoginScreen(),
            transition: Transition.cupertinoDialog
        );

      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Color(0xFF186ce8),
        body: Padding(
          padding:  EdgeInsets.symmetric(vertical: Get.height*0.2),
          child: Image.asset("assets/newSplash.jpg",

          ),
        ));
  }
}
