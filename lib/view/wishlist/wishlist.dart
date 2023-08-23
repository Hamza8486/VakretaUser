import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vkreta/models/WishlistModel.dart';
import 'package:vkreta/models/bages_model.dart';
import 'package:vkreta/view/home/controller/home_controller.dart';
import 'package:vkreta/view/product/productdisplay.dart';
import 'package:vkreta/services/apiservice.dart';
import 'package:vkreta/view/wishlist/wishlistwithnoitems.dart';

import '../../models/cartModel.dart';

class WishList extends StatefulWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  int customer_id = 0;
  SharedPreferences? sharedPrefs;
  Map<String, String> selectedVariants = {};

  @override
  initState() {
    super.initState();
    getSharedPref();
  }

  Future<void> getSharedPref() async {
    SharedPreferences.getInstance().then((prefs) {
      // setState(() => sharedPrefs = prefs);
      sharedPrefs = prefs;
      int? _customer_id = sharedPrefs?.getInt("customer_id");
      setState(() {
        customer_id = _customer_id!.toInt();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: FutureBuilder<WishlistModel>(
          future: ApiService().getWishlist(customer_id),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.products.length > 0) {
                return SafeArea(
                  child: Stack(children: [
                    SingleChildScrollView(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(color: Colors.grey.shade100),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 130.0),
                          child: Column(
                            children: [
                              for (int index = 0;
                              index < snapshot.data.products.length;
                              index++)
                                Column(
                                  children: [
                                    SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Get.put(HomeController()).clearValueAll();
                                              Navigator.of(context).push(
                                                  PageRouteBuilder(
                                                      transitionDuration:
                                                      Duration(seconds: 1),
                                                      transitionsBuilder:
                                                          (BuildContext context,
                                                          Animation<double>
                                                          animation,
                                                          Animation<double>
                                                          secAnimation,
                                                          Widget child) {
                                                        animation =
                                                            CurvedAnimation(
                                                                parent:
                                                                animation,
                                                                curve: Curves
                                                                    .linear);
                                                        return SharedAxisTransition(
                                                            child: child,
                                                            animation:
                                                            animation,
                                                            secondaryAnimation:
                                                            secAnimation,
                                                            transitionType:
                                                            SharedAxisTransitionType
                                                                .horizontal);
                                                      },
                                                      pageBuilder: (BuildContext
                                                      context,
                                                          Animation<double>
                                                          animation,
                                                          Animation<double>
                                                          secAnimation) {
                                                        return ProductDisplay(
                                                            int.parse(snapshot
                                                                .data!
                                                                .products[index]
                                                                .productId
                                                                .toString()));
                                                      }));
                                            },
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 15),
                                              child: Container(
                                                // height: 180,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        7),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors
                                                              .grey.shade300,
                                                          spreadRadius: 1,
                                                          blurRadius: 4,
                                                          offset: Offset(3, 3))
                                                    ]),
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 2,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .center,
                                                      children: [
                                                        Container(
                                                          height: 120,
                                                          width: MediaQuery.of(
                                                              context)
                                                              .size
                                                              .width /
                                                              3,
                                                          color: Colors.white,
                                                          child: Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                            child: Image.network(
                                                                snapshot
                                                                    .data
                                                                    .products[
                                                                index]
                                                                    .thumb),
                                                          ),
                                                        ),
                                                        Container(
                                                          height: 120,
                                                          width: MediaQuery.of(
                                                              context)
                                                              .size
                                                              .width /
                                                              2,
                                                          color: Colors.white,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              SizedBox(
                                                                  height: 7),
                                                              Text(
                                                                snapshot
                                                                    .data!
                                                                    .products[
                                                                index]
                                                                    .name,
                                                                overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                                style: GoogleFonts.poppins(
                                                                    textStyle: TextStyle(
                                                                        color: Colors
                                                                            .grey
                                                                            .shade900,
                                                                        fontSize:
                                                                        13)),
                                                              ),
                                                              const SizedBox(
                                                                height: 4,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    snapshot
                                                                        .data!
                                                                        .products[
                                                                    index]
                                                                        .price,
                                                                    style: GoogleFonts.poppins(
                                                                        textStyle: const TextStyle(
                                                                            color:
                                                                            Colors.black,
                                                                            fontWeight: FontWeight.bold,
                                                                            fontSize: 12)),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    snapshot
                                                                        .data!
                                                                        .products[
                                                                    index]
                                                                        .special.toString(),
                                                                    style: GoogleFonts.poppins(
                                                                        textStyle: TextStyle(
                                                                            color:
                                                                            Colors.grey.shade700,
                                                                            fontSize: 9)),
                                                                  ),
                                                                ],
                                                              ),
                                                              const SizedBox(
                                                                height: 1,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  for (int i =
                                                                  0;
                                                                  i <
                                                                      snapshot
                                                                          .data
                                                                          .products[index]
                                                                          .rating;
                                                                  i++)
                                                                    const Icon(
                                                                      Icons
                                                                          .star,
                                                                      color: Colors
                                                                          .orange,
                                                                      size: 13,
                                                                    ),
                                                                  const SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Text(
                                                                    snapshot
                                                                        .data!
                                                                        .products[
                                                                    index]
                                                                        .rating
                                                                        .toString(),
                                                                    style: GoogleFonts.poppins(
                                                                        textStyle: TextStyle(
                                                                            color:
                                                                            Colors.grey.shade700,
                                                                            fontSize: 11)),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 1,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    snapshot
                                                                        .data!
                                                                        .products[index]
                                                                        .quantity
                                                                        .toString() +
                                                                        ' sale',
                                                                    style: GoogleFonts.poppins(
                                                                        textStyle: TextStyle(
                                                                            color:
                                                                            Colors.grey.shade700,
                                                                            fontSize: 11)),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    if (snapshot
                                                        .data
                                                        .products[index]
                                                        .options
                                                        .length >
                                                        0)
                                                      Column(
                                                        children: [
                                                          for (int option = 0;
                                                          option <
                                                              snapshot
                                                                  .data
                                                                  .products[
                                                              index]
                                                                  .options
                                                                  .length;
                                                          ++option)
                                                            Column(
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                      10),
                                                                  child: Row(
                                                                    children: [
                                                                      Text(
                                                                        snapshot
                                                                            .data
                                                                            .products[index]
                                                                            .options[option]
                                                                            .name,
                                                                        style: GoogleFonts.poppins(
                                                                            textStyle:
                                                                            TextStyle(color: Colors.grey.shade500, fontSize: 14)),
                                                                      ),
                                                                      // Text(
                                                                      //   'XS',
                                                                      //   style: GoogleFonts.poppins(
                                                                      //       textStyle: TextStyle(
                                                                      //           color: Colors.grey.shade900,
                                                                      //           fontWeight: FontWeight.bold,
                                                                      //           fontSize: 14)),
                                                                      // ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  height: 5,
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                      10),
                                                                  child: SingleChildScrollView(
                                                                    scrollDirection: Axis.horizontal,
                                                                    child: Row(
                                                                      children: [
                                                                        for (int optionValues =
                                                                        0;
                                                                        optionValues <
                                                                            snapshot.data.products[index].options[option].productOptionValue.length;
                                                                        ++optionValues)
                                                                          InkWell(
                                                                            onTap:
                                                                                () {
                                                                              // print(selectedVariants);
                                                                              String
                                                                              product_option_id =
                                                                                  snapshot.data.products[index].options[option].productOptionId;
                                                                              String
                                                                              product_option_value_id =
                                                                                  snapshot.data.products[index].options[option].productOptionValue[optionValues].productOptionValueId;
                                                                              if (selectedVariants.containsKey(product_option_id)) {
                                                                                selectedVariants[product_option_id] = product_option_value_id;
                                                                              } else {
                                                                                selectedVariants.addAll({
                                                                                  product_option_id: product_option_value_id
                                                                                });
                                                                              }
                                                                              setState(() {});
                                                                            },
                                                                            child:
                                                                            Container(
                                                                              // height: 35,
                                                                              // width: 35,
                                                                              padding: const EdgeInsets.fromLTRB(
                                                                                  10,
                                                                                  5,
                                                                                  10,
                                                                                  5),
                                                                              margin:
                                                                              const EdgeInsets.only(right: 5),
                                                                              decoration:
                                                                              BoxDecoration(
                                                                                color: selectedVariants.containsKey(snapshot.data.products[index].options[option].productOptionId)
                                                                                    ? selectedVariants[snapshot.data.products[index].options[option].productOptionId] == snapshot.data.products[index].options[option].productOptionValue[optionValues].productOptionValueId
                                                                                    ? Colors.blue.shade900
                                                                                    : Colors.black26
                                                                                    : Colors.black26,
                                                                                borderRadius: BorderRadiusDirectional.circular(7),
                                                                              ),
                                                                              child:
                                                                              Center(
                                                                                child: Text(
                                                                                  snapshot.data.products[index].options[option].productOptionValue[optionValues].name,
                                                                                  style: GoogleFonts.poppins(textStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize:11)),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 15,
                                                                ),
                                                              ],
                                                            ),
                                                        ],
                                                      ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 12),
                                                      child: Row(
                                                        // mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Container(
                                                            height: 40,
                                                            width: 40,
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                BorderRadiusDirectional
                                                                    .circular(7),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                      color: Colors
                                                                          .grey
                                                                          .shade400,
                                                                      spreadRadius:
                                                                      1)
                                                                ]),
                                                            child: InkWell(
                                                              onTap: () async {
                                                                final delete = await ApiService().removewishlistproduct(
                                                                    int.parse(snapshot
                                                                        .data!
                                                                        .products[
                                                                    index]
                                                                        .productId));

                                                                // print(delete);
                                                                String? error =
                                                                    '';
                                                                // print(signUp.firstname);
                                                                // signUp.then((value){
                                                                if (delete
                                                                    .error !=
                                                                    null) {
                                                                  error = delete
                                                                      .error;
                                                                }
                                                                // });

                                                                // snapshot.data!
                                                                //     .products.remove(index);

                                                                // print error if found from api
                                                                if (error !=
                                                                    '') {
                                                                  ScaffoldMessenger.of(
                                                                      context)
                                                                      .showSnackBar(
                                                                      SnackBar(
                                                                        content: Text(
                                                                            error!),
                                                                        backgroundColor:
                                                                        Colors
                                                                            .red,
                                                                      ));
                                                                }
                                                                if (delete
                                                                    .success !=
                                                                    null) {
                                                                  Provider.of<BadgesModel>(
                                                                      context,
                                                                      listen:
                                                                      false)
                                                                      .updateWishList(
                                                                      -1);

                                                                  ScaffoldMessenger.of(
                                                                      context)
                                                                      .showSnackBar(
                                                                      const SnackBar(
                                                                        content: Text(
                                                                            'product delete successfully'),
                                                                        backgroundColor:
                                                                        Colors
                                                                            .green,
                                                                      ));

                                                                  setState(
                                                                          () {});

                                                                  //  this is ok now wo go to login screen
                                                                  // Navigator.pushReplacement(context,
                                                                  //     MaterialPageRoute(builder: (context) {
                                                                  //       return const WishList();
                                                                  //     }));
                                                                }
                                                              },
                                                              child: Center(
                                                                child: Icon(
                                                                  Icons.delete,
                                                                  color: Colors
                                                                      .grey
                                                                      .shade700,
                                                                  size: 23,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          InkWell(
                                                            onTap: () async {
                                                              final addcart = await ApiService().AddToCart(key:"",
                                                                  product_id:  int.parse(snapshot
                                                                      .data!
                                                                      .products[
                                                                  index]
                                                                      .productId),
                                                                  quantity: 1,
                                                                  id: ""
                                                              );


                                                              String? error =
                                                                  '';
                                                              // print(signUp.firstname);
                                                              // signUp.then((value){
                                                              if (addcart
                                                                  .error !=
                                                                  null) {
                                                                error = addcart
                                                                    .error;
                                                              }
                                                              if (error != '') {
                                                                ScaffoldMessenger.of(
                                                                    context)
                                                                    .showSnackBar(
                                                                    SnackBar(
                                                                      content: Text(
                                                                          error!),
                                                                      backgroundColor:
                                                                      Colors
                                                                          .red,
                                                                    ));
                                                              }

                                                              if (addcart
                                                                  .success !=
                                                                  null) {
                                                                Provider.of<BadgesModel>(
                                                                    context,
                                                                    listen:
                                                                    false)
                                                                    .updatecart(
                                                                    1);
                                                                ScaffoldMessenger.of(
                                                                    context)
                                                                    .showSnackBar(
                                                                    SnackBar(
                                                                      content: Text(
                                                                          'product AddToCart successfully'),
                                                                      backgroundColor:
                                                                      Colors
                                                                          .green,
                                                                    ));
                                                              }
                                                            },
                                                            child: Container(
                                                              height: 40,
                                                              width: MediaQuery.of(
                                                                  context)
                                                                  .size
                                                                  .width -
                                                                  106, // - 40 - 26 - 40,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(7),
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                        color: Colors
                                                                            .blue
                                                                            .shade900,
                                                                        spreadRadius:
                                                                        1)
                                                                  ]),
                                                              child: Center(
                                                                child: Text(
                                                                  'Add To Shopping Cart',
                                                                  style: GoogleFonts.poppins(
                                                                      textStyle: TextStyle(
                                                                          color: Colors
                                                                              .blue
                                                                              .shade900,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                          14)),
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
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
                                padding:
                                const EdgeInsets.symmetric(horizontal: 15),
                                child: Text(
                                  'Wishlist',
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Colors.grey.shade900,
                                          fontSize: 17)),
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
                          decoration:const BoxDecoration(
                            color: Colors.white,
                            // boxShadow: [BoxShadow(
                            //   color: Colors.grey.shade100,spreadRadius: 5,
                            //   offset: Offset(0, 5)
                            // )]
                          ),
                          child: Center(
                            child: Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 15),
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
                                            color: Colors.grey.shade600,
                                            fontSize: 14))),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
                );
              } else {
                return const WishListWiNoItems();
              }
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
