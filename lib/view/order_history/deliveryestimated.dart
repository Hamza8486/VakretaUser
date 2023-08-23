import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryEstimated extends StatefulWidget {
  const DeliveryEstimated({Key? key}) : super(key: key);

  @override
  State<DeliveryEstimated> createState() => _DeliveryEstimatedState();
}

class _DeliveryEstimatedState extends State<DeliveryEstimated> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back, color: Colors.black, size: 25)),
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          'Delivery Estimated',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 16,fontWeight: FontWeight.bold)),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Row(
                children: [
                  Text(
            'Location',
            style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 15,fontWeight: FontWeight.bold)),
          ),
                ],
              ),
               SizedBox(height: 10,),
               Row(
                children: [
                  Text(
            'Delivery from : ',
            style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.grey.shade600, fontSize: 13,fontWeight: FontWeight.bold)),
          ),
                ],
              ),
             
            
               Row(
                children: [
                  Text(
            'Mumbai Road big Plaza, India',
            style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.grey.shade800, fontSize: 14)),
          ),
                ],
              ),
              SizedBox(height: 10,),
            Row(
                children: [
                  Text(
            'Delivery to : ',
            style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.grey.shade600, fontSize: 13,fontWeight: FontWeight.bold)),
          ),
                ],
              ),
               Row(
                children: [
                  Text(
            'Akshay Kumar',
            style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.grey.shade800, fontSize: 14)),
          ),
                ],
              ),
                Row(
                children: [
                  Text(
            '051 3673229',
            style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.grey.shade800, fontSize: 14)),
          ),
                ],
              ),
                Row(
                children: [
                  Text(
            '87392 Big Plaza',
            style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.grey.shade800, fontSize: 14)),
          ),
                ],
              ),
               Row(
                children: [
                  Text(
            'West Mumbai Beach,2862',
            style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.grey.shade800, fontSize: 14)),
          ),
                ],
              ),
                Row(
                children: [
                  Text(
            'INDIA',
            style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.grey.shade800, fontSize: 14)),
          ),
                ],
              ),
              SizedBox(height: 30,),
              Container(
                height: 10,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey.shade200,
              ),
              SizedBox(height: 30,),
              Row(
                children: [
                  Text(
            'Courier',
            style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 15,fontWeight: FontWeight.bold)),
          ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text(
            'Courier price based on weight per 1000gr',
            style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 15)),
          ),
                ],
              ),
              SizedBox(height: 10,),
              Divider(
                height: 1,
                color: Colors.grey.shade500,
              ),
              SizedBox(height: 20,),
                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                                  child: Row(
                                                    children: [
                                            Text(
                                              'DHL',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.bold,
                              fontSize: 15)),
                                            ),
                                                    ],
                                                  ),
                                              ),
                                               SizedBox(height: 10,),
                                              Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                                  child: Row(
                                                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                                    children: [
                                            Text(
                                              'Regular',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                              color: Colors.grey.shade700,
                              
                              fontSize: 14)),
                                            ),
                                             Text(
                                              '₹ 150',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                              color: Colors.grey.shade700,
                              
                              fontSize: 14)),
                                            ),
                                                    ],
                                                  ),
                                              ),
                                               SizedBox(height: 7,),
                                              Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                                  child: Row(
                                                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                                    children: [
                                            Text(
                                              'Express',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                              color: Colors.grey.shade700,
                              
                              fontSize: 14)),
                                            ),
                                             Text(
                                              '₹ 70',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                              color: Colors.grey.shade700,
                              
                              fontSize: 14)),
                                            ),
                                                    ],
                                                  ),
                                              ),
                                              SizedBox(height:10),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal:20),
                                                child: Divider(
                                                  height:1,
                                                  color:Colors.grey.shade300
                                                ),
                                              ),
                                                SizedBox(height: 20,),
                                              Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                                  child: Row(
                                                    children: [
                                            Text(
                                              'FedEx',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.bold,
                              fontSize: 15)),
                                            ),
                                                    ],
                                                  ),
                                              ),
                                               SizedBox(height: 10,),
                                              Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                                  child: Row(
                                                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                                    children: [
                                            Text(
                                              'Regular',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                              color: Colors.grey.shade700,
                              
                              fontSize: 14)),
                                            ),
                                             Text(
                                              '₹ 100',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                              color: Colors.grey.shade700,
                              
                              fontSize: 14)),
                                            ),
                                                    ],
                                                  ),
                                              ),
                                               SizedBox(height: 7,),
                                              Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                                  child: Row(
                                                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                                    children: [
                                            Text(
                                              'Express',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                              color: Colors.grey.shade700,
                              
                              fontSize: 14)),
                                            ),
                                             Text(
                                              '₹ 50',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                              color: Colors.grey.shade700,
                              
                              fontSize: 14)),
                                            ),
                                                    ],
                                                  ),
                                              ),
                                              SizedBox(height:10),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal:20),
                                                child: Divider(
                                                  height:1,
                                                  color:Colors.grey.shade300
                                                ),
                                              ),
                                                SizedBox(height: 20,),
                                              Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                                  child: Row(
                                                    children: [
                                            Text(
                                              'Other 1',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.bold,
                              fontSize: 15)),
                                            ),
                                                    ],
                                                  ),
                                              ),
                                               SizedBox(height: 10,),
                                              Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                                  child: Row(
                                                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                                    children: [
                                            Text(
                                              'Regular',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                              color: Colors.grey.shade700,
                              
                              fontSize: 14)),
                                            ),
                                             Text(
                                              '₹ 60',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                              color: Colors.grey.shade700,
                              
                              fontSize: 14)),
                                            ),
                                                    ],
                                                  ),
                                              ),
                                               SizedBox(height: 7,),
                                              Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                                  child: Row(
                                                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                                    children: [
                                            Text(
                                              'Express',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                              color: Colors.grey.shade700,
                              
                              fontSize: 14)),
                                            ),
                                             Text(
                                              '₹ 20',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                              color: Colors.grey.shade700,
                              
                              fontSize: 14)),
                                            ),
                                                    ],
                                                  ),
                                              ),
                                              SizedBox(height:10),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal:20),
                                                child: Divider(
                                                  height:1,
                                                  color:Colors.grey.shade300
                                                ),
                                              ),
                                                SizedBox(height: 20,),
                                              Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                                  child: Row(
                                                    children: [
                                            Text(
                                              'Other 2',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.bold,
                              fontSize: 15)),
                                            ),
                                                    ],
                                                  ),
                                              ),
                                               SizedBox(height: 10,),
                                              Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                                  child: Row(
                                                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                                    children: [
                                            Text(
                                              'Regular',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                              color: Colors.grey.shade700,
                              
                              fontSize: 14)),
                                            ),
                                             Text(
                                              '₹ 150',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                              color: Colors.grey.shade700,
                              
                              fontSize: 14)),
                                            ),
                                                    ],
                                                  ),
                                              ),
                                               SizedBox(height: 7,),
                                              Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                                  child: Row(
                                                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                                    children: [
                                            Text(
                                              'Express',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                              color: Colors.grey.shade700,
                              
                              fontSize: 14)),
                                            ),
                                             Text(
                                              '₹ 70',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                              color: Colors.grey.shade700,
                              
                              fontSize: 14)),
                                            ),
                                                    ],
                                                  ),
                                              ),
            ],
          ),
        ),
      ),
    );
  }
}