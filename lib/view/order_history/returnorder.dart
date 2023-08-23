import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vkreta/view/order_history/returntracking.dart';

class ReturnOrder extends StatefulWidget {
  const ReturnOrder({Key? key}) : super(key: key);

  @override
  State<ReturnOrder> createState() => _ReturnOrderState();
}

class _ReturnOrderState extends State<ReturnOrder> {
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
          'Return/Replace Order',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Colors.grey.shade900,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: 110,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Image.asset(
                      'assets/shirt.png',
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 110,
                      width: MediaQuery.of(context).size.width / 1.7,
                      // color: Colors.pink,
                      child: Column(
                        children: [
                          Text(
                            'Red Shirt Full branded Size Waterproof',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.grey.shade900,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Text(
                            'Anything here what do u want abouth this product',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 12,
                            )),
                          ),
                          Row(
                            children: [
                              Text(
                                '₹ 100',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                  color: Colors.red,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                height: 1,
                color: Colors.grey.shade500,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'What is the issue with item?',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    )),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300, shape: BoxShape.circle),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Product damaged, but shipping box OK',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    )),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300, shape: BoxShape.circle),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Both product and shipping box damaged',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    )),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300, shape: BoxShape.circle),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Wrong item was sent',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    )),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300, shape: BoxShape.circle),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Item defective,spoilit,expired or doesnot work',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    )),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300, shape: BoxShape.circle),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Items or part missing',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    )),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Text(
                    'ADD MORE ITEMS TO THE RETURN',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                    )),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(value: true, onChanged:
                        (value){
                          setState(() {
                            value=false;
                          });
                        }
                        )
                        // Container(
                        //   height: 20,
                        //   width: 20,
                        //   decoration: BoxDecoration(
                        //     color: Colors.grey.shade300,
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 120,
                      width: MediaQuery.of(context).size.width / 1.6,
                      child: Text(
                        'Yes , I understand and agree to the vkreta return policy, and terms of use policy ,including  user agreement, If  product comes under  return policy only then return or replace takes place.',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
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
                            return ReturnTracking();
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
                    'Continue',
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
          SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
