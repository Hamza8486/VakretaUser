import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vkreta/view/others/helpsupport.dart';
import 'package:vkreta/view/order_history/orderdetail.dart';
import 'package:vkreta/view/home/selectscreen.dart';

class ReturnTracking extends StatefulWidget {
  const ReturnTracking({Key? key}) : super(key: key);

  @override
  State<ReturnTracking> createState() => _ReturnTrackingState();
}

class _ReturnTrackingState extends State<ReturnTracking> {
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
          'Return Tracking',
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
                  height: 500,
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
                  height: 500,
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
                            'Return Requested',
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
                            'Your return is completed',
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
                            'Return Request Approved/Denied',
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
                            'Return Pickup Scheduled',
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
                            'Pickedup',
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
                       SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Text(
                            'Item Recieved',
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
                       SizedBox(
                        height:25,
                      ),
                      Row(
                        children: [
                          Text(
                            'Refund initiated',
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
            SizedBox(height: 50,),
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
                        return SelectScreen();
                            }));
                        },
                        child: Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade900,
                            borderRadius: BorderRadius.circular(5),
                            
                          ),
                          child: Center(
                            child: Text('Continue',
                            style: GoogleFonts.poppins(
                              textStyle:TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14
                              )
                            ),),
                          ),
                        ),
                            ),
                      ),
                      SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}