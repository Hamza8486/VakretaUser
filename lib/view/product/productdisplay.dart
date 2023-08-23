import 'package:animations/animations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_badged/flutter_badge.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vkreta/controllers/categoryController.dart';
import 'package:vkreta/getx_controllers/homepage.dart';
import 'package:vkreta/view/home/controller/home_controller.dart';
import 'package:vkreta/view/home/home.dart';
import 'package:vkreta/view/product/otherSellerProductsScreen.dart';
import 'package:vkreta/view/others/return_policy.dart';
import 'package:vkreta/services/apiservice.dart';
import 'package:vkreta/view/product/search_screen.dart';
import 'package:vkreta/view/product/showproduct.dart';
import 'package:vkreta/view/product/specification.dart';
import '../home/Enterpincode.dart';
import '../review/allreviews.dart';
import 'cart.dart';

import '../../models/bages_model.dart';
import '../../models/productdetailModel.dart';
String prices = "null";
String ? textName ;
String ? textPrice ;
class ProductDisplay extends StatefulWidget {
  final int productId;
  ProductDisplay(this.productId, {Key? key}) : super(key: key);

  @override
  State<ProductDisplay> createState() => _ProductDisplayState();
}



class _ProductDisplayState extends State<ProductDisplay> {
  bool dis = false;

  check(String price, String special) {
    int p = int.parse(price.replaceAll(RegExp(r'[^\w\s]+'), ''));
    int sp = int.parse(special.replaceAll(RegExp(r'[^\w\s]+'), ''));
    double d = ((p - sp) / p) * 100;
    if (d.toInt() > 0) {
      dis = true;
    } else {
      dis = false;
    }
  }

