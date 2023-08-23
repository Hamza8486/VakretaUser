import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vkreta/view/home/selectscreen.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({ Key? key }) : super(key: key);

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: 140,
                      child: Image.asset('assets/logo.png',fit: BoxFit.fill,color: Colors.blue.shade900),
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height/2.5,
                  width: MediaQuery.of(context).size.width/1.3,
                  child: Image.asset('assets/start.png'),
                ),
                SizedBox(height: 10,),
                Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: Text('Thanks for registering with us. Your request is under verification process. Please stay in touch until admin approves your application.',style:  GoogleFonts.poppins(
                    textStyle:TextStyle(
                      color:Colors.black,fontSize: 18,fontWeight: FontWeight.bold
                    )
                  ),),
                ),
                 
                SizedBox(height: 30,),
               
               
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
                            return SelectScreen(
                              
                            );
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
                    child: Text('Get Started',style: GoogleFonts.poppins(
                      textStyle:TextStyle(
                        color:Colors.white,fontWeight: FontWeight.bold,fontSize: 15
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
}}