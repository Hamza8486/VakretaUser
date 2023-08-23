import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vkreta/custom_widgets/widgets.dart';
import 'package:vkreta/getx_controllers/trackOrderController.dart';
import 'package:vkreta/models/TrackOrderModel.dart';
import 'package:vkreta/services/apiservice.dart';
import 'package:intl/intl.dart';
import 'package:vkreta/view/home/controller/home_controller.dart';

class NewReturnTrackScreen extends StatefulWidget {

  const NewReturnTrackScreen({Key? key}) : super(key: key);

  @override
  State<NewReturnTrackScreen> createState() => _NewReturnTrackScreenState();
}

class _NewReturnTrackScreenState extends State<NewReturnTrackScreen> {
  var time=DateFormat("dd-MM-yyyy");

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon:const Icon(Icons.arrow_back_ios),onPressed: ()=>Navigator.pop(context),),
        title:const Text("Return Track Order"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04,vertical:  width * 0.04),
          child:


          Obx(
                  () {
                return
                  Get.put(HomeController()).returnNewLoading.value?loader(height: Get.height*0.35):
                  Get.put(HomeController()).returnNewList.isNotEmpty?
                  Column(
                    children: [
                      // Container(
                      //   width: Get.width,
                      //   decoration: BoxDecoration(
                      //       border: Border.all(color: Colors.grey.withOpacity(0.5)),
                      //       borderRadius: BorderRadius.circular(7)),
                      //   child: Padding(
                      //     padding: const EdgeInsets.symmetric(horizontal: 16),
                      //     child: Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         SizedBox(height: Get.height*0.01,),
                      //         Text("Reason",style: TextStyle(fontWeight: FontWeight.w600,fontSize: width * 0.038,
                      //             color: Colors.black.withOpacity(0.5)
                      //         ),),
                      //         SizedBox(height: Get.height*0.008,),
                      //         Text(
                      //
                      //
                      //           Get.put(HomeController()).reason.value,style: TextStyle(fontSize: width * 0.04,
                      //             fontWeight: FontWeight.w600),),
                      //         SizedBox(height: Get.height*0.02,),
                      //         Text("Status",style: TextStyle(fontWeight: FontWeight.w600,fontSize: width * 0.038,
                      //             color: Colors.black.withOpacity(0.5)
                      //         ),),
                      //         SizedBox(height: Get.height*0.01,),
                      //         Text(Get.put(HomeController()).status.value,style: TextStyle(fontSize: width * 0.04,
                      //             fontWeight: FontWeight.w600
                      //         ),),
                      //         SizedBox(height: Get.height*0.01,),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(height: Get.height*0.02,),
                      ListView.builder(
                        itemCount:  Get.put(HomeController()).returnNewList.length,
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (BuildContext context, int i) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(

                                      color:

                                      Get.put(HomeController()).returnNewList[i].active==1?
                                      Colors.blue:Colors.grey.withOpacity(0.5),
                                    width:
                                    Get.put(HomeController()).returnNewList[i].active==1?
                                    2:1

                                  ),
                                  borderRadius: BorderRadius.circular(7)
                              ),
                              child: ListTile(
                                title: Text(Get.put(HomeController()).returnNewList[i].name.toString()??""),
                                subtitle: Text(Get.put(HomeController()).returnNewList[i].description??""),
                                trailing: Text(Get.put(HomeController()).returnNewList[i].dateAdded??"",),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
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
                    );




              }
          ),
        ),
      ),
    );
  }
}

//
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Container(
// decoration: BoxDecoration(
// border: Border.all(color: Colors.grey.withOpacity(0.5)),
// borderRadius: BorderRadius.circular(7)),
// child: Padding(
// padding: const EdgeInsets.symmetric(horizontal: 16),
// child: Column(
// children: [
// SizedBox(height: Get.height*0.01,),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Expanded(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text("Courier",style: TextStyle(fontWeight: FontWeight.w600,fontSize: width * 0.038,
// color: Colors.black.withOpacity(0.5)
// ),),
// SizedBox(height: Get.height*0.008,),
// Text(track.track.value.courier??"",style: TextStyle(fontSize: width * 0.04,
// fontWeight: FontWeight.w600),),
// ],
// ),
//
// ],
// ),
// SizedBox(height: Get.height*0.02,),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Expanded(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text("Order ID",style: TextStyle(fontWeight: FontWeight.w600,fontSize: width * 0.038,
// color: Colors.black.withOpacity(0.5)
// ),),
// SizedBox(height: Get.height*0.01,),
// Text(track.track.value.orderId??"",style: TextStyle(fontSize: width * 0.04,
// fontWeight: FontWeight.w600
// ),),
// ],
// ),
// ),
// Expanded(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text("Order Place On",style: TextStyle(fontWeight: FontWeight.w600,fontSize: width * 0.038,
// color: Colors.black.withOpacity(0.5)
// ),),
// SizedBox(height: Get.height*0.01,),
// Text(track.track.value.orderAdded.toString().split(" ").first,style: TextStyle(fontSize: width * 0.04,
// fontWeight: FontWeight.w600),),
// ],
// ),
// ),
// ],
// ),
// SizedBox(height: Get.height*0.01,),
// ],
// ),
// ),
// ),
// SizedBox(height: Get.height*0.02,),
//
// Container(
// decoration: BoxDecoration(
// border: Border.all(color: Colors.grey.withOpacity(0.5)),
// borderRadius: BorderRadius.circular(7)
// ),
// child:ListView.separated(
// shrinkWrap: true,
// primary: false,
//
// itemBuilder: (context,index){
// return ListTile(
//
//
// title: Text(track.track.value.history?[index].name??""),
// subtitle: Text(track.track.value.history?[index].description??""),
// trailing: Text(track.track.value.history?[index].date??"",),
// );
// }, separatorBuilder: (context,index){
// return SizedBox(height: width * 0.0,);
// }, itemCount:
// track.track.value.history==null?nameList.length:
// track.track.value.history!.length) ,
// ),
//
// SizedBox(height: Get.height*0.025,),
//
//
// Text(
// "Detailed Journey",
// textAlign: TextAlign.start,
// style: TextStyle(color: Colors.black,
// fontWeight: FontWeight.bold,fontSize: width * 0.05
//
// ),
// ),
// SizedBox(height: Get.height*0.015,),
// track.track.value.journey==null?SizedBox.shrink():
// track.track.value.journey!.isNotEmpty?
// ListView.builder(
// itemCount: track.track.value.journey?.length,
// shrinkWrap: true,
// primary: false,
// itemBuilder: (BuildContext context, int i) {
// return Padding(
// padding: const EdgeInsets.symmetric(vertical: 10),
// child: Container(
// decoration: BoxDecoration(
// border: Border.all(color: Colors.grey.withOpacity(0.5)),
// borderRadius: BorderRadius.circular(7)
// ),
// child: ListTile(
// title: Text(track.track.value.journey?[i].date.toString()??""),
// subtitle: Text(track.track.value.journey?[i].location??""),
// trailing: Text(track.track.value.journey?[i].status??""),
// ),
// ),
// );
// },
// ):   Padding(
// padding: const EdgeInsets.only(top: 20),
// child: Center(
// child: Text(
// "No Data",
// textAlign: TextAlign.start,
// style: TextStyle(color: Colors.black,
// fontWeight: FontWeight.w500,fontSize: width * 0.037
//
// ),
// ),
// ),
// ),
// ],
// );