  Color _iconColor = Colors.black;
  Map<String, String> selectedVariants = {};


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: FutureBuilder<ProductDetailModel>(
          future: ApiService().getProductDetail(widget.productId),
          builder: (context, AsyncSnapshot<ProductDetailModel> snapshot) {
            print("snapshot ----------------------------->>$snapshot");
            print("snapshot.hasData --------------->>${snapshot.hasData}");

            if (snapshot.hasData) {
              check(snapshot.data!.price.toString()!,
                  snapshot.data!.special.toString()!);

              return Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: width * 0.02),
                          child: ProductDisplayAppBar(width: width),
                        ),
                        Divider(
                          height: 1,
                          color: Colors.grey.shade300,
                        ),
                        Stack(

                          children: [
                            Container(
                              height: width * 0.8,
                              width: MediaQuery.of(context).size.width,
                              decoration: const BoxDecoration(color: Colors.white),
                              child: Stack(children: [
                                CarouselSlider(
                                  options: CarouselOptions(height: width * 0.8),
                                  items: [
                                    for (int i = 0;
                                        i < snapshot.data!.images!.length;
                                        ++i)
                                      if (snapshot.data!.images![i].popup != null)
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width,
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                PageRouteBuilder(
                                                  transitionDuration:
                                                      const Duration(seconds: 1),
                                                  transitionsBuilder: (BuildContext
                                                          context,
                                                      Animation<double> animation,
                                                      Animation<double>
                                                          secAnimation,
                                                      Widget child) {
                                                    animation = CurvedAnimation(
                                                        parent: animation,
                                                        curve: Curves.linear);
                                                    return SharedAxisTransition(
                                                        child: child,
                                                        animation: animation,
                                                        secondaryAnimation:
                                                            secAnimation,
                                                        transitionType:
                                                            SharedAxisTransitionType
                                                                .horizontal);
                                                  },
                                                  pageBuilder: (BuildContext
                                                          context,
                                                      Animation<double> animation,
                                                      Animation<double>
                                                          secAnimation) {
                                                    return ShoeProduct(
                                                        int.parse(snapshot
                                                            .data!.productId!),
                                                        snapshot
                                                            .data!.headingTitle!,
                                                        snapshot.data!.images![i]
                                                            .popup!);
                                                  },
                                                ),
                                              );
                                            },
                                            child: Image(
                                              image: NetworkImage(
                                                snapshot.data!.images![i].popup!
                                                            .toString() !=
                                                        null
                                                    ? snapshot
                                                        .data!.images![i].popup!
                                                        .toString()
                                                    : "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pinterest.com%2Fpin%2F860046860085072906%2F&psig=AOvVaw1tJ8YtYW1aMnDsGyEg2eaK&ust=1678117120309000&source=images&cd=vfe&ved=0CA8QjRxqFwoTCKjtpciPxf0CFQAAAAAdAAAAABAI",
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        )
                                  ],
                                ),
                                // if (dis)
                                //   Padding(
                                //     padding: EdgeInsets.all(width * 0.03),
                                //     child: Row(children: [
                                //       Container(
                                //         height: width * 0.03,
                                //         width: width * 0.06,
                                //         decoration: const BoxDecoration(color: Colors.red, borderRadius: BorderRadius.only(bottomRight: Radius.circular(20))),
                                //         child: Center(
                                //           child: percentageCalc(snapshot.data!.price!, snapshot.data!.special.toString()!),
                                //         ),
                                //       ),
                                //     ]),
                                //   ),
                              ]),
                            ),
                            Positioned(
                            top: 10,
                              right: 30,
                              child: GestureDetector(
            onTap:(){
              Share.share(snapshot.data!.share.toString(), subject: 'Enjoy This Product!');
            },
                                child: Container(
                                  decoration:BoxDecoration(shape: BoxShape.circle,
                                      border: Border.all(color: Colors.black.withOpacity(0.5))
                                  ),
                                  child:Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.share,color: Colors.black,
                                      size: Get.height*0.024,
                                    ),
                                  )
                            ),
                              ))
                          ],
                        ),
                        SizedBox(height: width * 0.01),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.04),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  snapshot.data!.headingTitle!,
                                  maxLines: 4,
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black,
                                          fontSize: width * 0.03)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: width * 0.02,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              dis == true
                                  ? Row(children: [
                                      Text(
                                        'MRP -',
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                color: Colors.grey.shade700,
                                                fontSize: 14)),
                                      ),
                                      SizedBox(width: 5),
                                      Container(
                                        height: 30,
                                        // width: 50,
                                        color: Colors.white,
                                        child: Stack(children: [
                                          Center(
                                            child: Text(
                                              snapshot.data!.price!,
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          Colors.grey.shade700,
                                                      fontSize: 14)),
                                            ),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                  height: 1,
                                                  width: 50,
                                                  color: Colors.grey.shade400),
                                            ],
                                          )
                                        ]),
                                      ),
                                      SizedBox(width: 10),
                                      Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 1, vertical: 5),
                                          decoration: BoxDecoration(
                                              color: Colors.blue.shade900,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 10),
                                            child: Center(
                                              child: percentageCalc(
                                                  snapshot.data!.price!,
                                                  snapshot.data!.special
                                                      .toString()),
                                            ),
                                          )),
                                      SizedBox(width: 3),
                                      Text(
                                        'DISCOUNT',
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue.shade900,
                                                fontSize: 12)),
                                      ),
                                    ])
                                  : SizedBox.shrink(),
                              //like button
                              dis == true
                                  ? IconButton(
                                      onPressed: () async {
                                        if (_iconColor == Colors.black) {
                                          //
                                          final addtowishlist =
                                              await ApiService().addtowishlist(
                                                  int.parse(snapshot
                                                      .data!.productId!
                                                      .toString()));
                                          String? error = '';
                                          if (addtowishlist.error != null) {
                                            error = addtowishlist.error;
                                          }
                                          if (error != '') {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              content: Text(error!),
                                              backgroundColor: Colors.red,
                                            ));
                                          }
                                          if (addtowishlist.success != null) {
                                            Provider.of<BadgesModel>(context,
                                                    listen: false)
                                                .updateWishList(1);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              content: Text('Item to product,'),
                                              backgroundColor: Colors.green,
                                            ));

                                            setState(() {});
                                          }
                                          setState(() {
                                            _iconColor = Colors.red;
                                          });
                                        } else {
                                          final delete = await ApiService()
                                              .removewishlistproduct(int.parse(
                                                  snapshot.data!.productId!
                                                      .toString()));

                                          String? error = '';

                                          if (delete.error != null) {
                                            error = delete.error;
                                          }

                                          if (error != '') {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              content: Text(error!),
                                              backgroundColor: Colors.red,
                                            ));
                                          }
                                          if (delete.success != null) {
                                            Provider.of<BadgesModel>(context,
                                                    listen: false)
                                                .updateWishList(-1);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              content: Text(
                                                  'Product remove wishlist'),
                                              backgroundColor: Colors.green,
                                            ));

                                            setState(() {});
                                          }

                                          setState(() {
                                            _iconColor = Colors.black;
                                          });
                                        }
                                      },
                                      icon: Icon((Icons.favorite),
                                          color: _iconColor, size: 25))
                                  : SizedBox.shrink(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                              textPrice==null?
                                (snapshot.data!.special == 0
                                    ? ""
                                    : snapshot.data!.special.toString()):textPrice.toString(),
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                        fontSize: 20)),
                              ),
                              dis == false
                                  ? IconButton(
                                      onPressed: () async {
                                        if (_iconColor == Colors.black) {
                                          //
                                          final addtowishlist =
                                              await ApiService().addtowishlist(
                                                  int.parse(snapshot
                                                      .data!.productId!
                                                      .toString()));
                                          String? error = '';
                                          if (addtowishlist.error != null) {
                                            error = addtowishlist.error;
                                          }
                                          if (error != '') {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              content: Text(error!),
                                              backgroundColor: Colors.red,
                                            ));
                                          }
                                          if (addtowishlist.success != null) {
                                            Provider.of<BadgesModel>(context,
                                                    listen: false)
                                                .updateWishList(1);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              content: Text('Item to product,'),
                                              backgroundColor: Colors.green,
                                            ));

                                            setState(() {});
                                          }
                                          setState(() {
                                            _iconColor = Colors.red;
                                          });
                                        } else {
                                          final delete = await ApiService()
                                              .removewishlistproduct(int.parse(
                                                  snapshot.data!.productId!
                                                      .toString()));

                                          String? error = '';

                                          if (delete.error != null) {
                                            error = delete.error;
                                          }

                                          if (error != '') {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              content: Text(error!),
                                              backgroundColor: Colors.red,
                                            ));
                                          }
                                          if (delete.success != null) {
                                            Provider.of<BadgesModel>(context,
                                                    listen: false)
                                                .updateWishList(-1);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              content: Text(
                                                  'Product remove wishlist'),
                                              backgroundColor: Colors.green,
                                            ));

                                            setState(() {});
                                          }

                                          setState(() {
                                            _iconColor = Colors.black;
                                          });
                                        }
                                      },
                                      icon: Icon((Icons.favorite),
                                          color: _iconColor, size: 25))
                                  : SizedBox.shrink(),
                            ],
                          ),
                        ),
                        snapshot.data!.special == 0
                            ? SizedBox.shrink()
                            : snapshot.data!.options!.isNotEmpty &&
                                    snapshot.data!.options!.length > 0
                                ? SizedBox(
                                    height: width * 0.03,
                                  )
                                : SizedBox.shrink(),

                        if (snapshot.data!.options!.isNotEmpty &&
                            snapshot.data!.options!.length > 0)
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.04),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Variation',
                                      maxLines: 1,
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: Colors.grey.shade900,
                                            fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Text(
                                      snapshot.data!.options![0].name
                                          .toString(),
                                      maxLines: 1,
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: Colors.grey.shade900,
                                            fontSize: width * 0.03),
                                      ),
                                    ),
                                  ],
                                ),
                                //pictures
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      for (int i = 0;
                                          i <
                                              snapshot.data!.options![0]
                                                  .productOptionValue!.length;
                                          i++)
                                        Padding(
                                          padding: EdgeInsets.all(width * 0.02),
                                          child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            onTap: () {
                                              print("Hamzaaaaaa");
                                              Get.put(HomeController()).updateKeyId(snapshot.data!.options![0].productOptionId.toString());
                                              Get.put(HomeController()).updateMainId(snapshot.data!.options![0]
                                                  .productOptionValue![
                                              i]
                                                  .productOptionValueId);
                                              print("object");
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return ProductDisplay(
                                                  int.parse(snapshot
                                                      .data!
                                                      .options![0]
                                                      .productOptionValue![i]
                                                      .productId
                                                      .toString()),
                                                );
                                              }));
                                            },
                                            child: Column(
                                              children: [
                                                snapshot
                                                            .data!
                                                            .options![0]
                                                            .productOptionValue![
                                                                i]
                                                            .image
                                                            .toString() ==
                                                        "false"
                                                    ? Container()
                                                    : Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical:
                                                                    width *
                                                                        0.01,
                                                                horizontal:
                                                                    width *
                                                                        0.01),
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: snapshot
                                                                            .data!
                                                                            .options![
                                                                                0]
                                                                            .productOptionValue![
                                                                                i]
                                                                            .active ==
                                                                        1
                                                                    ? Colors
                                                                        .blue
                                                                        .shade900
                                                                    : Colors
                                                                        .grey
                                                                        .withOpacity(
                                                                            0.5)),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50)),
                                                        child: CircleAvatar(
                                                          radius: 35,
                                                          backgroundColor:
                                                              Colors.white,
                                                          backgroundImage:
                                                              NetworkImage(snapshot
                                                                  .data!
                                                                  .options![0]
                                                                  .productOptionValue![
                                                                      i]
                                                                  .image
                                                                  .toString()),
                                                        ),
                                                      ),
                                                SizedBox(height: Get.height*0.01,),
                                                Container(
                                                    padding: EdgeInsets.symmetric(
                                                        vertical: width * 0.02,
                                                        horizontal:
                                                            width * 0.02),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: snapshot.data!.options![0].productOptionValue![i].active == 1
                                                                ? Colors.blue
                                                                    .shade900
                                                                : Colors.grey
                                                                    .withOpacity(
                                                                        0.5)),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                7)),
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(4.0),
                                                      child: Column(
                                                        children: [
                                                          Text(snapshot
                                                              .data!
                                                              .options![0]
                                                              .productOptionValue![i]
                                                              .name
                                                              .toString(),style: TextStyle(fontSize: Get.height*0.016),),
                                                          SizedBox(height: Get.height*0.005,),
                                                          Text(snapshot
                                                              .data!
                                                              .options![0]
                                                              .productOptionValue![i]
                                                              .price
                                                              .toString(),
                                                            style: TextStyle(fontSize: Get.height*0.016),

                                                          ),
                                                        ],
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                //Sizees
                                //talha
                                for (int option = 1;
                                    option < snapshot.data!.options!.length;
                                    ++option)
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: width * 0.04),
                                          child: Row(
                                            children: [
                                              Text(
                                                snapshot.data!.options![option]
                                                    .name!,
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14)),
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
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Row(
                                            children: [
                                              for (int optionValues = 0;
                                                  optionValues <
                                                      snapshot
                                                          .data!
                                                          .options![option]
                                                          .productOptionValue!
                                                          .length;
                                                  ++optionValues)
                                                InkWell(
                                                  onTap: () {
                                                    print("Hamzaaaaaa Ali");
                                                   setState(() {
                                                     textPrice =snapshot
                                                         .data!
                                                         .options![option]
                                                         .productOptionValue![
                                                     optionValues]
                                                         .price.toString();
                                                   });
                                                    Get.put(HomeController()).updateKeyId1(snapshot
                                                        .data!
                                                        .options![option].productOptionId.toString());
                                                    Get.put(HomeController()).updateMainId1(snapshot
                                                        .data!
                                                        .options![option]
                                                        .productOptionValue![
                                                    optionValues]
                                                        .productOptionValueId);
                                                    print(selectedVariants);
                                                    String product_option_id =
                                                        snapshot
                                                            .data!
                                                            .options![option]
                                                            .productOptionId!;
                                                    String
                                                        product_option_value_id =
                                                        snapshot
                                                            .data!
                                                            .options![option]
                                                            .productOptionValue![
                                                                optionValues]
                                                            .productOptionValueId!;
                                                    if (selectedVariants
                                                        .containsKey(
                                                            product_option_id)) {
                                                      selectedVariants[
                                                              product_option_id] =
                                                          product_option_value_id;
                                                    } else {
                                                      selectedVariants.addAll({
                                                        product_option_id:
                                                            product_option_value_id
                                                      });
                                                    }
                                                    prices = snapshot
                                                        .data!
                                                        .options![option]
                                                        .productOptionValue![
                                                            optionValues]
                                                        .price!;
                                                    setState(() {});
                                                  },
                                                  child: Container(
                                                    // height: 35,
                                                    // width: 35,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical:
                                                                width * 0.02,
                                                            horizontal:
                                                                width * 0.04),
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 5),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: selectedVariants
                                                                .containsKey(snapshot
                                                                    .data!
                                                                    .options![
                                                                        option]
                                                                    .productOptionId)
                                                            ? selectedVariants[snapshot
                                                                        .data!
                                                                        .options![
                                                                            option]
                                                                        .productOptionId] ==
                                                                    snapshot
                                                                        .data!
                                                                        .options![
                                                                            option]
                                                                        .productOptionValue![
                                                                            optionValues]
                                                                        .productOptionValueId
                                                                ? Colors.blue
                                                                    .shade900
                                                                : Colors.grey
                                                                    .withOpacity(
                                                                        0.5)
                                                            : Colors.grey
                                                                .withOpacity(
                                                                    0.5),
                                                      ),
                                                      borderRadius:
                                                          BorderRadiusDirectional
                                                              .circular(7),
                                                    ),
                                                    child: Center(
                                                      child: Column(
                                                        children: [
                                                          Center(
                                                            child: Text(
                                                              snapshot
                                                                  .data!
                                                                  .options![option]
                                                                  .productOptionValue![
                                                                      optionValues]
                                                                  .name!,
                                                              style: GoogleFonts.poppins(
                                                                  textStyle:
                                                                      const TextStyle(
                                                                          fontWeight:
                                                                              FontWeight
                                                                                  .bold,
                                                                          fontSize:
                                                                              15)),
                                                            ),
                                                          ),
                                                          SizedBox(height: 5,),
                                                          Center(
                                                            child: Text(
                                                              snapshot
                                                                  .data!
                                                                  .options![option]
                                                                  .productOptionValue![
                                                              optionValues]
                                                                  .price.toString(),
                                                              style: GoogleFonts.poppins(
                                                                  textStyle:
                                                                  const TextStyle(
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                      fontSize:
                                                                      15)),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                      ],
                                    ),
                                  ),
                                // if ( snapshot.data!.options!.length == 2)
                                //   Column(
                                //     children: [
                                //       Row(
                                //         children: [
                                //           Text(
                                //             snapshot.data!.options![1].name.toString(),
                                //             maxLines: 1,
                                //             style: GoogleFonts.poppins(
                                //               textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 14),
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //       //size list
                                //       Row(
                                //         children: [
                                //           for (int i = 0; i < snapshot.data!.options![1].productOptionValue!.length; i++)
                                //             Padding(
                                //               padding: EdgeInsets.all(width * 0.03),
                                //               child: InkWell(
                                //                 borderRadius: BorderRadius.circular(35),
                                //                 onTap: () {
                                //                   Navigator.push(context,
                                //                       MaterialPageRoute(
                                //                           builder: (context) {
                                //                     return ProductDisplay(
                                //                       int.parse(snapshot
                                //                           .data!
                                //                           .options![0]
                                //                           .productOptionValue![i]
                                //                           .productId!),
                                //                     );
                                //                   }));
                                //                 },
                                //                 child: Container(
                                //                   decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(12)),
                                //                   child: Padding(
                                //                     padding: EdgeInsets.all(width * 0.02),
                                //                     child: Text(snapshot.data!.options![1].productOptionValue![i].name.toString()),
                                //                   ),
                                //                 ),
                                //               ),
                                //             ),
                                //         ],
                                //       ),
                                //     ],
                                //   ),
                              ],
                            ),
                          ),

                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.04),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: width * 0.05,
                              ),
                              Text(
                                snapshot.data!.rating.toString(),
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.grey.shade900,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)),
                              ),
                              SizedBox(
                                width: width * 0.02,
                              ),
                              Text(
                                snapshot.data!.tabReview!.toString(),
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 13)),
                              ),

                            ],
                          ),
                        ),
                        SizedBox(
                          height: width * 0.02,
                        ),


                        Container(
                          height: width * 0.02,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.grey.shade100,
                        ),
                        Container(
                          height: width * 0.02,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.grey.shade100,
                        ),
                        SizedBox(
                          height: width * 0.02,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.04),
                          child: Column(
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Enter your pin code to check availability',
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey.shade900,
                                                fontSize: 11)),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Get.to(EnterPinCode(
                                            id: widget.productId,
                                          ));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: width * 0.02,
                                              horizontal: width * 0.02),
                                          decoration: BoxDecoration(
                                              color: Colors.blue.shade900,
                                              borderRadius: BorderRadius.circular(7)),
                                          child: Center(
                                            child: Text(
                                              'Enter Pin Code',
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white,
                                                      fontSize: 12)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),
                                SizedBox(height: Get.height * 0.01),
                                Obx(
                                  () {
                                    return
                                     Get.put(CategoryController()).text.value.isNotEmpty?

                                      Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            Get.put(CategoryController()).text.value,
                                            style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                    color: Colors.green,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12)),
                                          ),
                                        ),
                                        Text(
                                          "(${Get.put(CategoryController()).updateCode.value})",
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12)),
                                        ),
                                      ],
                                    ):SizedBox.shrink();
                                  }
                                ),
                              ],
                          ),
                        ),
                        SizedBox(height: width * 0.02),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.04),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: []),
                        ),
                        SizedBox(
                          height: width * 0.02,
                        ),
                        Container(
                          height: width * 0.02,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.grey.shade100,
                        ),
                        SizedBox(
                          height: width * 0.02,
                        ),
                        Container(
                          height: width * 0.2,
                          alignment: Alignment.centerLeft,
                          child: ListView.builder(
                            itemCount: snapshot.data!.specialSection!.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.02),
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                if (snapshot.data!.specialSection![index]
                                        .description !=
                                    null) {
                                  Navigator.of(context).push(
                                    PageRouteBuilder(
                                      transitionDuration:
                                          const Duration(seconds: 1),
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
                                            transitionType:
                                                SharedAxisTransitionType
                                                    .horizontal);
                                      },
                                      pageBuilder: (BuildContext context,
                                          Animation<double> animation,
                                          Animation<double> secAnimation) {
                                        return ReturnPolicy(
                                            snapshot.data!
                                                .specialSection![index].title!,
                                            snapshot
                                                .data!
                                                .specialSection![index]
                                                .description!);
                                      },
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                height: width * 0.03,
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.04),
                                color: Colors.white,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: width * 0.12,
                                      width: width * 0.15,
                                      child: Image.network(
                                        snapshot.data!.specialSection![index]
                                            .image!,
                                        // color:Colors.blue,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    const SizedBox(height: 1),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          snapshot.data!.specialSection![index]
                                              .title!,
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              // fontWeight: FontWeight.bold,
                                              color: Colors.grey.shade700,
                                              fontSize: width * 0.03,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: width * 0.02,
                        ),
                        Container(
                          height: 10,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.grey.shade100,
                        ),

                        SizedBox(
                          height: width * 0.02,
                        ),

                        //section variants
                        // if (snapshot.data!.options!.length > 0)
                        //   Column(
                        //     children: [
                        //       Padding(
                        //         padding: const EdgeInsets.symmetric(horizontal: 10),
                        //         child: Row(
                        //           children: [
                        //             Text(
                        //               'Variants',
                        //               style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900, fontWeight: FontWeight.bold, fontSize: 16)),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //       SizedBox(
                        //         height: 15,
                        //       ),
                        //
                        //     ],
                        //   ),

                        Container(
                          height: width * 0.02,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.grey.shade100,
                        ),
                        SizedBox(
                          height: width * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.04),
                              child: Row(children: [
                                Text(
                                  'SELLER NAME :',
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Colors.grey.shade800,
                                          fontSize: 13)),
                                ),
                                SizedBox(width: width * 0.02),
                                Text(
                                  snapshot.data!.sellerDetail!.sellerName ??
                                      "no Name",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue.shade900,
                                          fontSize: 13)),
                                ),
                              ]),
                            ),
                            SizedBox.shrink()
                          ],
                        ),
                        SizedBox(
                          height: width * 0.02,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.04),
                          child: Row(

            children: [
                            Text(
                              'SELLER RATING:',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.grey.shade800,
                                      fontSize: 13)),
                            ),
                            SizedBox(width: width * 0.02),
                            Text(
                              snapshot.data!.sellerDetail!.sellerRating ??
                                  "no ratig",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue.shade900,
                                      fontSize: 13)),
                            ),
                          ]),
                        ),
                        snapshot
                            .data!.sellerDetail!.otherSellerCount == "0"?SizedBox.shrink():
                        SizedBox(
                          height: width * 0.02,
                        ),

                        snapshot
                            .data!.sellerDetail!.otherSellerCount == "0"?SizedBox.shrink():
                        GestureDetector(
            onTap:(){
              Get.put(HomeController()).sellerData(
                  id: widget.productId);
              Get.to(OtherSellerProductScreen(
                  productId: "442", pinCode: ""));
            },
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.04),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(

                                    children: [
                                      Text(
                                        'SELLER COUNT:',
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                color: Colors.grey.shade800,
                                                fontSize: 13)),
                                      ),
                                      SizedBox(width: width * 0.02),


                                      SizedBox(
                                        width:Get.width*0.6,
                                        child: Text(
                                          "${snapshot
                                              .data!.sellerDetail!.otherSellerCount
                                              .toString()} more seller selling this view all > ",
                                          maxLines: 2,

                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.bold,

                                                  color: Colors.red,
                                                  fontSize: 13)),
                                        ),
                                      ),
                                    ],
                                  ),

                                ]),
                          ),
                        ),
                        SizedBox(
                          height: width * 0.02,
                        ),

                        Container(
                          height: width * 0.02,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.grey.shade100,
                        ),
                        SizedBox(
                          height: width * 0.02,
                        ),

                        GestureDetector(
                          onTap: () {
                            Get.to(SpecificationView(
                              data: snapshot.data,
                            ));
                          },
                          child: Container(
                            height: width * 0.12,
                            width: MediaQuery.of(context).size.width * 0.9,
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.04),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey.shade100,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Order Specification',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Colors.grey.shade900,
                                      fontWeight: FontWeight.bold,
                                      fontSize: width * 0.04,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.black,
                                  size: width * 0.06,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: width * 0.02,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(ReturnPolicy(
                                'Description', snapshot.data!.description!));
                          },
                          child: Container(
                            height: width * 0.12,
                            width: MediaQuery.of(context).size.width * 0.9,
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.04),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey.shade100,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Description',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Colors.grey.shade900,
                                      fontWeight: FontWeight.bold,
                                      fontSize: width * 0.04,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.black,
                                  size: width * 0.06,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: width * 0.02,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.put(HomeController()).reviewData(
                                id: snapshot.data!.productId.toString());
                            print(widget.productId.toString());
                            Get.to(AllReviews());
                          },
                          child: Container(
                            height: width * 0.12,
                            width: MediaQuery.of(context).size.width * 0.9,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey.shade100,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Reviews',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Colors.grey.shade900,
                                      fontWeight: FontWeight.bold,
                                      fontSize: width * 0.04,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.black,
                                  size: width * 0.06,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: width * 0.02,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                transitionDuration: const Duration(seconds: 1),
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
                                  return ReturnPolicy(
                                      'Disclaimer', snapshot.data!.disclaimer!);
                                },
                              ),
                            );
                          },
                          child: Container(
                            height: width * 0.12,
                            width: MediaQuery.of(context).size.width * 0.9,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey.shade100,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Disclaimer',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Colors.grey.shade900,
                                      fontWeight: FontWeight.bold,
                                      fontSize: width * 0.04,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.black,
                                  size: width * 0.06,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: width * 0.02,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                transitionDuration: const Duration(seconds: 1),
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
                                  return ReturnPolicy('Return Policy',
                                      snapshot.data!.returnPolicy!);
                                },
                              ),
                            );
                          },
                          child: Container(
                            height: width * 0.12,
                            width: MediaQuery.of(context).size.width * 0.9,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey.shade100,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Return Policy',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Colors.grey.shade900,
                                      fontWeight: FontWeight.bold,
                                      fontSize: width * 0.04,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.black,
                                  size: width * 0.06,
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(
                          height: Get.height * 0.03,
                        ),

                        SizedBox(
                          height: 10,
                        ),
                        Obx(
                          () {
                            return
                             Get.put(HomeController()).valueText.isEmpty?

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 24),
                                    child: Text(
                                        snapshot.data?.productsBottomTab?[0].title ??
                                            "",
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            color: Colors.grey.shade900,
                                            fontWeight: FontWeight.w700,
                                            fontSize: width * 0.04,
                                          ),
                                        )),
                                  ),
                                ),
                                snapshot.data!.productsBottomTab![0].products!.isEmpty
                                    ? Center(
                                      child: Text(
                                  "No Data",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: Get.width * 0.03)),
                                ),
                                    )
                                    :
                                SizedBox(
                                  height: Get.width * 0.6,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: snapshot
                                          .data!.productsBottomTab?[0].products?.length,
                                      itemBuilder: (BuildContext context, int index1) {
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: Get.width * 0.01,
                                              horizontal: 10),
                                          child: Container(
                                            height: Get.width * 0.6,
                                            color: Colors.white,
                                            width:
                                            MediaQuery.of(context).size.width * 0.4,
                                            child: InkWell(
                                              onTap: () {
                                                Get.put(HomeController()).clearValueAll();
                                                Get.put(HomeController()).updateValueText("ncsan");
                                                Get.put(CategoryController()).updateText("");
                                                Get.put(CategoryController()).updateCode("");
                                                Get.to(ProductDisplay(int.parse(
                                                    snapshot
                                                        .data!.productsBottomTab?[0].products?[index1].productId??"")));

                                              },
                                              child: Container(
                                                height: Get.width * 0.55,
                                                width: Get.width * 0.4,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color:
                                                      Colors.grey.withOpacity(0.5)),
                                                  borderRadius:
                                                  BorderRadius.circular(7),
                                                  // boxShadow: const [
                                                  //   BoxShadow(
                                                  //       color: Colors.grey,
                                                  //       spreadRadius: 1,
                                                  //       blurRadius: 2,
                                                  //       offset: Offset(-2, 5))
                                                  // ]
                                                ),
                                                child: Stack(children: [
                                                  Column(
                                                    children: [
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Container(
                                                        height: Get.width * 0.36,
                                                        width: Get.width * 0.4,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                20)),
                                                        child: Padding(
                                                          padding: EdgeInsets.all(
                                                              Get.width * 0.02),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                7),
                                                            child: Image.network(
                                                              snapshot
                                                                  .data!
                                                                  .productsBottomTab?[
                                                              0]
                                                                  .products![index1]
                                                                  .thumb ??
                                                                  "",
                                                              fit: BoxFit.fill,
                                                              errorBuilder: (context,
                                                                  object, straeTree) {
                                                                return Icon(
                                                                  Icons.image,
                                                                  color: Colors.grey,
                                                                  size:
                                                                  Get.width * 0.06,
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.symmetric(
                                                            horizontal:
                                                            Get.width * 0.02),
                                                        child: Text(
                                                          snapshot
                                                              .data!
                                                              .productsBottomTab?[0]
                                                              .products![index1]
                                                              .name ??
                                                              "",
                                                          maxLines: 2,
                                                          overflow:
                                                          TextOverflow.ellipsis,
                                                          style: GoogleFonts.poppins(
                                                              textStyle: TextStyle(
                                                                  color: Colors
                                                                      .grey.shade900,
                                                                  fontSize: Get.width *
                                                                      0.03)),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: Get.width * 0.01,
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.symmetric(
                                                            horizontal:
                                                            Get.width * 0.02),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              snapshot
                                                                  .data!
                                                                  .productsBottomTab?[
                                                              0]
                                                                  .products![index1]
                                                                  .price
                                                                  .toString() ??
                                                                  "",
                                                              style: GoogleFonts.poppins(
                                                                  textStyle: TextStyle(
                                                                      color:
                                                                      Colors.black,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                      fontSize:
                                                                      Get.width *
                                                                          0.04)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: Get.width * 0.01,
                                                      ),
                                                    ],
                                                  ),
                                                ]),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 24),
                                    child: Text(
                                        snapshot.data?.productsBottomTab?[1].title ??
                                            "",
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            color: Colors.grey.shade900,
                                            fontWeight: FontWeight.w700,
                                            fontSize: width * 0.04,
                                          ),
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),

                                snapshot.data!.productsBottomTab![1].products!.isEmpty
                                    ? Center(
                                      child: Text(
                                  "No Data",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: Get.width * 0.03)),
                                ),
                                    )
                                    : SizedBox(
                                  height: Get.width * 0.6,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      primary: false,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: snapshot.data!
                                          .productsBottomTab?[1].products?.length,
                                      itemBuilder:
                                          (BuildContext context, int index2) {
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: Get.width * 0.01,
                                              horizontal: 10),
                                          child: Container(
                                            height: Get.width * 0.6,
                                            color: Colors.white,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width *
                                                0.4,
                                            child: InkWell(
                                              onTap: () {
                                                Get.put(HomeController()).clearValueAll();
                                                Get.put(HomeController()).updateValueText("ncsan");
                                                Get.put(CategoryController()).updateText("");
                                                Get.put(CategoryController()).updateCode("");
                                                Get.to(
                                                    Get.to(ProductDisplay(int.parse(
                                                        snapshot
                                                            .data!.productsBottomTab?[1].products?[index2].productId??""))));


                                              },
                                              child: Container(
                                                height: Get.width * 0.55,
                                                width: Get.width * 0.4,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color: Colors.grey
                                                          .withOpacity(0.5)),
                                                  borderRadius:
                                                  BorderRadius.circular(7),
                                                  // boxShadow: const [
                                                  //   BoxShadow(
                                                  //       color: Colors.grey,
                                                  //       spreadRadius: 1,
                                                  //       blurRadius: 2,
                                                  //       offset: Offset(-2, 5))
                                                  // ]
                                                ),
                                                child: Stack(children: [
                                                  Column(
                                                    children: [
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Container(
                                                        height: Get.width * 0.36,
                                                        width: Get.width * 0.4,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                20)),
                                                        child: Padding(
                                                          padding: EdgeInsets.all(
                                                              Get.width * 0.02),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(7),
                                                            child: Image.network(
                                                              snapshot
                                                                  .data!
                                                                  .productsBottomTab?[
                                                              1]
                                                                  .products![
                                                              index2]
                                                                  .thumb ??
                                                                  "",
                                                              fit: BoxFit.fill,
                                                              errorBuilder:
                                                                  (context,
                                                                  object,
                                                                  straeTree) {
                                                                return Icon(
                                                                  Icons.image,
                                                                  color:
                                                                  Colors.grey,
                                                                  size:
                                                                  Get.width *
                                                                      0.06,
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                            Get.width *
                                                                0.02),
                                                        child: Text(
                                                          snapshot
                                                              .data!
                                                              .productsBottomTab?[
                                                          1]
                                                              .products![
                                                          index2]
                                                              .name ??
                                                              "",
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: GoogleFonts.poppins(
                                                              textStyle: TextStyle(
                                                                  color: Colors
                                                                      .grey
                                                                      .shade900,
                                                                  fontSize:
                                                                  Get.width *
                                                                      0.03)),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: Get.width * 0.01,
                                                      ),
                                                      Padding(
                                                        padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                            Get.width *
                                                                0.02),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              snapshot
                                                                  .data!
                                                                  .productsBottomTab?[
                                                              1]
                                                                  .products![
                                                              index2]
                                                                  .price
                                                                  .toString() ??
                                                                  "",
                                                              style: GoogleFonts.poppins(
                                                                  textStyle: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                      fontSize: Get
                                                                          .width *
                                                                          0.04)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: Get.width * 0.01,
                                                      ),
                                                    ],
                                                  ),
                                                ]),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),

                              ],
                            ):SizedBox.shrink();
                          }
                        ),
                        SizedBox(
                          height: Get.height * 0.1,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: width * 0.2,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade200, spreadRadius: 1)
                            ]),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.04),
                          child: Row(
                            children: [



                              InkWell(
                                onTap: () {
                                  Get.put(HomePage()).addressData();
                                  Get.to(Cart(data: "true",));

                                  // Navigator.of(context).push(PageRouteBuilder(
                                  //     transitionDuration:const Duration(seconds: 1),
                                  //     transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {
                                  //       animation = CurvedAnimation(parent: animation, curve: Curves.linear);
                                  //       return SharedAxisTransition(child: child, animation: animation, secondaryAnimation: secAnimation, transitionType: SharedAxisTransitionType.horizontal);
                                  //     },
                                  //     pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
                                  //       return const HelpSupport();
                                  //     }));
                                },
                                child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      color: Colors.blue.shade900,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Obx(
                                        () {
                                          return Text(
                                            Get.put(HomePage()).cartList.length.toString(),
                                            style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                    Get.put(HomePage()).cartList.isNotEmpty?14:
                                                    14)),
                                          );
                                        }
                                      ),
                                    )),
                              ),
                              const SizedBox(width: 10),
                              Obx(
                                () {
                                  return InkWell(
                                    onTap: () async {
                                      Get.put(HomePage()).addressData();
                                      Get.put(HomePage()).cartData();
                                      print(Get.put(HomeController()).key.value);
                                      print(Get.put(HomeController()).key.value);

                                      final addcart = await ApiService().AddToCart(key:
                                      Get.put(HomeController()).key.value.isEmpty?
                                      snapshot.data!.options!.isEmpty?"":
                                      snapshot.data!.options![0].productOptionId:Get.put(HomeController()).key.value,

                                          key1:
                                          Get.put(HomeController()).key1.value.isEmpty?"":
                                          Get.put(HomeController()).key1.value,
                                      product_id: int.parse(
                                          snapshot.data!.productId!.toString()),
                                        quantity: 1,
                                        id:
                                        Get.put(HomeController()).mainId.value.isEmpty?
                                        (
                                            snapshot.data!.options!.isEmpty?"":
                                            snapshot.data!.options![0].productOptionValue?[0].productOptionValueId):Get.put(HomeController()).mainId.value,
                                          id1:
                                          Get.put(HomeController()).mainId1.value.isEmpty?"": Get.put(HomeController()).mainId1.value
                                      );
                                      String? error = '';
                                      // print(signUp.firstname);
                                      // signUp.then((value){
                                      if (addcart.error != null) {
                                        error = addcart.error;
                                      }
                                      if (error != '') {
                                        // print('1');
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(error!),
                                          backgroundColor: Colors.red,
                                        ));
                                        // print('2');
                                      }

                                      if (addcart.success != null) {
                                        // print('3');
                                        Provider.of<BadgesModel>(context,
                                                listen: false)
                                            .updatecart(1);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text('Item added to cart'),
                                          backgroundColor: Colors.green,
                                        ));
                                        // print('4');

                                      }
                                    },
                                    child: Container(
                                      height: 35,
                                      width:
                                          MediaQuery.of(context).size.width / 1.3,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(1),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.blue.shade900,
                                                spreadRadius:
                                                Get.put(HomeController()).key.value.isEmpty?1:
                                                1)
                                          ]),

                                      //title
                                      child: Center(
                                        child: Text(
                                          'Add to cart',
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  color: Colors.blue.shade900,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14)),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString() + "error");
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  Widget percentageCalc(String price, String speical) {
    int disc;
    int p = int.parse(price.replaceAll(new RegExp(r'[^\w\s]+'), ''));
    int sp = int.parse(speical.replaceAll(new RegExp(r'[^\w\s]+'), ''));
    print("sp ------------>> $sp");
    // print("sp ------------>> $p");

    double d = ((p - sp) / p) * 100;
    disc = d.toInt();
    return Text(
      disc.toString() + "%",
      style: TextStyle(
        color: Colors.white,
      ),
    );
  }
}

