import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vkreta/view/product/productidno.dart';

class ReviewProduct extends StatefulWidget {
  const ReviewProduct({Key? key}) : super(key: key);

  @override
  State<ReviewProduct> createState() => _ReviewProductState();
}

class _ReviewProductState extends State<ReviewProduct> {
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
          'Review Product',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 16)),
        ),
       
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 20,),
           Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: (){
                   Navigator.of(context).push(PageRouteBuilder(
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
                          return ProductIdNo();
                        }));
                },
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(
                      color: Colors.grey.shade300,
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(3,3)
                    )]
                  ),
                  child: Column(
                    children: [
                     
                      SizedBox(height: 20,),
              
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                children: [
                  Text(
                    '14 August 2022',
                    
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
                  ),
                ],
                        ),
                      ),
                      SizedBox(height: 7,),
                       Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                children: [
                  Text(
                    'USB2527DGD7282',
                    
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 15,
                        fontWeight: FontWeight.bold
                        )),
                  ),
                ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width/3,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset('assets/shirt.png'),
                  ),
                ),
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width/1.7,
                  decoration: BoxDecoration(
                    color: Colors.white
                  ),
                  child: Column(
                    children: [
              Text(
                    'Here is the title of your shoes which is your product',
                    
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 14,
                        fontWeight: FontWeight.bold
                        )),
                  ),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                      Text(
                        '+3 other product',
                        
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(color: Colors.grey.shade500, fontSize: 11,
                            
                            )),
                      ),
                    ],
                  ),
                    ],
                  ),
                )
                        ],
                      ),
                      Divider(
                        height: 1,
                        color: Colors.grey.shade400,
                      ),
                    SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: InkWell(
                      onTap: (){
                         Navigator.of(context).push(PageRouteBuilder(
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
                          return ProductIdNo();
                        }));
                      },
                      child: Row(mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Review',
                            
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(color: Colors.blue.shade900, fontSize: 13,
                                fontWeight: FontWeight.bold
                                
                                )),
                          ),
                          SizedBox(width: 3,),
                          Icon(Icons.arrow_forward_ios,color:Colors.blue.shade900,size: 14,)
                        ],
                      ),
                    ),
                  ),
                
              
                    ],
                  ),
                ),
              ),
            ),
        ],),
      ),
    );
  }
}