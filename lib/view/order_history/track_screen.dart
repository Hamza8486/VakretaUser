import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vkreta/custom_widgets/widgets.dart';
import 'package:vkreta/getx_controllers/trackOrderController.dart';
import 'package:vkreta/models/TrackOrderModel.dart';
import 'package:vkreta/services/apiservice.dart';
import 'package:intl/intl.dart';

class TrackScreen extends StatefulWidget {
  final String orderId;
  final String productId;
  final String sellerId;
  const TrackScreen({required this.orderId,required this.sellerId,required this.productId,Key? key}) : super(key: key);

  @override
  State<TrackScreen> createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {
  var time=DateFormat("dd-MM-yyyy");
  final TrackOrderController track=Get.put(TrackOrderController());
  getTrack()async{
    var response=ApiService().getOrderTrack(orderId: widget.orderId, productId: widget.productId, sellerId:widget.sellerId).then((value){
      track.track.value=TrackOrderModel.fromJson(value);
      setState(() {});
    });

  }

  List nameList = [];
  @override
  void initState() {
    getTrack();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon:const Icon(Icons.arrow_back_ios),onPressed: ()=>Navigator.pop(context),),
        title:const Text("Track Order"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04,vertical:  width * 0.04),
          child:


          Obx(
            () {
              return
                track.track.value.history==null?loader(height: Get.height*0.35):
                Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(7)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            SizedBox(height: Get.height*0.01,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Courier",style: TextStyle(fontWeight: FontWeight.w600,fontSize: width * 0.038,
                                      color: Colors.black.withOpacity(0.5)
                                      ),),
                                      SizedBox(height: Get.height*0.008,),
                                      Text(track.track.value.courier??"",style: TextStyle(fontSize: width * 0.04,
                                          fontWeight: FontWeight.w600),),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Tracking ID",style: TextStyle(fontWeight: FontWeight.w600,fontSize: width * 0.038,
                                          color: Colors.black.withOpacity(0.5)
                                      ),),
                                      SizedBox(height: Get.height*0.02,),
                                      Text(track.track.value.trakingNum.toString()??"",style: TextStyle(fontSize: width * 0.04,
                                          fontWeight: FontWeight.w600),),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: Get.height*0.02,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Order ID",style: TextStyle(fontWeight: FontWeight.w600,fontSize: width * 0.038,
                                          color: Colors.black.withOpacity(0.5)
                                      ),),
                                      SizedBox(height: Get.height*0.01,),
                                      Text(track.track.value.orderId??"",style: TextStyle(fontSize: width * 0.04,
                                          fontWeight: FontWeight.w600
                                      ),),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Order Place On",style: TextStyle(fontWeight: FontWeight.w600,fontSize: width * 0.038,
                                          color: Colors.black.withOpacity(0.5)
                                      ),),
                                      SizedBox(height: Get.height*0.01,),
                                      Text(track.track.value.orderAdded.toString().split(" ").first,style: TextStyle(fontSize: width * 0.04,
                                          fontWeight: FontWeight.w600),),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: Get.height*0.01,),
                          ],
                        ),
                      ),
                    ),
                  SizedBox(height: Get.height*0.02,),

                  ListView.separated(
                      shrinkWrap: true,
                      primary: false,

                      itemBuilder: (context,index){
                    return Padding(
                      padding:  EdgeInsets.symmetric(vertical: 5),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color:
                            track.track.value.history?[index].active==1?
                            Colors.blue: Colors.grey,
                            width: 2
                            ),

                            borderRadius: BorderRadius.circular(7)
                        ),
                        child: ListTile(


                          title: Text(track.track.value.history?[index].name??""),
                          subtitle: Text(track.track.value.history?[index].description??""),
                          trailing: Text(track.track.value.history?[index].date??"",),
                        ),
                      ),
                    );
                  }, separatorBuilder: (context,index){
                    return SizedBox(height: width * 0.0,);
                  }, itemCount:
                  track.track.value.history==null?nameList.length:
                  track.track.value.history!.length),

                  SizedBox(height: Get.height*0.025,),


                  Text(
                    "Detailed Journey",
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.black,
                        fontWeight: FontWeight.bold,fontSize: width * 0.05

                    ),
                  ),
                  SizedBox(height: Get.height*0.015,),
                  track.track.value.journey==null?SizedBox.shrink():
                  track.track.value.journey!.isNotEmpty?
                  ListView.builder(
                    itemCount: track.track.value.journey?.length,
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (BuildContext context, int i) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.withOpacity(0.5)),
                              borderRadius: BorderRadius.circular(7)
                          ),
                          child: ListTile(
                            title: Text(track.track.value.journey?[i].date.toString()??""),
                            subtitle: Text(track.track.value.journey?[i].location??""),
                            trailing: Text(track.track.value.journey?[i].status??""),
                          ),
                        ),
                      );
                    },
                  ):   Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Center(
                      child: Text(
                        "No Data",
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.black,
                            fontWeight: FontWeight.w500,fontSize: width * 0.037

                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