class ProductDisplayAppBar extends StatelessWidget {
  const ProductDisplayAppBar({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: width * 0.15,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          Obx(
            () {
              return
                Get.put(HomeController()).valueText.isEmpty?

                IconButton(
                  onPressed: () {
                    Get.put(HomeController()).updateValueText("");
                    Navigator.of(context).pop();
                    Get.put(CategoryController()).updateText("");
                    Get.put(CategoryController()).updateCode("");
                  },
                  icon:

                  Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: width * 0.04,
                  )

              ):IconButton(
                    onPressed: () {
                      Get.put(HomeController()).updateValueText("");
                      Navigator.of(context).pop();
                      Get.put(CategoryController()).updateText("");
                      Get.put(CategoryController()).updateCode("");
                    },
                    icon:
                    Icon(
                      Icons.arrow_back_ios_outlined,
                      color: Colors.black,
                      size: width * 0.04,
                    )

                );
            }
          ),
          Expanded(
            child: TextFormField(

              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade600,
                    size: width * 0.04,
                  ),
                  isDense: true,
                  filled: true,

                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  hintText: 'Search Product',
                  hintStyle: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.grey.shade600, fontSize: 14))),
              readOnly: true,
              showCursor: false,
              onTap: (){
                Get.to(SearchScreen());
              },
            ),
          ),
          IconButton(
            onPressed: () {
              Get.to(Cart(data: "true",));
              Get.put(HomePage()).addressData();
            },
            icon: Obx(
              () {
                return

                
                  FlutterBadge(
                  itemCount: Get.put(HomePage()).cartList.length,
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.grey.shade700,
                    size:
                    Get.put(HomePage()).cartList.isNotEmpty?width * 0.05:
                    width * 0.05,
                  ),
                  textSize: width * 0.04,
                  badgeColor: Colors.blue.shade400,
                  borderRadius: width * 0.03,
                );
              }
            ),
          ),

        ],
      ),
    );
  }
}
