import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'enterotp.dart';

class EnterMobileNo extends StatefulWidget {
  String t;
  EnterMobileNo({
required this.t,
  });

  @override
  State<EnterMobileNo> createState() => _EnterMobileNoState();
}

class _EnterMobileNoState extends State<EnterMobileNo> {
   final TextEditingController _mobileno=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.06),
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: width * 0.06,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: width * 0.15,
                      width: width * 0.35,
                      child: Image.asset('assets/logo.png',fit: BoxFit.fill,color: Colors.blue.shade900),
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height/3,
                  width: MediaQuery.of(context).size.width/1.5,
                  child: Image.asset('assets/no.png',fit: BoxFit.cover,),
                ),
                SizedBox(height: width * 0.05,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Enter your mobile number to',style:  GoogleFonts.poppins(
                      textStyle:TextStyle(
                        color:Colors.black,fontWeight: FontWeight.bold,fontSize: width * 0.05
                      )
                    ),),
                   
      
                  ],
                ),
                 SizedBox(height: width * 0.03,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('continue',style:  GoogleFonts.poppins(
                      textStyle:TextStyle(
                        color:Colors.black,fontWeight: FontWeight.bold,fontSize: width * 0.05
                      )
                    ),),
                   
      
                  ],
                ),
                SizedBox(height: width * 0.06,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('+91 ',style:  GoogleFonts.poppins(
                      textStyle:TextStyle(
                        color:Colors.blue.shade900,fontSize: width * 0.05
                      )
                    ),),
                    SizedBox(width: width * 0.04,),
                    Expanded(child: 
                    TextFormField(
                  controller: _mobileno,
                decoration: InputDecoration(
                  //prefixIcon: Icon(Icons.mail,size: 23,),
                  hintText: 'Number',
                  hintStyle: GoogleFonts.poppins(
                    textStyle:TextStyle(
                      color:Colors.grey.shade600,
                       fontSize: width * 0.04
            )
                  )
                ),
                ),)
                    ],
                ),
                 SizedBox(height: width * 0.08,),
                 InkWell(
                   onTap: (){

                      Navigator.of(context).pushReplacement(PageRouteBuilder(
                          transitionDuration: Duration(seconds: 1),
                          transitionsBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secAnimation,
                              Widget child) {
                            animation = CurvedAnimation(
                                parent: animation, curve: Curves.linear);
                            return SharedAxisTransition(
                                child: child,
                                animation: animation,
                                secondaryAnimation: secAnimation,
                                transitionType:
                                    SharedAxisTransitionType.horizontal);
                          },
                          pageBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secAnimation) {
                            return EnterOtp(
                              no: _mobileno.text,
                              t: widget.t,
                            );
                          }));
                   },
                   child: Container(
                               height: width * 0.12,
                               width: MediaQuery.of(context).size.width,
                               decoration: BoxDecoration(
                    color: Colors.blue.shade900,
                    borderRadius: BorderRadius.circular(100),
                               ),
                               child: Center(
                    child: Text('Continue',style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color:Colors.white,fontWeight: FontWeight.bold,fontSize: width * 0.04
                      )
                    ),),
                               ),
                             ),
                 ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}