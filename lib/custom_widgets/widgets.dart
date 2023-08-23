// ignore_for_file: avoid_print, prefer_const_constructors

import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HelperFunctions {



  static saveInPreference(String preName, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(preName, value);
    print('Bismillah: In save preference function');
  }

  static Future<String> getFromPreference(String preName) async {
    String returnValue = "";

    final prefs = await SharedPreferences.getInstance();
    returnValue = prefs.getString(preName) ?? "";
    return returnValue;
  }



  Future<bool>  clearPrefs() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    return true;
  }
}

Future<bool> signout() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
  return true;
}

Widget loader({double?height}){
  return Column(
    children: [
      SizedBox(
        height:height?? Get.height * 0.35,
      ),
      Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.black26,
            valueColor: AlwaysStoppedAnimation<Color>(
                Colors.blue.shade900 //<-- SEE HERE

            ),
          )),
    ],
  );
}
