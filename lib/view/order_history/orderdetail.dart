import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vkreta/view/others/chat.dart';
import 'package:vkreta/view/others/contactus.dart';
import 'package:vkreta/view/others/helpsupport.dart';
import 'package:vkreta/view/order_history/orderstatus.dart';
import 'package:vkreta/view/order_history/returnorder.dart';
import 'package:vkreta/view/review/reviewseller.dart';

class OrderDetail extends StatefulWidget {
  const OrderDetail({Key? key}) : super(key: key);

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  final TextEditingController inst=TextEditingController();
  final TextEditingController reason=TextEditingController();
  final TextEditingController date=TextEditingController();
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
          'Order Detail',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 16)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Text(
                    'Status',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.grey.shade500, fontSize: 12)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Order Completed',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.blue,
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                  ),
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
                          return OrderStatus();
                        }));
                    },
                    child: Text(
                      'View Status',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                        color: Colors.blue,
                        fontSize: 13,
                      )),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height:10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children:[
                InkWell(
                  onTap:(){
                  
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
                            return ReturnOrder(
                             
                            );
                          }));
                  },
                  child: Container(
                    height: 40,width: 170,
                    decoration:BoxDecoration(
                      color: Colors.white,
                      borderRadius:BorderRadius.circular(5),
                      boxShadow: [BoxShadow(
                        color:Colors.red,spreadRadius:1
                      )]
                    ),
                    child: Center(
                      child: Text(
                            'Return/Replace Order',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 13,
                              fontWeight:FontWeight.bold
                            )),
                          ),
                    ),
                  ),
                ),
                InkWell(
                  onTap:(){
                  
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
                            return SellerReview(
                             
                            );
                          }));
                  },
                  child: Container(
                    height: 40,width: 120,
                    decoration:BoxDecoration(
                      color: Colors.blue.shade900,
                      borderRadius:BorderRadius.circular(5),
                      
                    ),
                    child: Center(
                      child: Text(
                            'Rate Seller',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight:FontWeight.bold
                            )),
                          ),
                    ),
                  ),
                )
                ]
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                height: 1,
                color: Colors.grey.shade400,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Order Date',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                  ),
                  Text(
                    '14th August 2022 11:32 UTC',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 13,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                height: 1,
                color: Colors.grey.shade400,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Text(
                    'HDV62728363632G',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                height: 4,
                color: Colors.grey.shade400,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 130,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade300,
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: Offset(3, 3))
                    ]),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 90,
                          width: MediaQuery.of(context).size.width / 3,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset('assets/bag.png'),
                          ),
                        ),
                        Container(
                          height: 90,
                          width: MediaQuery.of(context).size.width / 1.7,
                          decoration: BoxDecoration(color: Colors.white),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Here is the title of your shoes which is your product',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.grey.shade900,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)),
                              ),
                              SizedBox(
                                height: 0,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '3 Item (500 g)',
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 11,
                                    )),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 0,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '₹ 140',
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: Colors.grey.shade800,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Divider(
                        height: 1,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Payment',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.grey.shade600, fontSize: 12)),
                          ),
                          Text(
                            '₹ 130',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 130,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade300,
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: Offset(3, 3))
                    ]),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 90,
                          width: MediaQuery.of(context).size.width / 3,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset('assets/camera.png'),
                          ),
                        ),
                        Container(
                          height: 90,
                          width: MediaQuery.of(context).size.width / 1.7,
                          decoration: BoxDecoration(color: Colors.white),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Here is the title of your shoes which is your product',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.grey.shade900,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)),
                              ),
                              SizedBox(
                                height: 0,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '6 Item (800 g)',
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 11,
                                    )),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 0,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '₹ 140',
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: Colors.grey.shade800,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Divider(
                        height: 1,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Payment',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.grey.shade600, fontSize: 12)),
                          ),
                          Text(
                            '₹ 190',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 130,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade300,
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: Offset(3, 3))
                    ]),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 90,
                          width: MediaQuery.of(context).size.width / 3,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset('assets/shoes.png'),
                          ),
                        ),
                        Container(
                          height: 90,
                          width: MediaQuery.of(context).size.width / 1.7,
                          decoration: BoxDecoration(color: Colors.white),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Here is the title of your shoes which is your product',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.grey.shade900,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)),
                              ),
                              SizedBox(
                                height: 0,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '8 Item (1000 g)',
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 11,
                                    )),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 0,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '₹ 110',
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: Colors.grey.shade800,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Divider(
                        height: 1,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Payment',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.grey.shade600, fontSize: 12)),
                          ),
                          Text(
                            '₹ 170',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
           
             SizedBox(
              height: 30,
            ),
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300, spreadRadius: 3, blurRadius: 5)
              ]),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Text(
                          'Delivery Details',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey.shade900,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                    SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Courier',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 12,
                                  )),
                        ),
                        Text(
                          'DHL EXPRESS',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                    SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'AWB Number',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 12,
                                  )),
                        ),
                        Text(
                          'JEFBWEQ3513269128',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                    SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery Address',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 12,
                                  )),
                        ),
                        Text(
                          'Akshay kumar',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                     SizedBox(
                    height: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                       
                        Text(
                          '051672622',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                       
                        Text(
                          'Mumbai,SIHI Strt 05',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                       
                        Text(
                          'INDIA',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height:10)
                ],
              ),
            ),
             SizedBox(
              height: 30,
            ),
            Container(
              height: 190,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300, spreadRadius: 3, blurRadius: 5)
              ]),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Text(
                          'Payment Information',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey.shade900,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                    SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Payment Method',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 12,
                                  )),
                        ),
                        Text(
                          'VISA Card Ending in 1423',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height:10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Divider(
                        height: 1,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    SizedBox(
                    height: 10,
                  ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Price',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 12,
                                  )),
                        ),
                        Text(
                          '₹ 180',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                    SizedBox(
                    height: 5,
                  ),
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Delivery (1.4 Kg)',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 12,
                                  )),
                        ),
                        Text(
                          '₹ 200',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                    SizedBox(height:10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Divider(
                        height: 1,
                        color: Colors.grey.shade400,
                      ),
                    ),
                     SizedBox(
                    height: 10,
                  ),
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Payment',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey.shade900,fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  )),
                        ),
                        Text(
                          '₹ 200',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
             SizedBox(
          height: 40,
        ),
             Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: InkWell(
            onTap: (){
             
            },
            child: Container(
              height: 45,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(
color:Colors.grey.shade400,spreadRadius: 1
                  )],
                  borderRadius: BorderRadius.circular(4)),
              child: Center(
                child: Text(
                  'Download Invoice',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.grey.shade800,
                          fontWeight: FontWeight.bold,
                          fontSize: 14)),
                ),
              ),
            ),
          ),
        ),
             SizedBox(
          height: 10,
        ),
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
                          return HelpSupport();
                        }));
            },
            child: Container(
              height: 45,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.blue.shade900,
                  borderRadius: BorderRadius.circular(4)),
              child: Center(
                child: Text(
                  'Contact Us',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14)),
                ),
              ),
            ),
          ),
        ),
            SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
