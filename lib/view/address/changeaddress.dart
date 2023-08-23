import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChanegAddress extends StatefulWidget {
  const ChanegAddress({Key? key}) : super(key: key);

  @override
  State<ChanegAddress> createState() => _ChanegAddressState();
}

class _ChanegAddressState extends State<ChanegAddress> {
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
          'Change Address',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 16)),
        ),
      ),
      backgroundColor:Colors.grey.shade50,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 190,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(
                    color: Colors.grey.shade300,
                    spreadRadius: 3,blurRadius: 5
                  )]
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Home Address',style: GoogleFonts.poppins(
                            textStyle:TextStyle(
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                            )
                          ),),
                          Container(
                            height: 20,width: 60,decoration: BoxDecoration(
                              color: Colors.blue.shade900,borderRadius: BorderRadius.circular(4)
                            ),
                            child: Center(
                              child: Text('Default',style: GoogleFonts.poppins(
                                textStyle:TextStyle(
                                  color: Colors.white,
                                
                                  fontSize: 12
                                )
                              ),),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         child: Row(
                           children: [
                             Text('Akshay Kumar',style: GoogleFonts.poppins(
                                  textStyle:TextStyle(
                                    color: Colors.grey.shade900,
                                    
                                    fontSize: 14
                                  )
                                ),),
                           ],
                         ),
                       ),
                         SizedBox(height: 5,),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         child: Row(
                           children: [
                             Text('051 352673',style: GoogleFonts.poppins(
                                  textStyle:TextStyle(
                                    color: Colors.grey.shade900,
                                    
                                    fontSize: 14
                                  )
                                ),),
                           ],
                         ),
                       ),
                        SizedBox(height: 5,),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         child: Row(
                           children: [
                             Text('73726 Mumbai Road',style: GoogleFonts.poppins(
                                  textStyle:TextStyle(
                                    color: Colors.grey.shade900,
                                    
                                    fontSize: 14
                                  )
                                ),),
                           ],
                         ),
                       ),
                         SizedBox(height: 5,),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         child: Row(
                           children: [
                             Text('North Mumbai Beach',style: GoogleFonts.poppins(
                                  textStyle:TextStyle(
                                    color: Colors.grey.shade900,
                                    
                                    fontSize: 14
                                  )
                                ),),
                           ],
                         ),
                       ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                           children: [
                             Text('India',style: GoogleFonts.poppins(
                                  textStyle:TextStyle(
                                    color: Colors.grey.shade900,
                                    
                                    fontSize: 14
                                  )
                                ),),
                           ],
                       ),
                        ),
      
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 190,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(
                    color: Colors.grey.shade300,
                    spreadRadius: 3,blurRadius: 5
                  )]
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Home Address',style: GoogleFonts.poppins(
                            textStyle:TextStyle(
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                            )
                          ),),
                        
                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         child: Row(
                           children: [
                             Text('Akshay Kumar',style: GoogleFonts.poppins(
                                  textStyle:TextStyle(
                                    color: Colors.grey.shade900,
                                    
                                    fontSize: 14
                                  )
                                ),),
                           ],
                         ),
                       ),
                         SizedBox(height: 5,),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         child: Row(
                           children: [
                             Text('051 352673',style: GoogleFonts.poppins(
                                  textStyle:TextStyle(
                                    color: Colors.grey.shade900,
                                    
                                    fontSize: 14
                                  )
                                ),),
                           ],
                         ),
                       ),
                        SizedBox(height: 5,),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         child: Row(
                           children: [
                             Text('73726 Mumbai Road',style: GoogleFonts.poppins(
                                  textStyle:TextStyle(
                                    color: Colors.grey.shade900,
                                    
                                    fontSize: 14
                                  )
                                ),),
                           ],
                         ),
                       ),
                         SizedBox(height: 5,),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         child: Row(
                           children: [
                             Text('North Mumbai Beach',style: GoogleFonts.poppins(
                                  textStyle:TextStyle(
                                    color: Colors.grey.shade900,
                                    
                                    fontSize: 14
                                  )
                                ),),
                           ],
                         ),
                       ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text('India',style: GoogleFonts.poppins(
                                  textStyle:TextStyle(
                                    color: Colors.grey.shade900,
                                    
                                    fontSize: 14
                                  )
                                ),),
                                  Text('Use this',style: GoogleFonts.poppins(
                                    textStyle:TextStyle(
                                      color: Colors.blue.shade900,
                                    fontWeight: FontWeight.bold,
                                      fontSize: 13
                                    )
                                  ),),
                           ],
                       ),
                        ),
      
                  ],
                ),
              ),
            ),
             SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 190,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(
                    color: Colors.grey.shade300,
                    spreadRadius: 3,blurRadius: 5
                  )]
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Home Address',style: GoogleFonts.poppins(
                            textStyle:TextStyle(
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                            )
                          ),),
                         
                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         child: Row(
                           children: [
                             Text('Akshay Kumar',style: GoogleFonts.poppins(
                                  textStyle:TextStyle(
                                    color: Colors.grey.shade900,
                                    
                                    fontSize: 14
                                  )
                                ),),
                           ],
                         ),
                       ),
                         SizedBox(height: 5,),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         child: Row(
                           children: [
                             Text('051 352673',style: GoogleFonts.poppins(
                                  textStyle:TextStyle(
                                    color: Colors.grey.shade900,
                                    
                                    fontSize: 14
                                  )
                                ),),
                           ],
                         ),
                       ),
                        SizedBox(height: 5,),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         child: Row(
                           children: [
                             Text('73726 Mumbai Road',style: GoogleFonts.poppins(
                                  textStyle:TextStyle(
                                    color: Colors.grey.shade900,
                                    
                                    fontSize: 14
                                  )
                                ),),
                           ],
                         ),
                       ),
                         SizedBox(height: 5,),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         child: Row(
                           children: [
                             Text('North Mumbai Beach',style: GoogleFonts.poppins(
                                  textStyle:TextStyle(
                                    color: Colors.grey.shade900,
                                    
                                    fontSize: 14
                                  )
                                ),),
                           ],
                         ),
                       ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text('India',style: GoogleFonts.poppins(
                                  textStyle:TextStyle(
                                    color: Colors.grey.shade900,
                                    
                                    fontSize: 14
                                  )
                                ),),
                                Text('Use this',style: GoogleFonts.poppins(
                                    textStyle:TextStyle(
                                      color: Colors.blue.shade900,
                                    fontWeight: FontWeight.bold,
                                      fontSize: 13
                                    )
                                  ),),
                           ],
                       ),
                        ),
      
                  ],
                ),
              ),
            ),
             SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 190,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(
                    color: Colors.grey.shade300,
                    spreadRadius: 3,blurRadius: 5
                  )]
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Home Address',style: GoogleFonts.poppins(
                            textStyle:TextStyle(
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                            )
                          ),),
                        
                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         child: Row(
                           children: [
                             Text('Akshay Kumar',style: GoogleFonts.poppins(
                                  textStyle:TextStyle(
                                    color: Colors.grey.shade900,
                                    
                                    fontSize: 14
                                  )
                                ),),
                           ],
                         ),
                       ),
                         SizedBox(height: 5,),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         child: Row(
                           children: [
                             Text('051 352673',style: GoogleFonts.poppins(
                                  textStyle:TextStyle(
                                    color: Colors.grey.shade900,
                                    
                                    fontSize: 14
                                  )
                                ),),
                           ],
                         ),
                       ),
                        SizedBox(height: 5,),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         child: Row(
                           children: [
                             Text('73726 Mumbai Road',style: GoogleFonts.poppins(
                                  textStyle:TextStyle(
                                    color: Colors.grey.shade900,
                                    
                                    fontSize: 14
                                  )
                                ),),
                           ],
                         ),
                       ),
                         SizedBox(height: 5,),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         child: Row(
                           children: [
                             Text('North Mumbai Beach',style: GoogleFonts.poppins(
                                  textStyle:TextStyle(
                                    color: Colors.grey.shade900,
                                    
                                    fontSize: 14
                                  )
                                ),),
                           ],
                         ),
                       ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text('INDIA',style: GoogleFonts.poppins(
                                  textStyle:TextStyle(
                                    color: Colors.grey.shade900,
                                    
                                    fontSize: 14
                                  )
                                ),),
                                Text('Use this',style: GoogleFonts.poppins(
                                    textStyle:TextStyle(
                                      color: Colors.blue.shade900,
                                    fontWeight: FontWeight.bold,
                                      fontSize: 13
                                    )
                                  ),),
                           ],
                       ),
                        ),
      
                  ],
                ),
              ),
            ),
      SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}