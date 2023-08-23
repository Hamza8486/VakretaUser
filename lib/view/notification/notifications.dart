import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool value1=true;
  bool value2=true;
  bool value3=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back, color: Colors.black, size: 25)),
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          'Notifications',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 16)),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
         ListTile(
           title: Text(
          'Promotion',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 16)),
        ),
           trailing:  Switch.adaptive(
            activeColor: Colors.blue.shade900,
            value: value1,
           onChanged:(value)=>setState(() {
             this.value1=value;
           })
           ),
         ),
           ListTile(
           title: Text(
          'Chat',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 16)),
        ),
           trailing:  Switch.adaptive(
            activeColor: Colors.blue.shade900,
            value: value2,
           onChanged:(value)=>setState(() {
             this.value2=value;
           })
           ),
         ),
           ListTile(
           title: Text(
          'New Order Status',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 16)),
        ),
           trailing:  Switch.adaptive(
            activeColor: Colors.blue.shade900,
            value: value3,
           onChanged:(value)=>setState(() {
             this.value3=value;
           })
           ),
         )
        ],
      ),
    );
  }
}