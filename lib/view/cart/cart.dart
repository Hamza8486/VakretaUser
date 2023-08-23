
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vkreta/view/home/controller/home_controller.dart';
import 'package:vkreta/models/cartlistModel.dart';
import 'package:vkreta/view/product/productdisplay.dart';
import 'package:vkreta/services/apiservice.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  // get product_id => null;
  int simpleIntInput = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          title: Text(
            'Shopping Cart',
            style: GoogleFonts.poppins(
                textStyle:
                TextStyle(color: Colors.grey.shade900, fontSize: 16)),
          ),
        ),
        backgroundColor: Colors.white,
        body: FutureBuilder<CartlistModel>(
          future: ApiService().getCartItems(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.products.length,
                  itemBuilder: (context, index) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          for (int i = 0;
                          i < snapshot.data.products.length;
                          i++)
                            SizedBox(
                              height: 10,
                            ),
                          InkWell(
                            onTap: () {
                              Get.put(HomeController()).clearValueAll();
                              Navigator.of(context).push(PageRouteBuilder(
                                  transitionDuration: Duration(seconds: 1),
                                  transitionsBuilder: (BuildContext context,
                                      Animation<double> animation,
                                      Animation<double> secAnimation,
                                      Widget child) {
                                    animation = CurvedAnimation(
                                        parent: animation,
                                        curve: Curves.linear);
                                    return SharedAxisTransition(
                                        child: child,
                                        animation: animation,
                                        secondaryAnimation: secAnimation,
                                        transitionType: SharedAxisTransitionType
                                            .horizontal);
                                  },
                                  pageBuilder: (BuildContext context,
                                      Animation<double> animation,
                                      Animation<double> secAnimation) {
                                    return ProductDisplay(snapshot
                                        .data.products[index].productId);
                                  }));
                            },
                            child: Container(
                              height: 150,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: 150,
                                    width:
                                    MediaQuery.of(context).size.width / 3.5,
                                    child: Column(
                                      children: [
                                        Container(
                                            height: 120,
                                            color: Colors.white,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width /
                                                3,
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.all(8.0),
                                              child: Image.network(snapshot
                                                  .data.products[index].thumb),
                                            )),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 150,
                                    width:
                                    MediaQuery.of(context).size.width / 1.4,
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(
                                            snapshot.data.products[index].name,
                                            // overflow: TextOverflow.ellipsis,
                                            maxLines: 3,
                                            style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                    color: Colors.grey.shade900,
                                                    fontSize: 14)),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Row(
                                            children: [
                                              Text(
                                                snapshot
                                                    .data.products[index].price,
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontSize: 12)),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                    BorderRadiusDirectional
                                                        .circular(1),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors
                                                              .grey.shade300,
                                                          spreadRadius: 1)
                                                    ]),
                                                child: InkWell(
                                                  onTap: () async {
                                                    final delete =
                                                    await ApiService()
                                                        .removeCartItems(int
                                                        .parse(snapshot
                                                        .data
                                                        .products[
                                                    index]
                                                        .cartId));
                                                    String? error = '';
                                                    // print(signUp.firstname);
                                                    // signUp.then((value){
                                                    if (delete.error != null) {
                                                      error = delete.error;
                                                    }
                                                    if (error != '') {
                                                      ScaffoldMessenger.of(
                                                          context)
                                                          .showSnackBar(
                                                          SnackBar(
                                                            content: Text(error!),
                                                            backgroundColor:
                                                            Colors.red,
                                                          ));
                                                    }
                                                    if (delete.success !=
                                                        null) {
                                                      ScaffoldMessenger.of(
                                                          context)
                                                          .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                                'product delete successfully'),
                                                            backgroundColor:
                                                            Colors.green,
                                                          ));

                                                      setState(() {});
                                                    }
                                                  },
                                                  child: Center(
                                                    child: Icon(
                                                      Icons.delete,
                                                      color:
                                                      Colors.grey.shade700,
                                                      size: 23,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  // QuantityInput(
                                                  //   value: simpleIntInput,
                                                  //   onChanged: (value) async {
                                                  //     setState(() =>
                                                  //     simpleIntInput =
                                                  //         int.parse(value
                                                  //             .replaceAll(
                                                  //             '', '')));
                                                  //     final update = await ApiService()
                                                  //         .updateCartQuantity(
                                                  //         int.parse(snapshot
                                                  //             .data
                                                  //             .products[
                                                  //         index]
                                                  //             .cartId),
                                                  //         int.parse(snapshot
                                                  //             .data
                                                  //             .products[
                                                  //         index]
                                                  //             .quantity));
                                                  //     // print(delete);
                                                  //     String? error = '';
                                                  //     // print(signUp.firstname);
                                                  //     // signUp.then((value){
                                                  //     if (update.error !=
                                                  //         null) {
                                                  //       error = update.error;
                                                  //     }
                                                  //     if (error != '') {
                                                  //       ScaffoldMessenger.of(
                                                  //           context)
                                                  //           .showSnackBar(
                                                  //           SnackBar(
                                                  //             content: Text(error!),
                                                  //             backgroundColor:
                                                  //             Colors.red,
                                                  //           ));
                                                  //     }
                                                  //     if (update.success !=
                                                  //         null) {
                                                  //       ScaffoldMessenger.of(
                                                  //           context)
                                                  //           .showSnackBar(
                                                  //           SnackBar(
                                                  //             content: Text(
                                                  //                 'CART Updated Successfully'),
                                                  //             backgroundColor:
                                                  //             Colors.green,
                                                  //           ));
                                                  //       setState(() {});
                                                  //
                                                  //       //  this is ok now wo go to login screen
                                                  //       // Navigator.pushReplacement(context,
                                                  //       //     MaterialPageRoute(builder: (context) {
                                                  //       //       return const WishList();
                                                  //       //     }));
                                                  //     }
                                                  //   },
                                                  // ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  // Text(
                                                  //   snapshot.data.products[index].quantity,
                                                  //   style: GoogleFonts.poppins(
                                                  //       textStyle: TextStyle(
                                                  //           color: Colors.grey.shade700,
                                                  //           fontSize: 14)),
                                                  // ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 10,
                            width: MediaQuery.of(context).size.width,
                            decoration:
                            BoxDecoration(color: Colors.grey.shade100),
                          ),

                        ],
                      ),
                    );
                  });
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
