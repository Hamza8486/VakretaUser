// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SpecificationView extends StatefulWidget {
   SpecificationView({Key? key,this.data}) : super(key: key);

  var data;




  @override
  State<SpecificationView> createState() => _ReturnPolicy();
}

class _ReturnPolicy extends State<SpecificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 25,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          "Order Specification",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: Colors.grey.shade900,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding:  EdgeInsets.symmetric(horizontal: Get.width*0.04,vertical: Get.height*0.03),
        child: Column(
          children: [
            SizedBox(height: Get.height*0.01,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Brand:   ',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Colors.grey.shade900,
                      fontWeight: FontWeight.w500,
                      fontSize: Get.height*0.018,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    widget.data.headingTitle.toString(),
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Colors.grey.shade900,
                        fontWeight: FontWeight.w600,
                        fontSize: Get.height*0.018,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: Get.height*0.01,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Country of Origin:    ',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Colors.grey.shade900,
                      fontWeight: FontWeight.w500,
                      fontSize: Get.height*0.018,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    "India",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Colors.grey.shade900,
                        fontWeight: FontWeight.w600,
                        fontSize: Get.height*0.018,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: Get.height*0.01,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Manufacture:     ',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Colors.grey.shade900,
                      fontWeight: FontWeight.w500,
                      fontSize: Get.height*0.018,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    widget.data.manufacturer==null?"Manufacture":widget.data.manufacturer.toString(),
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Colors.grey.shade900,
                        fontWeight: FontWeight.w600,
                        fontSize: Get.height*0.018,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: Get.height*0.01,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Manufacture Address:    ',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Colors.grey.shade900,
                      fontWeight: FontWeight.w500,
                      fontSize: Get.height*0.018,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    "India",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Colors.grey.shade900,
                        fontWeight: FontWeight.w600,
                        fontSize: Get.height*0.018,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: Get.height*0.01,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Model Name:      ',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Colors.grey.shade900,
                      fontWeight: FontWeight.w500,
                      fontSize: Get.height*0.018,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    widget.data.model.toString(),
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Colors.grey.shade900,
                        fontWeight: FontWeight.w600,
                        fontSize: Get.height*0.018,
                      ),
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
