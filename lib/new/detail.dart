import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vkreta/controllers/app_button.dart';
import 'package:vkreta/new/new_track.dart';
import 'package:vkreta/services/apiservice.dart';
import 'package:vkreta/view/home/controller/home_controller.dart';
import 'package:vkreta/view/order_history/ReturnOrderScreen.dart';
import 'package:vkreta/view/order_history/track_screen.dart';
import 'package:vkreta/view/review/seller_review_Screen.dart';

class DetailView extends StatefulWidget {

   DetailView({Key? key,this.data}) : super(key: key);

  var data;

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        leading: IconButton(icon:const Icon(Icons.arrow_back_ios,
        color: Colors.black,
        ),onPressed: ()=>Navigator.pop(context),),
        title:const Text("Order Detail",style: TextStyle(
          color: Colors.black,
        ),),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: Get.width*0.04,vertical: Get.height*0.02),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: Get.height*0.01,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Order Date",style: TextStyle(fontWeight: FontWeight.w500,fontSize: width * 0.04,
                        color: Colors.grey
                        ),),
                        Text(widget.data.dateAdded,style: TextStyle(fontSize: width * 0.04),),
                      ],
                    ),
                    SizedBox(height: Get.height*0.015,),
                    const Divider(color: Colors.grey,),
                    SizedBox(height: Get.height*0.005,),

                    ListView.builder(
                        itemCount: widget.data.status.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        primary: false,
                        itemBuilder: (BuildContext context, int index) {
                          return  Column(
                            children: [
                              ListView.builder(
                                  itemCount: widget.data.status[index].product.length,
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  itemBuilder: (BuildContext context, int i) {

                                    double total =double.parse(widget.data.status[index].product[i].quantity.toString())* double.parse(widget.data.status[index].product[i].price.toString()) ;
                                    return   Padding(
                                      padding:  EdgeInsets.symmetric(vertical: Get.height*0.01),
                                      child: Card(
                                        margin: EdgeInsets.zero,
                                        color: Colors.white,
                                        shadowColor: Colors.grey.withOpacity(0.9),
                                        elevation: 2,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
                                            side: BorderSide(color: Colors.grey.withOpacity(0.5))
                                        ),
                                        child: Padding(
                                          padding:  EdgeInsets.symmetric(horizontal:Get.width*0.04,vertical: 12 ),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: Get.height * 0.005,
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(

                                                    widget.data.status[index].product[i].status==null?"":widget.data.status[index].product[i].status,
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
                                              Row(
                                                children: [
                                                  Image.network(
                                                    widget.data.status[index].product[i].thumb,
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
                                                          widget.data.status[index].product[i].productName??"",
                                                          maxLines: 2,
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.w700, fontSize: width * 0.04),
                                                        ),
                                                        SizedBox(
                                                          height: width * 0.02,
                                                        ),
                                                        Text(widget.data.status[index].product[i].storeName==null?"":
                                                          widget.data.status[index].product[i].storeName,
                                                          maxLines: 2,
                                                          textAlign: TextAlign.start,
                                                          style: const TextStyle(
                                                              fontWeight: FontWeight.w600, color: Colors.grey),
                                                        ),
                                                        SizedBox(
                                                          height: width * 0.02,
                                                        ),
                                                        Text(
                                                          widget.data.status[index].product[i].price==null?"":
                                                              "₹${widget.data.status[index].product[i].price.toString().split(".").first} * ${widget.data.status[index].product[i].quantity} qty"
                                                          ,
                                                          maxLines: 2,
                                                          textAlign: TextAlign.start,
                                                          style: const TextStyle(
                                                            fontWeight: FontWeight.w600,
                                                          ),
                                                        ),

                                                      ],
                                                    ),
                                                  )
                                                ],
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
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                    "₹${total.toStringAsFixed(0)}",
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(color: Colors.black,
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: Get.height*0.017

                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: Get.height * 0.01,
                                              ),
                                              SizedBox(
                                                height: Get.height * 0.01,
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    "Payment Method",
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(color: Colors.black,
                                                        fontWeight: FontWeight.w700,
                                                        fontSize: Get.height*0.017

                                                    ),
                                                  ),
                                                  SizedBox(height: 3,),
                                                  Text(
                                                    widget.data.paymentCode=="cod"?"Cash On Delivery":"Online Payment",
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(color: Colors.black,
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: Get.height*0.017

                                                    ),
                                                  ),
                                                ],
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

                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      children: [
                                                        widget.data.status[index].product[i].isReturn==1?
                                                        Padding(
                                                          padding: const EdgeInsets.symmetric(vertical: 6),
                                                          child: AppButton(


                                                            onTap:
                                                           (){
                                                              setState(() {
                                                                isReturnAllLoading=false;
                                                              });
                                                              Get.put(HomeController()).updateLoading(false);
                                                              Get.put(HomeController()).retuenData(order:widget.data.orderId.toString(),product: widget.data.status[index].product[i].productId.toString() );
                                                             Get.to(ReturnOrderScreen(order_id: widget.data.orderId, status: widget.data.status[index],product: widget.data.status[index].product[i],data: widget.data,
                                                             qty:widget.data.status[index].product[i].quantity.toString() ,
                                                             ));


                                                          },textColor: Colors.red,buttonColor: Colors.white,
                                                            buttonRadius: BorderRadius.circular(10),
                                                            borderWidth: 1.5,
                                                            buttonHeight: Get.height*0.05,
                                                            buttonWidth: Get.width,
                                                            borderColor: Colors.red, buttonName:


                                                            'Return Order',
                                                          ),
                                                        ):SizedBox.shrink(),
                                                        widget.data.status[index].product[i].isCancel==1?
                                                        AppButton(


                                                          onTap:
                                                          (){

                                                            var response= ApiService().cancelOrder(orderId: widget.data.orderId, productId: widget.data.status[index].product[i].productId!, sellerId: widget.data.status[index].sellerId!).then((value){
                                                              if(value['error'] == null){
                                                                ApiService().Orderlist();
                                                                AwesomeDialog(
                                                                  context: context,
                                                                  dialogType: DialogType.success,
                                                                  animType: AnimType.rightSlide,
                                                                  title: 'Congratulation',
                                                                  desc: 'Your Order Successfully Cancel',
                                                                  btnOkColor: Colors.blue.shade900,
                                                                  btnOkOnPress: (){
                                                                    ApiService().Orderlist();
                                                                    Navigator.pop(context);
                                                                    Navigator.pop(context);
                                                                  },
                                                                ).show();
                                                              }
                                                            });

                                                          },textColor: Colors.red,buttonColor: Colors.white,
                                                          buttonRadius: BorderRadius.circular(10),
                                                          borderWidth: 1.5,
                                                          buttonHeight: Get.height*0.05,
                                                          buttonWidth: Get.width,
                                                          borderColor: Colors.red, buttonName:

                                                     "Cancel Order",
                                                        ):SizedBox.shrink(),
                                                      ],
                                                    ),
                                                  ),


                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(left: 40),
                                                      child: Column(
                                                        children: [
                                                          widget.data.status[index].product[i].isSellerReview==1?
                                                          AppButton(onTap:
                                                        (){
                                                          Get.to(SellerReviewScreen(order_id: widget.data.orderId, status:widget.data.status[index],title: "Seller Review",product: widget.data.status[index].product[i],));
                                                          },textColor: Colors.white,buttonColor: Colors.blue.shade900,
                                                            buttonRadius: BorderRadius.circular(10),
                                                            borderWidth: 2,
                                                            buttonHeight: Get.height*0.05,
                                                            buttonWidth: Get.width,
                                                            borderColor: Colors.white, buttonName:

                                                            'Rate Seller',
                                                          ):SizedBox.shrink(),

                                                          widget.data.status[index].product[i].isTraking==1?
                                                          AppButton(onTap:
                                                         (){
                                                            Get.to(TrackScreen(orderId: widget.data.orderId, sellerId: widget.data.status[index].sellerId!, productId: widget.data.status[index].product[i].productId!));
                                                          },textColor: Colors.white,buttonColor: Colors.blue.shade900,
                                                            buttonRadius: BorderRadius.circular(10),
                                                            borderWidth: 2,
                                                            buttonHeight: Get.height*0.05,
                                                            buttonWidth: Get.width,
                                                            borderColor: Colors.white, buttonName:

                                                            "Track Order",
                                                          ):SizedBox.shrink(),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              widget.data.status[index].product[i].invoice==""?SizedBox.shrink():
                                              SizedBox(
                                                height: Get.height * 0.02,
                                              ),
                                              widget.data.status[index].product[i].invoice==""?SizedBox.shrink():
                                              AppButton(


                                                onTap:
                                                    (){
                                                      launch(widget.data.status[index].product[i].invoice);


                                                },textColor: Colors.white,buttonColor: Colors.blue.shade900,
                                                buttonRadius: BorderRadius.circular(10),
                                                borderWidth: 2,
                                                buttonHeight: Get.height*0.05,
                                                buttonWidth: Get.width,
                                                borderColor: Colors.white, buttonName:


                                              'Invoice Download',
                                              ),
                                              widget.data.status[index].product[i].isProductReview==1?
                                              SizedBox(
                                                height: Get.height * 0.02,
                                              ):SizedBox.shrink(),
                                              widget.data.status[index].product[i].isProductReview==1?

                                              AppButton(


                                                onTap:
                                                    (){
                                                      Get.to(ProductReviewScreen(order_id: widget.data.orderId, status: widget.data.status[index],title: "Product Review",product: widget.data.status[index].product[i],));



                                                    },textColor: Colors.white,buttonColor: Colors.blue.shade900,
                                                buttonRadius: BorderRadius.circular(10),
                                                borderWidth: 2,
                                                buttonHeight: Get.height*0.05,
                                                buttonWidth: Get.width,
                                                borderColor: Colors.white, buttonName:


                                              'Product Review',
                                              ):SizedBox.shrink(),










                                              widget.data.status[index].product[i].isReturnTraking==1?
                                              SizedBox(
                                                height: Get.height * 0.02,
                                              ):SizedBox.shrink(),
                                              widget.data.status[index].product[i].isReturnTraking==1?

                                              AppButton(


                                                onTap:
                                                    (){


                                                  Get.put(HomeController()).returnNewTrackData(sellerId:widget.data.status[index].sellerId.toString(),productId: widget.data.status[index].product[i].productId.toString(),rId: "1");

                                                  print(widget.data.status[index].sellerId.toString());
                                                  print(widget.data.status[index].product[i].productId.toString());
                                                  print(widget.data.status[index].sellerId.toString());

                                                  Get.to(NewReturnTrackScreen(),
                                                  transition: Transition.rightToLeft
                                                  );



                                                },textColor: Colors.white,buttonColor: Colors.blue.shade900,
                                                buttonRadius: BorderRadius.circular(10),
                                                borderWidth: 2,
                                                buttonHeight: Get.height*0.05,
                                                buttonWidth: Get.width,
                                                borderColor: Colors.white, buttonName:


                                              'Return Tracking View',
                                              ):SizedBox.shrink()
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),


                              SizedBox(height: Get.height*0.01,),
                              Card(
                                margin: EdgeInsets.zero,
                                color: Colors.white,
                                shadowColor: Colors.grey.withOpacity(0.9),
                                elevation: 2,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(color: Colors.grey.withOpacity(0.5))
                                ),
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(horizontal:Get.width*0.04,vertical: 12 ),

                                  child: ListView.builder(
                                      itemCount: widget.data.status[index].totalsInfo.length,
                                      shrinkWrap: true,
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      itemBuilder: (BuildContext context, int i) {
                                        return  SizedBox(
                                          width: Get.width,

                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 5),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [

                                                  SizedBox(
                                                    height: Get.height * 0.01,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        widget.data.status[index].totalsInfo[i].title.toString(),
                                                        textAlign: TextAlign.start,
                                                        style: TextStyle(color: Colors.grey,
                                                            fontWeight: FontWeight.w600,
                                                            fontSize: Get.height*0.017

                                                        ),
                                                      ),
                                                      Text(
                                                        widget.data.status[index].totalsInfo[i].value.toString(),
                                                        textAlign: TextAlign.start,
                                                        style: TextStyle(color: Colors.black,
                                                            fontWeight: FontWeight.w700,
                                                            fontSize: Get.height*0.017

                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),

                                        );
                                      }),
                                ),
                              ),


                            ],
                          );
                        }),


                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
