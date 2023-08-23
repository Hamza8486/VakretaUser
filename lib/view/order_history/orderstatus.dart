import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vkreta/view/others/helpsupport.dart';

class OrderStatus extends StatefulWidget {
  const OrderStatus({Key? key}) : super(key: key);

  @override
  State<OrderStatus> createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
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
          'Order Status',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 16)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  height: 400,
                  width: MediaQuery.of(context).size.width / 5,
                  color: Colors.white,
                  child: Column(children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 16,
                      width: 16,
                      decoration: BoxDecoration(
                          color: Colors.blue.shade900, shape: BoxShape.circle),
                    ),
                    Container(
                      height: 70,
                      width: 1,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade900,
                      ),
                    ),
                    Container(
                      height: 16,
                      width: 16,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade400, shape: BoxShape.circle),
                    ),
                    Container(
                      height: 70,
                      width: 1,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                      ),
                    ),
                       Container(
                      height: 16,
                      width: 16,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade400, shape: BoxShape.circle),
                    ),
                    Container(
                      height: 70,
                      width: 1,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                      ),
                    ),
                     Container(
                      height: 16,
                      width: 16,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade400, shape: BoxShape.circle),
                    ),
                   
                   
                  ]),
                ),
                Container(
                  height: 400,
                  width: MediaQuery.of(context).size.width / 1.5,
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text(
                            'Order Placed',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.grey.shade900,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                        children: [
                          Text(
                            '14 November 2022 09:00',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.grey.shade500, fontSize: 12)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 0,
                      ),
                      Row(
                        children: [
                          Text(
                            'Your order is completed',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.grey.shade700, fontSize: 13)),
                          ),
                        ],
                      ),
                       SizedBox(
                        height: 27,
                      ),
                      Row(
                        children: [
                          Text(
                            'Order in Transit',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.grey.shade900,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                        children: [
                          Text(
                            '14 November 2022 09:00',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.grey.shade500, fontSize: 12)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 0,
                      ),
                      Row(
                        children: [
                          Text(
                            'Your order has arrived',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.grey.shade700, fontSize: 13)),
                          ),
                        ],
                      ),
                       SizedBox(
                        height: 26,
                      ),
                      Row(
                        children: [
                          Text(
                            'Out for delivery',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.grey.shade900,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                        children: [
                          Text(
                            '14 November 2022 09:00',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.grey.shade500, fontSize: 12)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 0,
                      ),
                      Text(
                        'Your order is being shipped by courier',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.grey.shade700, fontSize: 13)),
                      ),
                       SizedBox(
                        height: 9,
                      ),
                      Row(
                        children: [
                          Text(
                            'Delivered',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.grey.shade900,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                       SizedBox(
                        height: 2,
                      ),
                      Row(
                        children: [
                          Text(
                            '14 November 2022 09:00',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.grey.shade500, fontSize: 12)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 0,
                      ),
                      Row(
                        children: [
                          Text(
                            'Your order has been delivered',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.grey.shade700, fontSize: 13)),
                          ),
                        ],
                      ),
                     
                     
                    ],
                  ),
                )
              ],
            ),
             SizedBox(height: 40,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: (){
                              
                              },
                              child: Container(
                                height: 38,
                                width: 130,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [BoxShadow(
                                    color: Colors.grey.shade400,
                                    spreadRadius: 1
                                  )]
                                ),
                                child: Center(
                                  child: Text('Cancel Order',
                                  style: GoogleFonts.poppins(
                                    textStyle:TextStyle(
                                      color: Colors.grey.shade800,
                                      fontSize: 15
                                    )
                                  ),),
                                ),
                              ),
                            ),
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
                              return HelpSupport();
                            }));
                              },
                              child: Container(
                                height: 40,
                                width: 130,
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade900,
                                  borderRadius: BorderRadius.circular(5),
                                  
                                ),
                                child: Center(
                                  child: Text('Need Help?',
                                  style: GoogleFonts.poppins(
                                    textStyle:TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14
                                    )
                                  ),),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
          ],
        ),
      ),
    );
  }
}
