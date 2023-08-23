import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vkreta/view/account/editcard.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
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
          'Payment Method',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 16)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Default Payment References',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.grey.shade900,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 210,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(2),
                    boxShadow: [
                      BoxShadow(color: Colors.grey.shade500, spreadRadius: 1)
                    ]),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            'Payment Method',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 14,
                            )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                              height: 20,
                              width: 40,
                              child: Image.asset(
                                'assets/visa.jpg',
                                fit: BoxFit.fill,
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Visa card ending in 4392',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.grey.shade700, fontSize: 14)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            'Billing Address',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 14,
                            )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'H.n0 152 strt no 14 main gate link road Mumbai area beach, INDIA',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 13,
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            'Phone Number',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 14,
                            )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Text(
                            '051 252522',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                              color: Colors.grey.shade800,
                              fontSize: 13,
                            )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Text(
                    'List of Payment Method',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 16,
                    )),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                height: 1,
                color: Colors.grey.shade500,
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 200,
                width: 400,
                decoration: BoxDecoration(color: Colors.white),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        height: 200,
                        width: 270,
                        color: Colors.white,
                        child: Column(
                          children: [
                             Row(
                               children: [
                                 Text(
                    'Credit Card',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      color: Colors.grey.shade800,fontWeight: FontWeight.bold,
                      fontSize: 14,
                    )),
                  ),
                               ],
                             ),
                             SizedBox(height: 20,),
                              Row(
                        children: [
                          Container(
                              height: 20,
                              width: 40,
                              child: Image.asset(
                                'assets/visa.jpg',
                                fit: BoxFit.fill,
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Visa card ending in 4392',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.grey.shade700, fontSize: 14)),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Divider(
                        color: Colors.grey.shade500,height: 1,
                      ),
                         SizedBox(height: 20,),
                              Row(
                        children: [
                          Container(
                              height: 20,
                              width: 40,
                              child: Image.asset(
                                'assets/master.png',
                                fit: BoxFit.fill,
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Master card ending in 4392',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.grey.shade700, fontSize: 14)),
                          ),
                        ],
                      ),
                       SizedBox(height: 10,),
                      Divider(
                        color: Colors.grey.shade500,height: 1,
                      ),
                        SizedBox(height: 20,),
                              Row(
                        children: [
                          Container(
                              height: 20,
                              width: 40,
                              child: Image.asset(
                                'assets/visa.jpg',
                                fit: BoxFit.fill,
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Visa card ending in 5742',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.grey.shade700, fontSize: 14)),
                          ),
                        ],
                      ),
                       SizedBox(height: 10,),
                      Divider(
                        color: Colors.grey.shade500,height: 1,
                      ),
                          ],
                        ),
                      ),
                       Container(
                        height: 200,
                        width: 170,
                        color: Colors.white,
                        child: Column(
                          children: [
                             Row(
                               children: [
                                 Text(
                    'Name on Card',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      color: Colors.grey.shade800,fontWeight: FontWeight.bold,
                      fontSize: 14,
                    )),
                  ),
                               ],
                             ),
                             SizedBox(height: 20,),
                              Row(
                        children: [
                         
                         
                          Text(
                            'Akshay Kumar',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.grey.shade700, fontSize: 14)),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Divider(
                        color: Colors.grey.shade500,height: 1,
                      ),
                         SizedBox(height: 20,),
                              Row(
                        children: [
                        
                          Text(
                            'Sharukh Khan',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.grey.shade700, fontSize: 14)),
                          ),
                        ],
                      ),
                       SizedBox(height: 10,),
                      Divider(
                        color: Colors.grey.shade500,height: 1,
                      ),
                        SizedBox(height: 20,),
                              Row(
                        children: [
                         
                          Text(
                            'Amir Khan',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.grey.shade700, fontSize: 14)),
                          ),
                        ],
                      ),
                       SizedBox(height: 10,),
                      Divider(
                        color: Colors.grey.shade500,height: 1,
                      ),
                          ],
                        ),
                      ),

                       Container(
                        height: 200,
                        width: 140,
                        color: Colors.white,
                        child: Column(
                          children: [
                             Row(
                               children: [
                                 Text(
                    'Expires on',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      color: Colors.grey.shade800,fontWeight: FontWeight.bold,
                      fontSize: 14,
                    )),
                  ),
                               ],
                             ),
                             SizedBox(height: 20,),
                              Row(
                        children: [
                         
                         
                          Text(
                            '04/03/2022',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.grey.shade700, fontSize: 14)),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Divider(
                        color: Colors.grey.shade500,height: 1,
                      ),
                         SizedBox(height: 20,),
                              Row(
                        children: [
                        
                          Text(
                            '16/12/2029',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.grey.shade700, fontSize: 14)),
                          ),
                        ],
                      ),
                       SizedBox(height: 10,),
                      Divider(
                        color: Colors.grey.shade500,height: 1,
                      ),
                        SizedBox(height: 20,),
                              Row(
                        children: [
                         
                          Text(
                            '22/09/2025',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.grey.shade700, fontSize: 14)),
                          ),
                        ],
                      ),
                       SizedBox(height: 10,),
                      Divider(
                        color: Colors.grey.shade500,height: 1,
                      ),
                          ],
                        ),
                      ),

                       Container(
                        height: 200,
                        width: 200,
                        color: Colors.white,
                        child: Column(
                          children: [
                             Row(
                               children: [
                                 Text(
                    'Action',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      color: Colors.grey.shade800,fontWeight: FontWeight.bold,
                      fontSize: 14,
                    )),
                  ),
                               ],
                             ),
                             SizedBox(height: 20,),
                              Row(
                        children: [
                         
                         
                          Container(
                            height: 20,
                            width: 60,
                            decoration: BoxDecoration(
                              color:Colors.blue.shade900,
                              borderRadius: BorderRadius.circular(4)
                            ),
                            child: Center(
                              child: Text(
                                'Defalut',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.white, fontSize: 12)),
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                             GestureDetector(
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
                          return EditCard();
                        }));
                               },
                               child: Text(
                                                         'Edit',
                                                         style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.blue.shade900, fontSize: 14)),
                                                       ),
                             ),
                          SizedBox(width: 10,),
                             Text(
                            'Delete',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.blue.shade900, fontSize: 14)),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Divider(
                        color: Colors.grey.shade500,height: 1,
                      ),
                         SizedBox(height: 20,),
                              Row(
                        children: [
                        
                          Text(
                            'MakeDefalut',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.blue.shade900, fontSize: 14)),
                          ),
                          SizedBox(width: 10,),
                             GestureDetector(
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
                          return EditCard();
                        }));
                               },
                               child: Text(
                                                         'Edit',
                                                         style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.blue.shade900, fontSize: 14)),
                                                       ),
                             ),
                          SizedBox(width: 10,),
                             Text(
                            'Delete',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.blue.shade900, fontSize: 14)),
                          ),
                        ],
                      ),
                       SizedBox(height: 10,),
                      Divider(
                        color: Colors.grey.shade500,height: 1,
                      ),
                        SizedBox(height: 20,),
                              Row(
                        children: [
                         
                           Text(
                            'MakeDefault',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.blue.shade900, fontSize: 14)),
                          ),
                          SizedBox(width: 10,),
                             GestureDetector(
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
                          return EditCard();
                        }));
                               },
                               child: Text(
                                                         'Edit',
                                                         style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.blue.shade900, fontSize: 14)),
                                                       ),
                             ),
                          SizedBox(width: 10,),
                             Text(
                            'Delete',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.blue.shade900, fontSize: 14)),
                          ),
                        ],
                      ),
                       SizedBox(height: 10,),
                      Divider(
                        color: Colors.grey.shade500,height: 1,
                      ),
                          ],
                        ),
                      )
                    
                     
                     
                  
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              InkWell(
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
                          return EditCard();
                        }));
                },
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [BoxShadow(
                      color:Colors.blue.shade900,
                      spreadRadius:1
                    )]
                  ),
                  child: Center(
                    child: Text(
                              'Add Card',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.blue.shade900, fontSize: 14,fontWeight: FontWeight.bold)),
                            ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
