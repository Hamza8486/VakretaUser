import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vkreta/view/others/contactus.dart';

class HelpSupport extends StatefulWidget {
  const HelpSupport({Key? key}) : super(key: key);

  @override
  State<HelpSupport> createState() => _HelpSupportState();
}

class _HelpSupportState extends State<HelpSupport> {
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
          'Help and Support',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 16,fontWeight: FontWeight.bold)),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                child: Image.asset('assets/help.png'),
              ),
              SizedBox(
                height: 10,
              ),
              
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
          'Need some help?',
          style: GoogleFonts.poppins(
                  textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 16,)),
        ),
                ],
              ),
               SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
          'Get Lost?Dont know how to use?',
          style: GoogleFonts.poppins(
                  textStyle: TextStyle(color: Colors.grey.shade700, fontSize: 14,)),
        ),
                ],
              ),
               SizedBox(height: 1,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
          'Feel free to get in touch with us',
          style: GoogleFonts.poppins(
                  textStyle: TextStyle(color: Colors.grey.shade700, fontSize: 14,)),
        ),
                ],
              ),
              Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          children: [
            SizedBox(height: 30,),
            Row(
              children: [
                Text(
                'Our Webiste : ',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.blue, fontSize: 13,fontWeight: FontWeight.bold)),
          ),
           Text(
                'www.vkreta.com',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 13,fontWeight: FontWeight.bold)),
          ),
              ],
            ),
            SizedBox(height: 20),
              Row(
              children: [
                Text(
                'Our Phone : ',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.blue, fontSize: 13,fontWeight: FontWeight.bold)),
          ),
           Text(
                '051 9379229',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 13,fontWeight: FontWeight.bold)),
          ),
              ],
            ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                  'Our Address : ',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(color: Colors.blue, fontSize: 13,fontWeight: FontWeight.bold)),
          ),
           Text(
              'Mumbai Road Near beach 6th',
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 13,fontWeight: FontWeight.bold)),
          ),
                ],
              ),
          
          ],
        ),
      ),
      SizedBox(height: 80,),
      Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                        size: 15,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                        size: 15,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                        size: 15,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                        size: 15,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                        size: 15,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      
                                    ],
                                  ),
                                ),
        //       SizedBox(height: 70,),
        //        Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 20),
        //   child: InkWell(
        //     onTap: (){
        //        Navigator.of(context).push(PageRouteBuilder(
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
        //                           return Contactus();
        //                         }));
        //     },
        //     child: Container(
        //       height: 45,
        //       width: MediaQuery.of(context).size.width,
        //       decoration: BoxDecoration(
        //           color: Colors.blue.shade900,
        //           borderRadius: BorderRadius.circular(4)),
        //       child: Center(
        //         child: Text(
        //           'Contact Us',
        //           style: GoogleFonts.poppins(
        //               textStyle: TextStyle(
        //                   color: Colors.white,
        //                   fontWeight: FontWeight.bold,
        //                   fontSize: 14)),
        //         ),
        //       ),
        //     ),
        //   ),
        // )
        ],
      ),
    );
  }
}