import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AllNotifications extends StatefulWidget {
  const AllNotifications({Key? key}) : super(key: key);

  @override
  State<AllNotifications> createState() => _AllNotificationsState();
}

class _AllNotificationsState extends State<AllNotifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         
        backgroundColor: Colors.white,
        title: Text(
         'All Notifications',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold)),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 25,
            )),
      ),
      backgroundColor:Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
SizedBox(height: 20,),
ListTile(
  leading: Icon(Icons.star,color: Colors.orange,size: 30,),
  subtitle: Text(
         'Your new product has been delivered successfully',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 13,
                  )),
        ),
      
  title: Text(
         'You buy your new product',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
        ),
))),
SizedBox(height: 10,),
ListTile(
  leading: Icon(Icons.star,color: Colors.orange,size: 30,),
  subtitle: Text(
         'Your new product has been delivered successfully',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 13,
                  )),
        ),
      
  title: Text(
         'You buy your new product',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
        ),
))),
SizedBox(height: 10,),
ListTile(
  leading: Icon(Icons.star,color: Colors.orange,size: 30,),
  subtitle: Text(
         'Your new product has been delivered successfully',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 13,
                  )),
        ),
      
  title: Text(
         'You buy your new product',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
        ),
))),
SizedBox(height: 10,),
ListTile(
  leading: Icon(Icons.star,color: Colors.orange,size: 30,),
  subtitle: Text(
         'Your new product has been delivered successfully',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 13,
                  )),
        ),
      
  title: Text(
         'You buy your new product',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
        ),
))),
SizedBox(height: 10,),
ListTile(
  leading: Icon(Icons.star,color: Colors.orange,size: 30,),
  subtitle: Text(
         'Your new product has been delivered successfully',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 13,
                  )),
        ),
      
  title: Text(
         'You buy your new product',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
        ),
)))
          ],
        ),
      ),
    );
  }
}