import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vkreta/controllers/categoryController.dart';
import 'package:vkreta/custom_widgets/widgets.dart';
import 'package:vkreta/getx_controllers/homepage.dart';
import 'package:vkreta/models/homemodel.dart';
import 'package:vkreta/view/home/controller/home_controller.dart';
import 'package:vkreta/view/product/productdisplay.dart';
import 'package:vkreta/view/product/search_screen.dart';
import 'package:vkreta/services/apiservice.dart';

import '../../getx_controllers/productInfo.dart';
import '../home/home.dart';

class OtherSellerProductScreen extends StatefulWidget {
  String productId;
  String pinCode;
  OtherSellerProductScreen({
    required this.productId,
    required this.pinCode,
  });

  @override
  State<OtherSellerProductScreen> createState() => _OtherSellerProductScreenState();
}

class _OtherSellerProductScreenState extends State<OtherSellerProductScreen> {
  final viewAll=Get.put(SameProduct());
  Future<List<ViewAllModel>> getAllProducts(String page,String title)async{
    setLoading(true);
    List<ViewAllModel> viewAllModel=await ApiService().otherSellerSameProduct(productId: widget.productId, picCode: widget.pinCode).then((value){
      if(value.isNotEmpty){
      viewAll.product.value=value;
      }
      setLoading(false);
      return value;
    });
    return viewAllModel;
  }
  setLoading(bool value){
    setState(() {
      isLoading=value;
    });
  }
  bool isLoading=false;
  final  ScrollController _controller=ScrollController();

  setOrder(String value) {
    setState(() {
      sortingOrder = value;
    });
  }
  int page=1;
  String sortingOrder = "none";
  pageListener(){
    if(_controller.position.pixels==_controller.position.maxScrollExtent){
      setState(() {
        page=page+1;
      });
      getAllProducts(page.toString(), widget.productId);
    }else{
      print("error");
    }
  }

