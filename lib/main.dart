import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vkreta/view/home/home.dart';
import 'package:vkreta/view/home/selectscreen.dart';
import 'package:vkreta/view/login_signup/login.dart';
import 'package:vkreta/providerModel/homedata.dart';
import 'package:vkreta/view/splash.dart';

import 'models/bages_model.dart';
void main(List<String> args) async {

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<HomeData>(create: (_) =>HomeData()),
      ChangeNotifierProvider<BadgesModel>(create: (_) => BadgesModel()),
      ChangeNotifierProvider<Model>(create: (_) => Model()),
    ],
    child: GetMaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.blue.shade900,
          ),
        primaryColor: Colors.blue.shade900
      ),
      debugShowCheckedModeBanner: false,
      title: 'Vkreta',
      home:SplashView(),
    ),
  ));
}


