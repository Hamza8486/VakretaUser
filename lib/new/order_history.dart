import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vkreta/custom_widgets/widgets.dart';
import 'package:vkreta/new/detail.dart';
import 'package:vkreta/view/home/controller/home_controller.dart';
import 'package:vkreta/view/order_history/ReturnOrderScreen.dart';
import 'package:vkreta/getx_controllers/order_list.dart';
import 'package:vkreta/view/product/productdisplay.dart';
import 'package:vkreta/view/review/seller_review_Screen.dart';
import 'package:vkreta/services/apiservice.dart';
import 'package:vkreta/view/order_history/track_screen.dart';
import '../../models/MyOrderHistoryModel.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  final orderHistory = Get.put(MyOrderHistory());
  final homeController = Get.put(HomeController());
  getOrderList() async {
    setLoading(true);
    List<MyOrderHistoryModel> response = await ApiService().Orderlist();
    setLoading(false);
    orderHistory.list.addAll(response);
  }

  setLoading(bool value) {
    setState(() {
      isLoading = false;
    });
  }

  bool isLoading = false;
  var onTap1 = () {};
  var onTap2 = () {};
  String image = "assets/shoes.png";
  String title = "Here is your product Title writ as long as you can";
  String prices = "\$470";
  String label1 = "Return";
  String label2 = "View";
  String orderId = "USDJHD";
  String date = "20-12-11";
  String status = "Deliverd";

  @override
  void initState() {
    getOrderList();
    ApiService().Orderlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ApiService().Orderlist();
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            orderHistory.list.value.clear();
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Order List",
          style: TextStyle(color: Colors.black),
        ),
        actions: [Padding(
          padding: const EdgeInsets.only(right: 15),
          child: IconButton(onPressed: (){

            setState(() {
              orderHistory.list.clear();

              getOrderList();
            });
          }, icon: Icon(Icons.refresh,color: Colors.black,size: Get.height*0.04,)),
        )],
        elevation: 1,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: width * 0.04, horizontal: width * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  orderHistory.list.isEmpty?loader():
                  ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            Get.to(DetailView(data:orderHistory.list[index] ,));
                          },
                          child: Order(
                            width: width,
                            statu: orderHistory.list[index].status![0],
                            status:
                            orderHistory.list[index].status![0].orderStatus!,
                            date: orderHistory.list[index].dateAdded!,
                            totalValue: orderHistory.list[index].total.toString()!,
                            orderId: orderHistory.list[index].orderId!,
                            product: orderHistory.list[index].status![0].product!,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: width * 0.04,
                        );
                      },
                      itemCount: orderHistory.list.length)
                ],
              ),
            ),
          ),
          isLoading
              ? loader()
              : Container()
        ],
      ),
    );
  }
}

class Order extends StatelessWidget {
  const Order({
    Key? key,
    required this.width,
    required this.totalValue,
    required this.status,
    required this.date,
    required this.orderId,
    required this.product,
    required this.statu
  }) : super(key: key);

  final double width;
  final String status;
  final Status statu;
  final String date;
  final String totalValue;
  final String orderId;
  final List<Product> product;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: Colors.white,
      shadowColor: Colors.grey.withOpacity(0.9),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
      side: BorderSide(color: Colors.grey.withOpacity(0.5))
      ),
      child: Padding(
        padding:EdgeInsets.symmetric(
           vertical: width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  status,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      letterSpacing: 0.5,
                      color: Colors.blue.shade900,
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.04),
                ),

              ],
            ),
            SizedBox(
              height: Get.height * 0.005,
            ),
            const Divider(
              thickness: 1,
            ),
            SizedBox(
              height: Get.height * 0.005,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: Get.width*0.04),
              child: Text(
                date,
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.blue,
                  fontSize: Get.height*0.017

                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.005,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: Get.width*0.04),
              child: Row(
                children: [
                  Text(
                    "Order #ID ",

                    style: TextStyle( fontSize: Get.height*0.017,
                    fontWeight: FontWeight.w700
                    ),
                  ),
                  Text(
                    orderId,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: width * 0.04),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return OrderItems(
                    product:
                    product[index],
                    orderId: orderId,
                    status: statu,
                    width: width,

                    total:
                    product.length==1?SizedBox.shrink():
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        "+${product.length.toString()} other product",
                        maxLines: 1,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                            fontSize: width * 0.035),
                      ),
                    ),




                  );
                },
                separatorBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: width * 0.02,
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      SizedBox(
                        height: width * 0.02,
                      ),
                    ],
                  );
                },
                itemCount:
                product.length < 2
                    ? product.length
                    : 1,

                ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            const Divider(
              thickness: 1,
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: Get.width*0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Total Payment",
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: Get.height*0.017

                    ),
                  ),
                  SizedBox(height: 3,),
                  Text(
                    totalValue,
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: Get.height*0.017

                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
          ],
        ),
      ),
    );
  }
}

class OrderItems extends StatelessWidget {
  const OrderItems({Key? key,required this.orderId,required this.total, required this.product,required this.status, required this.width})
      : super(key: key);

  final Product product;
  final Status status;
  final double width;
  final String orderId;
  final Widget total;

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Row(

          children: [
            Image.network(
              product.thumb!,
              width: width * 0.3,
              height: width * 0.2,
              fit: BoxFit.fill,
            ),
            SizedBox(
              width: width * 0.02,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      product.productName!,
                      maxLines: 3,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: width * 0.035),
                    ),
                  ),

                  SizedBox(height: Get.height*0.008,),
                  total



                ],
              ),
            )
          ],
        ),

      ],
    );
  }

  Future<void> _launchUrl(String _url) async {
    if (!await launchUrl(Uri.parse(_url))) {
      throw 'Could not launch $_url';
    }
  }
}
