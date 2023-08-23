import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vkreta/view/order_history/ReturnOrderScreen.dart';
import 'package:vkreta/getx_controllers/order_list.dart';
import 'package:vkreta/view/product/productdisplay.dart';
import 'package:vkreta/view/review/seller_review_Screen.dart';
import 'package:vkreta/services/apiservice.dart';
import 'package:vkreta/view/order_history/track_screen.dart';
import '../../models/MyOrderHistoryModel.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({Key? key}) : super(key: key);

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  final orderHistory = Get.put(MyOrderHistory());
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Order(
                          width: width,
                          statu: orderHistory.list[index].status![0],
                          status:
                              orderHistory.list[index].status![0].orderStatus!,
                          date: orderHistory.list[index].dateAdded!,
                          orderId: orderHistory.list[index].orderId!,
                          product: orderHistory.list[index].status![0].product!,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: width * 0.04,
                        );
                      },
                      itemCount: orderHistory.list.length),
                ],
              ),
            ),
          ),
          isLoading
              ? Positioned.fill(
                  child: Container(
                  color: Colors.white,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  ),
                ))
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
  final String orderId;
  final List<Product> product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.04, vertical: width * 0.04),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(color: Colors.grey.withOpacity(0.5))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              Text(
                date,
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
          const Divider(
            thickness: 2,
          ),
          SizedBox(
            height: width * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Order #ID",
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: width * 0.04),
              ),
              Text(
                orderId,
                textAlign: TextAlign.end,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: width * 0.04),
              ),
            ],
          ),
          SizedBox(
            height: width * 0.02,
          ),
          const Divider(
            thickness: 2,
          ),
          SizedBox(
            height: width * 0.04,
          ),
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return OrderItems(
                  product: product[index],
                  orderId: orderId,
                  status: statu,
                  width: width,
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
              itemCount: product.length),
        ],
      ),
    );
  }
}

class OrderItems extends StatelessWidget {
  const OrderItems({Key? key,required this.orderId, required this.product,required this.status, required this.width})
      : super(key: key);

  final Product product;
  final Status status;
  final double width;
  final String orderId;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                width: width * 0.04,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      product.productName!,
                      maxLines: 2,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: width * 0.04),
                    ),
                    SizedBox(
                      height: width * 0.02,
                    ),
                    Text(
                      product.storeName!,
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontWeight: FontWeight.w900, color: Colors.grey),
                    ),
                    SizedBox(
                      height: width * 0.02,
                    ),
                    Text(
                      product.priceWithTax!,
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: width * 0.02,
          ),
          Row(
            children: [
              product.isReturn! == 1
                  ? Expanded(
                      child: ElevatedButton(
                          onPressed: (){
                            Get.to(ReturnOrderScreen(order_id: orderId, status: status,product: product,data: "",));
                          }, child: const Text("Return")))
                  : Container(),
              SizedBox(
                width: width * 0.02,
              ),
              product.isCancel! == 1
                  ? Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                           var response= ApiService().cancelOrder(orderId: orderId, productId: product.productId!, sellerId: status.sellerId!).then((value){
                             if(value['error'] == null){
                               AwesomeDialog(
                                 context: context,
                                 dialogType: DialogType.success,
                                 animType: AnimType.rightSlide,
                                 title: 'Congratulation',
                                 desc: 'Your Order Successfully Cancel',
                                 btnOkColor: Colors.blue.shade900,
                                 btnOkOnPress: ()=>Navigator.of(context)..pop(),
                               ).show();
                             }
                           });
                          }, child: const Text("Cancel")))
                  : Container(),
            ],
          ),
          //SizedBox(height: width * 0.02,),
          Row(
            children: [
              product.isProductReview == 1
                  ? Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                                Get.to(ProductReviewScreen(order_id: orderId, status: status,title: "Product Review",product: product!,));
                            },
                          child: const Text("Product Review")))
                  : Container(),
              SizedBox(
                width: width * 0.02,
              ),
              product.isTraking! == 1
                  ? Expanded(
                      child: ElevatedButton(
                          onPressed: ()=>Get.to(TrackScreen(orderId: orderId, sellerId: status.sellerId!, productId: product.productId!))
                              , child: const Text("Track")))
                  : Container(),
            ],
          ),
          Row(
            children: [
              product.isSellerReview == 1
                  ? Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            Get.to(SellerReviewScreen(order_id: orderId, status: status,title: "Seller Review",product: product!,));
                          }, child: const Text("Seller Review")))
                  : Container(),
              SizedBox(
                width: width * 0.02,
              ),
              product.isReturnTraking! == 1
                  ? Expanded(
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text("Return Track")))
                  : Container(),
            ],
          ),
          product.invoice!.isEmpty
              ? Container()
              : ElevatedButton(
                  onPressed: () => _launchUrl(product.invoice!),
                  child:const Text("Invoice")),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String _url) async {
    if (!await launchUrl(Uri.parse(_url))) {
      throw 'Could not launch $_url';
    }
  }
}
