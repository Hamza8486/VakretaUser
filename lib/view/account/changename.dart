import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangeName extends StatefulWidget {
  const ChangeName({Key? key}) : super(key: key);

  @override
  State<ChangeName> createState() => _ChangeNameState();
}

class _ChangeNameState extends State<ChangeName> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back, color: Colors.black, size: 25)),
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          'Edit Name',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Colors.grey.shade900,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: 50,),
            Row(
              children: [
                Text(
          'New Name',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Colors.grey.shade900,
                  fontSize: 13,fontWeight: FontWeight.bold
                  )),
        ),
              ],
            ),
            SizedBox(height: 5,),
            TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.grey.shade200,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none
                ),
                prefixIcon: Icon(Icons.person,color: Colors.grey.shade500,),
                hintText: 'Enter New Name',
                hintStyle: GoogleFonts.poppins(
                  textStyle:TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 14
                  )
                )
              ),
            ),
            SizedBox(height: 60,),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.blue.shade900,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Center(
                child: Text(
          'Save',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
        ),
              ),
            )
          ],
        ),
      ),
    );
  }
}