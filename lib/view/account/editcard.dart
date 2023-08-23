import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditCard extends StatefulWidget {
  const EditCard({Key? key}) : super(key: key);

  @override
  State<EditCard> createState() => _EditCardState();
}

class _EditCardState extends State<EditCard> {
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
          'Credit Card',
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
                    'Credit Card Information',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.grey.shade900,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
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
                      width: 40,
                      child: Image.asset(
                        'assets/visa.jpg',
                        fit: BoxFit.fill,
                      )),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                      height: 20,
                      width: 30,
                      child: Image.asset(
                        'assets/master.png',
                        fit: BoxFit.fill,
                      )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Credit Card Number *',
                    hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.grey.shade400, fontSize: 14))),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Name of Cardholder *',
                    hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.grey.shade400, fontSize: 14))),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    'Expired Date *',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 12,
                    )),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 250,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: TextFormField(
                          decoration: InputDecoration(
                              suffixIcon: PopupMenuButton(
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black,
                                  size: 25,
                                ),
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                      child: Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                    
                                      SizedBox(height: 10,),
                                      GestureDetector(
                                        onTap: (){
                                          
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "01",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade900,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                       SizedBox(height: 10,),
                                      GestureDetector(
                                        onTap: (){
                                          
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "02",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade900,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                       SizedBox(height: 10,),
                                      GestureDetector(
                                        onTap: (){
                                          
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "03",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade900,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                       SizedBox(height: 10,),
                                      GestureDetector(
                                        onTap: (){
                                          
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "04",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade900,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                       SizedBox(height: 10,),
                                      GestureDetector(
                                        onTap: (){
                                          
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "05",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade900,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                       SizedBox(height: 10,),
                                      GestureDetector(
                                        onTap: (){
                                          
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "06",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade900,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                       SizedBox(height: 10,),
                                      GestureDetector(
                                        onTap: (){
                                          
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "07",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade900,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                        SizedBox(height: 10,),
                                      GestureDetector(
                                        onTap: (){
                                          
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "08",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade900,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                       SizedBox(height: 10,),
                                      GestureDetector(
                                        onTap: (){
                                          
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "09",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade900,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                       SizedBox(height: 10,),
                                      GestureDetector(
                                        onTap: (){
                                          
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "10",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade900,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                       SizedBox(height: 10,),
                                      GestureDetector(
                                        onTap: (){
                                          
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "11",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade900,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                       SizedBox(height: 10,),
                                      GestureDetector(
                                        onTap: (){
                                          
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "12",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade900,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                       SizedBox(height: 10,),
                                      GestureDetector(
                                        onTap: (){
                                          
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "13",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade900,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                       SizedBox(height: 10,),
                                      GestureDetector(
                                        onTap: (){
                                          
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "14",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade900,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                       SizedBox(height: 10,),
                                      GestureDetector(
                                        onTap: (){
                                          
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "15",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade900,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                       SizedBox(height: 10,),
                                      GestureDetector(
                                        onTap: (){
                                          
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "16",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade900,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                       SizedBox(height: 10,),
                                      GestureDetector(
                                        onTap: (){
                                          
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "17",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade900,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                       SizedBox(height: 10,),
                                      GestureDetector(
                                        onTap: (){
                                          
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "18",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade900,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                       SizedBox(height: 10,),
                                      GestureDetector(
                                        onTap: (){
                                          
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "19",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade900,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                        SizedBox(height: 10,),
                                      GestureDetector(
                                        onTap: (){
                                          
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "20",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade900,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                       SizedBox(height: 10,),
                                      GestureDetector(
                                        onTap: (){
                                          
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "21",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade900,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                       SizedBox(height: 10,),
                                      GestureDetector(
                                        onTap: (){
                                          
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "22",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade900,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                       SizedBox(height: 10,),
                                      GestureDetector(
                                        onTap: (){
                                          
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "23",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade900,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                       SizedBox(height: 10,),
                                      GestureDetector(
                                        onTap: (){
                                          
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "24",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade900,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                        SizedBox(height: 10,),
                                      GestureDetector(
                                        onTap: (){
                                          
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "25",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade900,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                        SizedBox(height: 10,),
                                      GestureDetector(
                                        onTap: (){
                                          
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "26",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade900,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                       SizedBox(height: 10,),
                                      GestureDetector(
                                        onTap: (){
                                          
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "27",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade900,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                       SizedBox(height: 10,),
                                      GestureDetector(
                                        onTap: (){
                                          
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "28",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade900,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                       SizedBox(height: 10,),
                                      GestureDetector(
                                        onTap: (){
                                          
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "29",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade900,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                       SizedBox(height: 10,),
                                      GestureDetector(
                                        onTap: (){
                                          
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "30",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade900,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ))
                                ],
                              ),
                              hintText: 'Date',
                              hintStyle: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.grey.shade400, fontSize: 13))),
                        )),
                        SizedBox(width: 10,),
                         Expanded(
                            child: TextFormField(
                          decoration: InputDecoration(
                              suffixIcon: PopupMenuButton(
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black,
                                  size: 25,
                                ),
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                      child: Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                    
                                      SizedBox(height: 10,),
                                      GestureDetector(
                                        onTap: (){
                                          
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "January",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade900,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                       SizedBox(height: 10,),
                                      GestureDetector(
                                        onTap: (){
                                          
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "Febuary",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade900,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                       SizedBox(height: 10,),
                                      GestureDetector(
                                        onTap: (){
                                          
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "March",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade900,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                       SizedBox(height: 10,),
                                      GestureDetector(
                                        onTap: (){
                                          
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "April",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade900,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                       SizedBox(height: 10,),
                                      GestureDetector(
                                        onTap: (){
                                          
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "May",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade900,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                       SizedBox(height: 10,),
                                      GestureDetector(
                                        onTap: (){
                                          
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "June",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade900,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                       SizedBox(height: 10,),
                                      GestureDetector(
                                        onTap: (){
                                          
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "July",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade900,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                        SizedBox(height: 10,),
                                      GestureDetector(
                                        onTap: (){
                                          
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "August",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade900,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                       SizedBox(height: 10,),
                                      GestureDetector(
                                        onTap: (){
                                          
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "September",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade900,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                       SizedBox(height: 10,),
                                      GestureDetector(
                                        onTap: (){
                                          
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "October",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade900,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                       SizedBox(height: 10,),
                                      GestureDetector(
                                        onTap: (){
                                          
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "November",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade900,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                       SizedBox(height: 10,),
                                      GestureDetector(
                                        onTap: (){
                                          
                                        },
                                        child: Row(
                                          children: [
                                            Text(
                                              "December",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey.shade900,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ))
                                ],
                              ),
                              hintText: 'Month',
                              hintStyle: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.grey.shade400, fontSize: 13))),
                        )),
                      ],
                    ),
                  ),
                ],
              ),
                SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Billing Information',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.grey.shade900,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
                
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Full Name *',
                    hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.grey.shade400, fontSize: 14))),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Company Name *',
                    hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.grey.shade400, fontSize: 14))),
              ),
               SizedBox(
                height: 20,
              ),
                
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Address Line 1 *',
                    hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.grey.shade400, fontSize: 14))),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Address Line 2 *',
                    hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.grey.shade400, fontSize: 14))),
              ),
               SizedBox(
                height: 20,
              ),
                
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'City *',
                    hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.grey.shade400, fontSize: 14))),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'State/Province/Region *',
                    hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.grey.shade400, fontSize: 14))),
              ),
               SizedBox(
                height: 20,
              ),
                
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Postal Code *',
                    hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.grey.shade400, fontSize: 14))),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Phone Number *',
                    hintStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.grey.shade400, fontSize: 14))),
              ),
              SizedBox(height: 40,),
              Container(
                height: 45,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.blue.shade900,
                  borderRadius:BorderRadius.circular(4),

                ),
                child: Center(
                  child: Text(
                    'Save',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
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
