import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vkreta/view/review/addoreditreview.dart';

class ProductIdNo extends StatefulWidget {
  const ProductIdNo({Key? key}) : super(key: key);

  @override
  State<ProductIdNo> createState() => _ProductIdNoState();
}

class _ProductIdNoState extends State<ProductIdNo> {
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
          'QIHGDUW256157819',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 16)),
        ),
       
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                          return AddOrEditReview();
                        }));
                },
                child: Container(
                  height: 140,
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
                        'Not Reviewed',
                        
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
                          return AddOrEditReview();
                        }));
                      },
                      child: Row(mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Add Review',
                            
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
                          return AddOrEditReview();
                        }));
                },
                child: Container(
                  height: 140,
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
                      Row(
                        children: [
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width/3,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset('assets/camera.png'),
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
                          return AddOrEditReview();
                        }));
                      },
                      child: Row(mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Edit Review',
                            
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
                          return AddOrEditReview();
                        }));
                },
                child: Container(
                  height: 140,
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
                      Row(
                        children: [
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width/3,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset('assets/shoes.png'),
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
                        'Not Reviewed',
                        
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
                            'Add Review',
                            
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
          ],
        ),
      ),
    );
  }
}