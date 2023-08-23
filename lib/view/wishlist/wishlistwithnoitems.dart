import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vkreta/new/dashboard.dart';
import 'package:vkreta/view/home/home.dart';
import 'package:vkreta/view/product/productdisplay.dart';

class WishListWiNoItems extends StatefulWidget {
  const WishListWiNoItems({Key? key}) : super(key: key);

  @override
  State<WishListWiNoItems> createState() => _WishListWiNoItemsState();
}

class _WishListWiNoItemsState extends State<WishListWiNoItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Stack(children: [
          SingleChildScrollView(
          ),
          Column(
            children: [
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'Wishlist',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.grey.shade900, fontSize: 17)),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.notifications,
                              color: Colors.grey.shade700,
                              size: 22,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  // boxShadow: [BoxShadow(
                  //   color: Colors.grey.shade100,spreadRadius: 5,
                  //   offset: Offset(0, 5)
                  // )]
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey.shade600,
                            size: 25,
                          ),
                          isDense: true,
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                          hintText: 'Search Wishlist',
                          hintStyle: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey.shade600, fontSize: 14))),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 200,),
              Center(child: Text("Your Wishlist is Empty",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.grey.shade600,
              ),)),
              SizedBox(height: 10,),
              Center(
                child: Text("Explore more Items",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.grey.shade600,
                ),),
              ),
              SizedBox(height: 45,),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext)=>DashboardView()));
                },
                child: Text('Buy Products',style: TextStyle(
                  color: Colors.blue[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),),
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              )

            ],
          ),
        ]),
      ),
    );
  }
}
