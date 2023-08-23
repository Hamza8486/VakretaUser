import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddOrEditReview extends StatefulWidget {
  const AddOrEditReview({Key? key}) : super(key: key);

  @override
  State<AddOrEditReview> createState() => _AddOrEditReviewState();
}

class _AddOrEditReviewState extends State<AddOrEditReview> {
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
          'Review',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 16)),
        ),
       
      ),
      body: Column(
        children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                 
                 
              
                 
                
                  SizedBox(height: 20,),
                  Row(
                    children: [
              Container(
              height: 120,
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
           
              
                ],
              ),
              )
                    ],
                  ),
                  Divider(
                    height: 1,
                    color: Colors.grey.shade400,
                  ),
               
              
                ],
              ),
            ),
            SizedBox(height: 40,),
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
          'Hello John Carlo! do you really like the product? Give your review below',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(color: Colors.grey.shade600, fontSize: 14)),
        ),
                  ),
                    SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'Review',
                    hintStyle: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.grey.shade400, fontSize: 14))),
              ),
                        ),
                           SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(
                      color: Colors.grey.shade400,
                      spreadRadius: 1
                      
                    )],
                    borderRadius:BorderRadius.circular(4),

                  ),
                  child: Center(
                    child: Text(
                      'Upload Image',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.grey.shade800,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ),
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
    );
  }
}