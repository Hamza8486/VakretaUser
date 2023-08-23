import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vkreta/custom_widgets/social_button.dart';
import 'package:vkreta/custom_widgets/widgets.dart';
import 'package:vkreta/getx_controllers/homepage.dart';
import 'package:vkreta/models/bages_model.dart';
import 'package:vkreta/view/address/modifyyouraddress.dart';
import 'package:vkreta/view/home/controller/home_controller.dart';
import 'package:vkreta/view/payment/payment.dart';
import 'package:vkreta/services/apiservice.dart';

import '../../models/cartlistModel.dart';
import '../../models/carttotalModel.dart';


class Delivery extends StatefulWidget {
  Delivery({Key? key}) : super(key: key);

  @override
  State<Delivery> createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  final homeController = Get.put(HomeController());
  final snapshot = Get.put(HomePage());
  String totalbillamount = "0";
  @override
  void initState() {
    Get.put(HomePage()).addressList.isEmpty?"":
    Get.put(HomeController()).shippingData(id:Get.put(HomePage()).addressList[0].addressId.toString() );
    Get.put(HomePage()).addressList.isEmpty?"":
    ApiService().getShippingList(Get.put(HomePage()).addressList[0].addressId.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back, color: Colors.black, size: width * 0.06)),
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          'Delivery',
          style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 16)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: width * 0.02,
            ),
          //  ModifyYourAddress

              Obx(
                () {
                  return
                    Get.put(HomeController()).addressAll.isNotEmpty?

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:   EdgeInsets.symmetric(horizontal: width * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Home Address',
                              style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 16, fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            Container(
                              height: width * 0.08,
                              width: width * 0.15,
                              decoration: BoxDecoration(color: Colors.blue.shade900, borderRadius: BorderRadius.circular(4)),
                              child: Center(
                                child: Text(
                                  'Default',
                                  style: GoogleFonts.poppins(
                                    textStyle:const TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:   EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          Get.put(HomeController()).firstName.value,
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Colors.grey.shade900,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            Text(
                  Get.put(HomeController()).addressAll.value,
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Colors.grey.shade900,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            Text(
                              Get.put(HomeController()).company.value,
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Colors.grey.shade900,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            Text(
                             "${Get.put(HomeController()).countryAll.value} ${Get.put(HomeController()).cityAll.value}",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Colors.grey.shade900,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            Text(
                          Get.put(HomeController()).countryAll.value,
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Colors.grey.shade900,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                Get.to(ModifyYourAddress(data: "select",));
                              },
                              child: Text(
                                'Change Address',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Colors.grey.shade900,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ):


                    (
                        Get.put(HomePage()).isAddressLoading.value?loader(
                          height: Get.height*0.1
                        ):

                        Get.put(HomePage()).addressList.isNotEmpty?
                        Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Home Address',
                                style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 16, fontWeight: FontWeight.bold)),
                              ),
                              SizedBox(
                                width: width * 0.02,
                              ),
                              Container(
                                height: width * 0.08,
                                width: width * 0.15,
                                decoration: BoxDecoration(color: Colors.blue.shade900, borderRadius: BorderRadius.circular(4)),
                                child: Center(
                                  child: Text(
                                    'Default',
                                    style: GoogleFonts.poppins(
                                      textStyle:const TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),


                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Text(
                                "${snapshot.addressList.first.firstname} ${snapshot.addressList.first.lastname}",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Colors.grey.shade900,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    )),
                              ),
                            ],
                          ),
                        ),


                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Text(
                                snapshot.addressList.first.company==null?"":snapshot.addressList.first.company.toString(),
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Colors.grey.shade900,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    )),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Text(
                                "${snapshot.addressList.first.address1==null?"":snapshot.addressList.first.address1.toString()} ,  ${snapshot.addressList.first.address2==null?"":snapshot.addressList.first.address2.toString()}",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Colors.grey.shade900,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    )),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Text(
                                "${snapshot.addressList.first.country==null?"":snapshot.addressList.first.country.toString()} ${snapshot.addressList.first.city==null?"":snapshot.addressList.first.city.toString()}",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Colors.grey.shade900,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    )),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Text(
                  snapshot.addressList.first.zone==null?"":snapshot.addressList.first.zone.toString(),
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Colors.grey.shade900,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    )),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  Get.to(ModifyYourAddress(data: "select",));
                                },
                                child: Text(
                                  'Change Address',
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.grey.shade900,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ):GestureDetector(
                          onTap: (){
                            Get.to(ModifyYourAddress());
                          },
                      child: Center(
                        child: Text(
                              'Add Address',
                              style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900, fontWeight: FontWeight.bold, fontSize: 16)),
                            ),
                      ),
                    )

                    );
                }
              ),
            SizedBox(height: width * 0.02),
            Container(height: 10, width: MediaQuery.of(context).size.width, color: Colors.grey.shade100),
            SizedBox(
              height: width * 0.02,
            ),
            Padding(
              padding:   EdgeInsets.symmetric(horizontal: width * 0.02),
              child: Row(
                children: [
                  Text(
                    'Order List',
                    style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900, fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: width * 0.02,
            ),
            FutureBuilder<CartlistModel>(
                future: ApiService().getCartItems(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        for (int index = 0; index < snapshot.data.products.length; index++)
                          Column(
                            children: [
                              Container(
                                height: 110,
                                width: MediaQuery.of(context).size.width,
                                decoration:const BoxDecoration(),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: width * 0.25,
                                      width: MediaQuery.of(context).size.width / 3,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Image.network(
                                          snapshot.data.products[index].thumb,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 110,
                                      width: MediaQuery.of(context).size.width / 1.5,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                            child: Text(
                                              snapshot.data.products[index].name,
                                              maxLines: 2,
                                              style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900, fontWeight: FontWeight.bold, fontSize: 13)),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 0,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Qty: " + snapshot.data.products[index].quantity,
                                                  style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey[900], fontSize: 12)),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8),
                                            child: Row(
                                              children: [
                                                Text(
                                                  snapshot.data.products[index].price,
                                                  style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900, fontWeight: FontWeight.bold, fontSize: 14)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Divider(height: 1, color: Colors.grey.shade300),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Divider(height: 1, color: Colors.grey.shade300),
                              ),
                            ],
                          ),
                      ],
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }),
            SizedBox(
              height: width * 0.02,
            ),
            Container(
              height: 10,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.grey.shade100),
            ),
            Container(
              // height: 220,
              width: MediaQuery.of(context).size.width,
              decoration:const BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Obx(
                      () {
                        return InkWell(
                          onTap:
                          Get.put(HomeController()).addressAll.value.isEmpty?(){
                            if (Get.put(HomeController()).addressAll.value.isEmpty) {
                              showModalBottomSheet(
                                enableDrag: true,
                                shape:const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                                context: context,
                                builder: (context) => FutureBuilder(
                                  future: ApiService().getShippingList(Get.put(HomePage()).addressList.first.addressId.toString()),
                                  builder: (context, AsyncSnapshot snapshot) {
                                    if (snapshot.hasData) {
                                      return SizedBox(
                                        height: MediaQuery.of(context).size.height,
                                        width: MediaQuery.of(context).size.width,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              SizedBox(height: width * 0.02),
                                              //choose Courier
                                              Padding(
                                                padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      'Choose Courier',
                                                      style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900, fontWeight: FontWeight.bold, fontSize: 16)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: width * 0.02,
                                              ),
                                              for (int i = 0; i < snapshot.data.length; i++)
                                                CourierOptions(
                                                  function: () {
                                                    Future.delayed(const Duration(seconds: 2), () {
                                                      Navigator.pop(context, true);
                                                    });
                                                    homeController.updateShipping(snapshot.data[i]['code']);
                                                    setState(() {});
                                                  },
                                                  title: '${snapshot.data[i]['title']}',
                                                  cost: '${snapshot.data[i]['cost']}',
                                                  code: '${snapshot.data[i]['code']}',
                                                  // regularPrice: '150',
                                                ),
                                              // CourierOptions(
                                              //   title: 'FedEX',
                                              //   expressPrice: '70',
                                              //   regularPrice: '150',
                                              // ),
                                              // CourierOptions(
                                              //   title: 'other',
                                              //   expressPrice: '70',
                                              //   regularPrice: '150',
                                              // ),
                                            ],
                                          ),
                                        ),
                                      );
                                    } else {
                                      return const  Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                  },
                                ),
                              );
                            } else {
                              showModalBottomSheet(
                                enableDrag: true,
                                shape:const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                                context: context,
                                builder: (context) => FutureBuilder(
                                  future: ApiService().getShippingList(Get.put(HomePage()).addressList.first.addressId.toString()),
                                  builder: (context, AsyncSnapshot snapshot) {
                                    if (snapshot.hasData) {
                                      return SizedBox(
                                        height: MediaQuery.of(context).size.height,
                                        width: MediaQuery.of(context).size.width,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              SizedBox(height: width * 0.02),
                                              //choose Courier
                                              Padding(
                                                padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      'Choose Courier',
                                                      style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900, fontWeight: FontWeight.bold, fontSize: 16)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: width * 0.02,
                                              ),
                                              for (int i = 0; i < snapshot.data.length; i++)
                                                CourierOptions(
                                                  function: () {
                                                    Future.delayed(const Duration(seconds: 2), () {
                                                      Navigator.pop(context, true);
                                                    });
                                                    homeController.updateShipping(snapshot.data[i]['code']);
                                                    setState(() {});
                                                  },
                                                  title: '${snapshot.data[i]['title']}',
                                                  cost: '${snapshot.data[i]['cost']}',
                                                  code: '${snapshot.data[i]['code']}',
                                                  // regularPrice: '150',
                                                ),
                                              // CourierOptions(
                                              //   title: 'FedEX',
                                              //   expressPrice: '70',
                                              //   regularPrice: '150',
                                              // ),
                                              // CourierOptions(
                                              //   title: 'other',
                                              //   expressPrice: '70',
                                              //   regularPrice: '150',
                                              // ),
                                            ],
                                          ),
                                        ),
                                      );
                                    } else {
                                      return const  Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                  },
                                ),
                              );
                            }
                          }:
                              () {
                            if (Get.put(HomeController()).addressAll.value.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text('No address Found, Please add a address'),
                                backgroundColor: Colors.red,
                              ));
                            } else {
                              showModalBottomSheet(
                                enableDrag: true,
                                shape:const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                                context: context,
                                builder: (context) => FutureBuilder(
                                  future: ApiService().getShippingList(homeController.addressId.value.toString()),
                                  builder: (context, AsyncSnapshot snapshot) {
                                    if (snapshot.hasData) {
                                      return SizedBox(
                                        height: MediaQuery.of(context).size.height,
                                        width: MediaQuery.of(context).size.width,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              SizedBox(height: width * 0.02),
                                              //choose Courier
                                              Padding(
                                                padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      'Choose Courier',
                                                      style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900, fontWeight: FontWeight.bold, fontSize: 16)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: width * 0.02,
                                              ),
                                              for (int i = 0; i < snapshot.data.length; i++)
                                                CourierOptions(
                                                  function: () {
                                                    Future.delayed(const Duration(seconds: 2), () {
                                                      Navigator.pop(context, true);
                                                    });
                                                    homeController.updateShipping(snapshot.data[i]['code']);
                                                    setState(() {});
                                                  },
                                                  title: '${snapshot.data[i]['title']}',
                                                  cost: '${snapshot.data[i]['cost']}',
                                                  code: '${snapshot.data[i]['code']}',
                                                  // regularPrice: '150',
                                                ),
                                              // CourierOptions(
                                              //   title: 'FedEX',
                                              //   expressPrice: '70',
                                              //   regularPrice: '150',
                                              // ),
                                              // CourierOptions(
                                              //   title: 'other',
                                              //   expressPrice: '70',
                                              //   regularPrice: '150',
                                              // ),
                                            ],
                                          ),
                                        ),
                                      );
                                    } else {
                                      return const  Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                  },
                                ),
                              );
                            }
                          },
                          child: Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.grey.shade300, spreadRadius: 1)], borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.local_shipping, color: Colors.blue.shade900, size: 25),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Obx(() {
                                          return Text(
                                            Get.put(HomeController()).shippingList.isEmpty?
                                            "Choose delivery":Get.put(HomeController()).shippingList[0].title,
                                            // Provider.of<BadgesModel>(context).selectedCourier == '' ? "Choose delivery" : Provider.of<BadgesModel>(context).selectedCourier,
                                            style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade600, fontSize: 14)),
                                          );
                                        }
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.grey.shade400,
                                      size: 15,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Obx(
                                  () {
                                return
                                  Get.put(HomeController()).isCouponLoading.value?
                                  loader(height: Get.height*0.1):

                                  Column(
                                    children: [
                                      Obx(
                                              () {
                                            return Column(
                                              crossAxisAlignment:
                                              Get.put(HomeController()).couponList.isNotEmpty?CrossAxisAlignment.start:
                                              CrossAxisAlignment.start,
                                              children: [
                                                for (int i = 0; i < Get.put(HomeController()).couponList.length; i++)
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "",
                                                        style: GoogleFonts.poppins(
                                                          textStyle: const TextStyle(
                                                            color: Colors.black,
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ),
                                                      const Spacer(),
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(vertical: 6),
                                                        child:

                                                        Row(
                                                          children: [
                                                            Text(
                                                              Get.put(HomeController()).couponList[i].title,
                                                              style: GoogleFonts.poppins(
                                                                textStyle: const TextStyle(
                                                                  color: Colors.black,
                                                                  fontWeight: FontWeight.bold,
                                                                  fontSize: 14,
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(width: Get.width*0.03,),
                                                            Text(
                                                              Get.put(HomeController()).couponList[i].text,
                                                              style: GoogleFonts.poppins(
                                                                textStyle: const TextStyle(
                                                                  color: Colors.black,
                                                                  fontWeight: FontWeight.w500,
                                                                  fontSize: 14,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                              ],
                                            );
                                          }
                                      ),

                                    ],
                                  );
                              }
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //pay button
                        Obx(
                          () {
                            return Container(
                              // height: 220,
                              width:homeController.countryAll.value.isNotEmpty?MediaQuery.of(context).size.width - 20: MediaQuery.of(context).size.width - 20,
                              child: InkWell(
                                onTap:
                                Get.put(HomeController()).shippingList.isNotEmpty?

                                    () {
                                  print(Get.put(HomeController()).couponList.length);
                                  Get.put(HomePage()).cartData();
                                  Get.put(HomeController()).paymentData(search:homeController.addressId.value.isEmpty?snapshot.addressList.first.addressId.toString():homeController.addressId.value );

                                      Navigator.of(context).push(
                                        PageRouteBuilder(
                                          transitionDuration: Duration(seconds: 1),
                                          transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {
                                            animation = CurvedAnimation(parent: animation, curve: Curves.linear);
                                            return SharedAxisTransition(child: child, animation: animation, secondaryAnimation: secAnimation, transitionType: SharedAxisTransitionType.horizontal);
                                          },
                                          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
                                            return Payment(
                                              homeController.addressId.value.isEmpty?int.parse(snapshot.addressList.first.addressId.toString()):
                                              int.parse(homeController.addressId.value),
                                              Get.put(HomeController()).couponList.length == 6?
                                              Get.put(HomeController()).couponList[5].text:
                                                Get.put(HomeController()).couponList.length == 5?
                                              Get.put(HomeController()).couponList[4].text:
                                                Get.put(HomeController()).couponList.length == 4?
                                                Get.put(HomeController()).couponList[3].text:Get.put(HomeController()).couponList[2].text,
                                            );
                                          },
                                        ),
                                      );

                                  // if (addressList.isEmpty) {
                                  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  //     content: Text('No address Found, Please add a address'),
                                  //     backgroundColor: Colors.red,
                                  //   ));
                                  // } else {
                                  //
                                  // }
                                }:(){
                                  showErrorToast("Please select shipping method");
                                },
                                child: Center(
                                  child: Container(
                                    height: 40,
                                    width: MediaQuery.of(context).size.width - 20,
                                    decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(4)),
                                    child: Center(
                                      child: Text(
                                        'Pay',
                                        style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CourierOptions extends StatelessWidget {
  CourierOptions({
    Key? key,
    required this.cost,
    this.code,
    required this.title,
    required this.function,
  }) : super(key: key);

  final String title;
  final String? code;
  final String cost;
  final function;

  Color iconColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<BadgesModel>(context, listen: false).updateSelectedCourier(title);
        Provider.of<BadgesModel>(context, listen: false).updateShippingMethod(code);
        function();

        // dely of 10 seconds
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.grey.shade800, fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                Icon(
                  Icons.check_circle_outline,
                  color: Provider.of<BadgesModel>(
                    context,
                  ).selectedCourier ==
                      title
                      ? Colors.greenAccent
                      : iconColor,
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Code',
                  style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade700, fontSize: 14)),
                ),
                Text(
                  '$code',
                  style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade700, fontSize: 14)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cost',
                  style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade700, fontSize: 14)),
                ),
                Text(
                  '₹ $cost',
                  style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade700, fontSize: 14)),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(height: 1, color: Colors.grey.shade300),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
