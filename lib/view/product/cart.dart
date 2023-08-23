import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quantity_input/quantity_input.dart';
import 'package:vkreta/controllers/theme.dart';
import 'package:vkreta/custom_widgets/social_button.dart';
import 'package:vkreta/custom_widgets/widgets.dart';
import 'package:vkreta/getx_controllers/homepage.dart';
import 'package:vkreta/view/home/controller/home_controller.dart';
import 'package:vkreta/view/order_history/delivery.dart';
import 'package:vkreta/models/cartlistModel.dart';
import 'package:vkreta/view/product/productdisplay.dart';
import 'package:vkreta/services/apiservice.dart';

import '../../models/bages_model.dart';
import '../../models/carttotalModel.dart';

class Cart extends StatefulWidget {
   Cart({Key? key,this.data}) : super(key: key);
  var data;

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  // get product_id => null;
  List<int> simpleIntInput = [];
@override
  void initState() {
   Get.put(HomeController()).couponData(couponV: Get.put(HomeController()).couponValue.value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(icon:  Icon(Icons
        .arrow_back_ios_outlined,color:
        widget.data == "true"?
        AppColor.boldBlackColor: Colors.transparent,),
        onPressed: (){
          Get.back();
        },
        ),
        elevation: 0.5,
        centerTitle:
        widget.data == "true"?false:
        true,
        title: Text(
          'Shopping Cart',
          style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 16)),
        ),
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder<CartlistModel>(
        future: ApiService().getCartItems(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
            for (int index = 0; index < snapshot.data.products.length; index++) {
              simpleIntInput.add(int.parse(snapshot.data.products[index].quantity));
            }
          }
          if (snapshot.hasData) {
            return SingleChildScrollView(

              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        for (int index = 0; index < snapshot.data.products.length; index++)
                          InkWell(
                            onTap: (){
                              Get.put(HomeController()).clearValueAll();
                              Navigator.of(context).push(PageRouteBuilder(
                                  transitionDuration: const Duration(seconds: 1),
                                  transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {
                                    animation = CurvedAnimation(parent: animation, curve: Curves.linear);
                                    return SharedAxisTransition(child: child, animation: animation, secondaryAnimation: secAnimation, transitionType: SharedAxisTransitionType.horizontal);
                                  },
                                  pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
                                    return ProductDisplay(int.parse(snapshot.data.products[index].productId));
                                  }));
                            },
                            child: Container(
                              // height: 152,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              width: MediaQuery.of(context).size.width,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        // height: 150,
                                        width: MediaQuery.of(context).size.width / 3.5,
                                        child: Column(
                                          children: [
                                            Container(
                                              // height: 120,
                                                color: Colors.white,
                                                width: MediaQuery.of(context).size.width / 3,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Image.network(snapshot.data.products[index].thumb),
                                                )),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        // height: 130,
                                        width: MediaQuery.of(context).size.width / 1.4,
                                        color: Colors.white,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 10),
                                              child: Text(
                                                snapshot.data.products[index].name,
                                                // overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 14)),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 3,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 10),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    snapshot.data.products[index].price,
                                                    style: GoogleFonts.poppins(textStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 10),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Container(
                                                    height: 30,
                                                    width: 30,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadiusDirectional.circular(1),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey.shade300,
                                                          spreadRadius: 1,
                                                        ),
                                                      ],
                                                    ),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        final delete = await ApiService().removeCartItems(int.parse(snapshot.data.products[index].cartId));
                                                        String? error = '';

                                                        if (delete.error != null) {
                                                          error = delete.error;
                                                        }
                                                        if (error != '') {
                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                            SnackBar(
                                                              content: Text(error!),
                                                              backgroundColor: Colors.red,
                                                            ),
                                                          );
                                                        }
                                                        if (delete.success != null) {
                                                          Provider.of<BadgesModel>(context, listen: false).updatecart(-1);
                                                          setState(() {
                                                            Get.put(HomePage()).cartData();
                                                            Get.put(HomeController()).couponData(couponV: Get.put(HomeController()).couponValue.value);
                                                          });
                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                            const SnackBar(
                                                              content: Text('Item removed from cart'),
                                                              backgroundColor: Colors.green,
                                                            ),
                                                          );

                                                          setState(() {});
                                                        }
                                                      },
                                                      child: Center(
                                                        child: Icon(
                                                          Icons.delete,
                                                          color: Colors.grey.shade700,
                                                          size: 23,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      QuantityInput(
                                                        buttonColor: Colors.blue[900],
                                                        elevation: 0,
                                                        inputWidth: 40,
                                                        minValue: 1,
                                                        maxValue: int.parse(snapshot.data.products[index].stockQty),

                                                        decimalDigits: 1,
                                                        value: simpleIntInput[index],
                                                        readOnly: true,
                                                        onChanged: (value) async {


                                                          setState(() => simpleIntInput[index] = int.parse(value.replaceAll('', '')));
                                                          if(simpleIntInput[index] <
                                                              double.parse(snapshot.data.products[index].quantity.toString())){}

                                                          print("simpleIntInput[index] ------->> ${simpleIntInput[index]}");

                                                          final update = await ApiService().updateCartQuantity(
                                                            int.parse(snapshot.data.products[index].cartId),
                                                            simpleIntInput[index],
                                                          );

                                                          String? error = '';

                                                          if (update.error != null) {
                                                            error = update.error;
                                                          }
                                                          if (error != '') {
                                                            setState(() {
                                                              Get.put(HomePage()).cartData();
                                                              Get.put(HomeController()).couponData(couponV: Get.put(HomeController()).couponValue.value);
                                                            });
                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                              SnackBar(
                                                                content: Text(error!),
                                                                backgroundColor: Colors.red,
                                                              ),
                                                            );
                                                          }
                                                          if (update.success != null) {
                                                            setState(() {
                                                              Get.put(HomePage()).cartData();
                                                              Get.put(HomeController()).couponData(couponV: Get.put(HomeController()).couponValue.value);
                                                            });
                                                          }
                                                        },
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  const Divider(height: 2),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 10,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: Colors.grey.shade100),
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        enableDrag: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        context: context,
                        builder: (context) => FutureBuilder(
                          future: ApiService().getCoupon(),
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              return Container(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      const SizedBox(height: 20),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Select Coupon',
                                              style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                  color: Colors.grey.shade900,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                              ),

                                            ),
                                          ],
                                        ),
                                      ),

                                      const SizedBox(height: 20),
                                      for (int i = 0; i < snapshot.data.couponList.length; i++)
                                        snapshot.data.couponList.isNotEmpty?
                                        InkWell(
                                          onTap: () async {
                                            Get.put(HomeController()).updateCouponValue(snapshot.data.couponList[i].name);
                                          await  ApiService().applyCoupon(snapshot.data.couponList[i].code);

                                            Navigator.pop(context);
                                            setState(() {});
                                          },
                                          borderRadius: BorderRadius.circular(10),
                                          child: Container(
                                            margin: const EdgeInsets.all(10),
                                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                            decoration: BoxDecoration(

                                              borderRadius: BorderRadius.circular(10),
                                              border: Border.all(color: AppColor.boldBlackColor)
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text('Name:      ${snapshot.data.couponList[i].name}',
                                                    style: const TextStyle(color: Colors.black),
                                                  ),
                                                  Text('Code:      ${snapshot.data.couponList[i].code}',
                                                    style: const TextStyle(color: Colors.black),),
                                                  Text('Discount:      ${snapshot.data.couponList[i].discount}',
                                                    style: const TextStyle(color: Colors.black),),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ):Text("No Data",
                                        style: TextStyle(color: AppColor.boldBlackColor,fontSize: 15),
                                        )
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.loyalty, color: Colors.blue.shade900, size: 25),
                                        const SizedBox(width: 10),
                                        Obx(
                                          () {
                                            return Text(
                                              Get.put(HomeController()).couponValue.value.isNotEmpty?
                                                  "${Get.put(HomeController()).couponValue.value} coupon"

                                                  :
                                              'Use coupons',
                                              style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                  color: Colors.grey.shade600,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            );
                                          }
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.grey.shade400,
                                      size: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
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
                                    SizedBox(height: Get.height*0.03,),
                                    Container(
                                      width: MediaQuery.of(context).size.width - 20,
                                      margin: const EdgeInsets.only(bottom: 20),
                                      child: InkWell(
                                        onTap:
                                        snapshot.data.products.where((element) => element.stock == false).isNotEmpty?
                                (){showErrorToast("Product Out Of Stock");}:

                                            () {
                                          if (snapshot.data.products.length != 0) {

                                            Get.put(HomePage()).addressData();

                                           // ApiService().getShippingList(Get.put(HomePage()).addressList[0].addressId.toString());
                                            Navigator.of(context).push(
                                              PageRouteBuilder(
                                                transitionDuration: const Duration(seconds: 1),
                                                transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {
                                                  animation = CurvedAnimation(parent: animation, curve: Curves.linear);
                                                  return SharedAxisTransition(child: child, animation: animation, secondaryAnimation: secAnimation, transitionType: SharedAxisTransitionType.horizontal);
                                                },
                                                pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
                                                  return Delivery();
                                                },
                                              ),
                                            );
                                          } else {
                                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                              content: Text('No card item found'),
                                              backgroundColor: Colors.red,
                                            ));
                                          }
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 100,
                                          decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(4)),
                                          child: Center(
                                            child: Text(
                                              'Next',
                                              style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              }
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
