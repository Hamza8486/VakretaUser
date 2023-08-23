import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vkreta/view/account/changeemail.dart';
import 'package:vkreta/view/account/changename.dart';
import 'package:vkreta/view/login_signup/phonenumber.dart';

class ProfileChange extends StatefulWidget {
   ProfileChange({Key? key,this.data}) : super(key: key);

  var data;

  @override
  State<ProfileChange> createState() => _ProfileChangeState();
}

class _ProfileChangeState extends State<ProfileChange> {
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
          'Account Information',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Colors.grey.shade900,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height:30),
          Container(
            height: Get.height*0.13,
            width: Get.height*0.13,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10000),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10000),
                child: Image.asset('assets/newSplash.jpg',))),
          SizedBox(height:30),
          
          ListTile(
            onTap: (){
                // Navigator.of(context).push(PageRouteBuilder(
                //           transitionDuration: Duration(seconds: 1),
                //           transitionsBuilder: (BuildContext context,
                //               Animation<double> animation,
                //               Animation<double> secAnimation,
                //               Widget child) {
                //             animation = CurvedAnimation(
                //                 parent: animation, curve: Curves.linear);
                //             return SharedAxisTransition(
                //                 child: child,
                //                 animation: animation,
                //                 secondaryAnimation: secAnimation,
                //                 transitionType:
                //                     SharedAxisTransitionType.horizontal);
                //           },
                //           pageBuilder: (BuildContext context,
                //               Animation<double> animation,
                //               Animation<double> secAnimation) {
                //             return ChangeName();
                //           }));
            },
//             trailing: IconButton(onPressed: (){
// Navigator.of(context).push(PageRouteBuilder(
//                           transitionDuration: Duration(seconds: 1),
//                           transitionsBuilder: (BuildContext context,
//                               Animation<double> animation,
//                               Animation<double> secAnimation,
//                               Widget child) {
//                             animation = CurvedAnimation(
//                                 parent: animation, curve: Curves.linear);
//                             return SharedAxisTransition(
//                                 child: child,
//                                 animation: animation,
//                                 secondaryAnimation: secAnimation,
//                                 transitionType:
//                                     SharedAxisTransitionType.horizontal);
//                           },
//                           pageBuilder: (BuildContext context,
//                               Animation<double> animation,
//                               Animation<double> secAnimation) {
//                             return ChangeName();
//                           }));
//             }, icon: Icon(Icons.edit,color: Colors.blue.shade900,size: 25,)
//             ),
            subtitle: Text(
              widget.data.firstname + " " + widget.data.lastname,
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Colors.grey.shade900,
                  fontSize: 15,
                 )),
        ),
            title: Text(
          'Name',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Colors.grey.shade900,
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
        ),
          ),
          
          
          ListTile(
            onTap: (){
                // Navigator.of(context).push(PageRouteBuilder(
                //           transitionDuration: Duration(seconds: 1),
                //           transitionsBuilder: (BuildContext context,
                //               Animation<double> animation,
                //               Animation<double> secAnimation,
                //               Widget child) {
                //             animation = CurvedAnimation(
                //                 parent: animation, curve: Curves.linear);
                //             return SharedAxisTransition(
                //                 child: child,
                //                 animation: animation,
                //                 secondaryAnimation: secAnimation,
                //                 transitionType:
                //                     SharedAxisTransitionType.horizontal);
                //           },
                //           pageBuilder: (BuildContext context,
                //               Animation<double> animation,
                //               Animation<double> secAnimation) {
                //             return ChangeEmail();
                //           }));
            },
 //            trailing: IconButton(onPressed: (){
 // Navigator.of(context).push(PageRouteBuilder(
 //                          transitionDuration: Duration(seconds: 1),
 //                          transitionsBuilder: (BuildContext context,
 //                              Animation<double> animation,
 //                              Animation<double> secAnimation,
 //                              Widget child) {
 //                            animation = CurvedAnimation(
 //                                parent: animation, curve: Curves.linear);
 //                            return SharedAxisTransition(
 //                                child: child,
 //                                animation: animation,
 //                                secondaryAnimation: secAnimation,
 //                                transitionType:
 //                                    SharedAxisTransitionType.horizontal);
 //                          },
 //                          pageBuilder: (BuildContext context,
 //                              Animation<double> animation,
 //                              Animation<double> secAnimation) {
 //                            return ChangeEmail();
 //                          }));
 //            }, icon: Icon(Icons.edit,color: Colors.blue.shade900,size: 25,)
 //            ),
            subtitle: Text(
              widget.data.email,
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Colors.grey.shade900,
                  fontSize: 15,
                 )),
        ),
            title: Text(
          'Email',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Colors.grey.shade900,
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
        ),
          ),
          
          
          ListTile(
            onTap: (){
                // Navigator.of(context).push(PageRouteBuilder(
                //           transitionDuration: Duration(seconds: 1),
                //           transitionsBuilder: (BuildContext context,
                //               Animation<double> animation,
                //               Animation<double> secAnimation,
                //               Widget child) {
                //             animation = CurvedAnimation(
                //                 parent: animation, curve: Curves.linear);
                //             return SharedAxisTransition(
                //                 child: child,
                //                 animation: animation,
                //                 secondaryAnimation: secAnimation,
                //                 transitionType:
                //                     SharedAxisTransitionType.horizontal);
                //           },
                //           pageBuilder: (BuildContext context,
                //               Animation<double> animation,
                //               Animation<double> secAnimation) {
                //             return ChangeNumber();
                //           }));
            },
  //           trailing: IconButton(onPressed: (){
  // Navigator.of(context).push(PageRouteBuilder(
  //                         transitionDuration: Duration(seconds: 1),
  //                         transitionsBuilder: (BuildContext context,
  //                             Animation<double> animation,
  //                             Animation<double> secAnimation,
  //                             Widget child) {
  //                           animation = CurvedAnimation(
  //                               parent: animation, curve: Curves.linear);
  //                           return SharedAxisTransition(
  //                               child: child,
  //                               animation: animation,
  //                               secondaryAnimation: secAnimation,
  //                               transitionType:
  //                                   SharedAxisTransitionType.horizontal);
  //                         },
  //                         pageBuilder: (BuildContext context,
  //                             Animation<double> animation,
  //                             Animation<double> secAnimation) {
  //                           return ChangeNumber();
  //                         }));
  //           }, icon: Icon(Icons.edit,color: Colors.blue.shade900,size: 25,)
  //           ),
            subtitle: Text(
              widget.data.phone,
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Colors.grey.shade900,
                  fontSize: 15,
                 )),
        ),
            title: Text(
          'Phone Number',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Colors.grey.shade900,
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
        ),
          ),

        ],
      ),
    );
  }
}