  @override
  void initState() {
    getAllProducts(widget.productId, widget.pinCode);
    _controller.addListener(pageListener);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    List<ViewAllModel> snapshot= viewAll.product;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: width * 0.2,
          elevation: 0,
          // actions: [
          //   Column(
          //     children: [
          //       Padding(
          //         padding: EdgeInsets.only(
          //           right: width * 0.02,
          //         ),
          //         child: PopupMenuButton(
          //           icon: Icon(
          //             Icons.format_line_spacing,
          //             color: Colors.black,
          //             size: width * 0.06,
          //           ),
          //           itemBuilder: (context) => [
          //             PopupMenuItem(
          //               onTap:()=> setOrder("prices"),
          //               child:Row(
          //                 children: [
          //                   Text(
          //                     'High Price',
          //                     style: GoogleFonts.poppins(
          //                         textStyle: TextStyle(
          //                           color: Colors.black,
          //                           fontSize: width * 0.035,
          //                         )),
          //                   ),
          //                 ],
          //               ),),
          //             PopupMenuItem(
          //               onTap:()=> setOrder("popularity"),
          //               child:Row(
          //                 children: [
          //                   Text(
          //                     'Popularity',
          //                     style: GoogleFonts.poppins(
          //                         textStyle: TextStyle(
          //                           color: Colors.black,
          //                           fontSize: width * 0.035,
          //                         )),
          //                   ),
          //                 ],
          //               ),),
          //             PopupMenuItem(
          //               onTap:()=> setOrder("rating"),
          //               child:Row(
          //                 children: [
          //                   Text(
          //                     'Rating',
          //                     style: GoogleFonts.poppins(
          //                         textStyle: TextStyle(
          //                           color: Colors.black,
          //                           fontSize: width * 0.035,
          //                         )),
          //                   ),
          //                 ],
          //               ),),
          //           ],
          //         ),
          //       ),
          //       Text(
          //         'Sort',
          //         style: GoogleFonts.poppins(
          //             textStyle: TextStyle(
          //               color: Colors.black,
          //               fontSize: width * 0.035,
          //             )),
          //       ),
          //     ],
          //   ),
          // ],
          backgroundColor: Colors.white,
          title: Text(
            "Other Sellers",
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: width * 0.05,
                    fontWeight: FontWeight.bold)),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: width * 0.06,
              )),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: SingleChildScrollView(
            child: Column(
              children: [

                Obx(
                  () {
                    return
                      Get.put(HomeController()).isSellerLoading.value?loader():
                      Get.put(HomeController()).sellerList.isNotEmpty?
                      ListView.builder(
                        itemCount: Get.put(HomeController()).sellerList.length,
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: (){
                              Get.put(HomeController()).clearValueAll();
                              Get.put(CategoryController()).updateText("");
                              Get.put(CategoryController()).updateCode("");
                              Get.off(ProductDisplay(int.parse(Get.put(HomeController()).sellerList[index].productId.toString())));
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:   EdgeInsets.symmetric(horizontal: width * 0.04),
                                          child: Text(
                                            Get.put(HomeController()).sellerList[index].price.toString(),
                                            style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.red.shade900, fontSize: Get.height*0.021)),
                                          ),
                                        ),

                                        SizedBox(
                                          height:  width * 0.015,
                                        ),
                                        Padding(
                                          padding:   EdgeInsets.symmetric(horizontal: width * 0.04),
                                          child: Text("Cod Available",
                                            style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: Get.height*0.017)),
                                          ),
                                        ),
                                        SizedBox(
                                          height:  width * 0.015,
                                        ),
                                        Padding(
                                          padding:   EdgeInsets.symmetric(horizontal: width * 0.04),
                                          child: Row(
                                            children: [
                                              Text("Sold By :  ",
                                                style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: Get.height*0.017)),
                                              ),
                                              Text(Get.put(HomeController()).sellerList[index].storeName??"",
                                                style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.w700, color: Colors.blue.shade900, fontSize: Get.height*0.017)),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height:  width * 0.015,
                                        ),
                                        Padding(

                                          padding:   EdgeInsets.symmetric(horizontal: width * 0.04),
                                          child: Row(
                                            children: [
                                              RatingBar.builder(
                                                initialRating: double.parse(Get.put(HomeController()).sellerList[index].sellerRating.toString()),
                                                minRating: 5,
                                                ignoreGestures: true,
                                                itemSize: 20,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                itemCount: 5,
                                                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                                itemBuilder: (context, _) => Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                                onRatingUpdate: (rating) {
                                                  print(rating);
                                                },
                                              ),
                                              Text("  (${Get.put(HomeController()).sellerList[index].sellerCount.toString()})",
                                                style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.w700, color: Colors.blue.shade900, fontSize: Get.height*0.018)),
                                              ),
                                            ],
                                          ),
                                        ),

                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Text("Click here to buy",
                                        style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.w700, color: Colors.red, fontSize: Get.height*0.015)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }):Column(
                        children: [
                          SizedBox(height: Get.height*0.35,),
                          Center(
                            child: Text(
                              'No Data',
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      color: Colors.black, fontSize: 16,
                                      fontWeight: FontWeight.w700

                                  )),
                            ),
                          ),
                        ],
                      );
                  }
                ),
              ],
            ),
          ),
        )
    );
  }

  List<ViewAllModel> sortList(String sortingOrder, List<ViewAllModel> list) {
    switch (sortingOrder) {
      case "popularity":
        list.sort((a, b) =>
            int.parse(b.quantity!).compareTo(int.parse(a.quantity!)));
        break;
      case "prices":
        list.sort(
                (a, b) => double.parse(b.price!.toString().replaceAll("₹", "").replaceAll(",", "")).compareTo(double.parse(a.price!.toString().replaceAll("₹", "").replaceAll(",", ""))));
        break;
      case "Rating":
        list.sort((a, b) => int.parse(b.rating!.toString())
            .compareTo(int.parse(a.rating!.toString())));
        break;
      case "none":
        break;
    }

    return list;
  }

}

class ViewAllCard extends StatelessWidget {
  const ViewAllCard({
    Key? key,
    required this.onTap,
    required this.width,
    required this.product,
  }) : super(key: key);

  final Null Function() onTap;
  final double width;
  final ViewAllModel product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: width * 0.53,
        width: width * 0.4,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(7),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade200,
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(1, 3))
            ]),
        child: Stack(children: [
          Column(
            children: [
              SizedBox(
                height: width * 0.02,
              ),
              Container(
                height: width * 0.25,
                width: width * 0.4,
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: EdgeInsets.all(
                    width * 0.02,
                  ),
                  child: Image.network(product.thumb!),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.02,
                ),
                child: Text(
                  product.name!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.grey.shade900, fontSize: width * 0.04)),
                ),
              ),
              SizedBox(
                height: width * 0.015,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.02,
                ),
                child: Row(
                  children: [
                    Text(
                      product.price!,
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: width * 0.038)),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.02,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 15,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 15,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 15,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 15,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 15,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '(${product.quantity})',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: width * 0.03)),
                    ),
                  ],
                ),
              ),
            ],
          ),

          //Sales display
          //        Padding(
          //        padding: EdgeInsets.all( width * 0.02,),
          //        child: Row(children: [
          //          Container(
          // height: 25,
          // width: 40,
          // decoration:const  BoxDecoration(
          //     color: Colors.red,
          //     borderRadius: BorderRadius.only(
          //         bottomRight: Radius.circular(20))),
          // child: Center(
          //   child: Text(
          //     '-60%',
          //     style: GoogleFonts.poppins(
          //         textStyle:const TextStyle(
          //             color: Colors.white, fontSize: 10)),
          //   ),
          // ))
          //        ]),
          //      ),
        ]),
      ),
    );
  }
}
