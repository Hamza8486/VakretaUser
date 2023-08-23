import 'dart:ui';

import 'package:flutter/material.dart';

Widget productPercentageLabel(String price, String special) {
  int disc;
  int p = int.parse(price.replaceAll(new RegExp(r'[^\w\s]+'), ''));
  int sp = int.parse(special.replaceAll(new RegExp(r'[^\w\s]+'), ''));
  if (sp > 0) {
    double d = ((p - sp) / p) * 100;
    disc = d.toInt();
    return Text(
      disc.toString() + "%",
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  } else {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
  // int disc;
  // int p = int.parse(price.replaceAll(new RegExp(r'[^\w\s]+'), ''));
  // int sp = int.parse(speical.replaceAll(new RegExp(r'[^\w\s]+'), ''));
  // if (sp > 0) {
  //   double d = ((p - sp) / p) * 100;
  //   disc = d.toInt();
  //   return Text(
  //     disc.toString() + "%",
  //     style: TextStyle(
  //       color: Colors.white,
  //     ),
  //   );
  // } else {
  //   return Center(
  //     child: CircularProgressIndicator(),
  //   );
  // }
}
