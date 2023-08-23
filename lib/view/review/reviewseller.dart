import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SellerReview extends StatefulWidget {
  const SellerReview({Key? key}) : super(key: key);

  @override
  State<SellerReview> createState() => _SellerReviewState();
}

class _SellerReviewState extends State<SellerReview> {
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
          'Seller Review',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 16)),
        ),
       
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                   
                   
                
                   
                  
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                Container(
                height: 140,
                width: MediaQuery.of(context).size.width/2,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset('assets/sell.png'),
                ),
                ),
              
                      ],
                    ),
                    
                 
                
                  ],
                ),
              ),
             // SizedBox(height: 10,),
              Text(
            'Suresh Store',
            style: GoogleFonts.poppins(
                textStyle: TextStyle(color: Colors.blue, fontSize: 18,fontWeight: FontWeight.bold)),
          ),
           Text(
            '25th May, 2022',
            style: GoogleFonts.poppins(
                textStyle: TextStyle(color: Colors.black, fontSize: 12,fontWeight: FontWeight.bold)),
          ),
              SizedBox(height: 50,),
              Text(
            'Give Rating',
            style: GoogleFonts.poppins(
                textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 18,fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 35,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size:35,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 35,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 35,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 35,
                                ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
            'Hello John Carlo! do you really like the seller communication? Give your review below',
            style: GoogleFonts.poppins(
                textStyle: TextStyle(color: Colors.grey.shade600, fontSize: 14)),
          ),
                    ),
                      SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Feedback',
                      hintStyle: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.grey.shade400, fontSize: 14))),
                ),
                          ),
                             SizedBox(height: 40,),
              
                            SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
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
                  ),
                )
          ],
        ),
      ),
    );
  }
}