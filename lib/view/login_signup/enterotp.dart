import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:vkreta/view/login_signup/getstarted.dart';
import 'package:vkreta/view/home/selectscreen.dart';

class EnterOtp extends StatefulWidget {
  String no,t;
  EnterOtp({
required this.no,
required this.t
  });

  @override
  State<EnterOtp> createState() => _EnterOtpState();
}

class _EnterOtpState extends State<EnterOtp> {
  @override
  Widget build(BuildContext context) {
    var width =MediaQuery.of(context).size.width;
      return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.08),
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
                child: Image.asset('assets/mark.png',fit: BoxFit.cover,),
              ),
              SizedBox(height: width * 0.04,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Enter the OTP sent to your',style:  GoogleFonts.poppins(
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
                  Text('number',style:  GoogleFonts.poppins(
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
                   Text('+91-',style:  GoogleFonts.poppins(
                      textStyle:TextStyle(
                        color:Colors.black,fontSize: width * 0.05,fontWeight: FontWeight.bold
                      )
                    ),),
                  Text(widget.no,style:  GoogleFonts.poppins(
                    textStyle:TextStyle(
                      color:Colors.black,fontWeight: FontWeight.bold,fontSize: width * 0.05
                    )
                  ),),
                 

                ],
              ),
              SizedBox(height:width * 0.06),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.08),
                child: OTPTextField(
                  length: 4,
                  width: MediaQuery.of(context).size.width,
                  fieldWidth: 30,
                  fieldStyle: FieldStyle.underline,
                 // textFieldAlignment: MainAxisAlignment.spaceAround,

                ),
              ),
              SizedBox(height: width * 0.25,),
              
             
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
                          return widget.t=='Login'?SelectScreen():GetStarted();
                        }));
                 },
                 child: Container(
                             height: 45,
                             width: MediaQuery.of(context).size.width,
                             decoration: BoxDecoration(
                  color: Colors.blue.shade900,
                  borderRadius: BorderRadius.circular(100),
                             ),
                             child: Center(
                  child: Text('Continue',style: GoogleFonts.poppins(
                    textStyle:TextStyle(
                      color:Colors.white,fontWeight: FontWeight.bold,fontSize: width * 0.045
                    )
                  ),),
                             ),
                           ),
               ),
            ],
          ),
        ),
      ),
    );
  }
}