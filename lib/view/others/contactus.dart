import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Contactus extends StatefulWidget {
  const Contactus({Key? key}) : super(key: key);

  @override
  State<Contactus> createState() => _ContactusState();
}

class _ContactusState extends State<Contactus> {
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
          'Contact Us',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 16,fontWeight: FontWeight.bold)),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: 30,),
            Row(
              children: [
                Text(
                'Our Webiste : ',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.blue, fontSize: 13,)),
          ),
           Text(
                'www.vkreta.com',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 13,fontWeight: FontWeight.bold)),
          ),
              ],
            ),
            SizedBox(height: 30),
              Row(
              children: [
                Text(
                'Our Phone : ',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.blue, fontSize: 13,)),
          ),
           Text(
                '8168044155',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 13,fontWeight: FontWeight.bold)),
          ),
              ],
            ),
              SizedBox(height: 30),
              Row(
                children: [
                  Text(
                  'Our Address : ',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(color: Colors.blue, fontSize: 13,)),
          ),
           Expanded(
             child: Text(
                'Vkreta Seller Services, Uklana Mandi, Hisar, Haryana',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 13,fontWeight: FontWeight.bold)),
          ),
           ),
                ],
              ),
            SizedBox(height: 30),
            Row(
              children: [
                Text(
                  'Store : ',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(color: Colors.blue, fontSize: 13,)),
                ),
                Text(
                  'Vkreta Services',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 13,fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          
          ],
        ),
      ),
    );
  }
}