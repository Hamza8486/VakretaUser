import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vkreta/custom_widgets/widgets.dart';
import 'package:vkreta/view/home/controller/home_controller.dart';

import '../../controllers/theme.dart';

class AllReviews extends StatefulWidget {
  const AllReviews({Key? key}) : super(key: key);

  @override
  State<AllReviews> createState() => _AllReviewsState();
}

class _AllReviewsState extends State<AllReviews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back, color: Colors.black, size: 25)),
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          'Poduct Reviews',
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Colors.grey.shade900,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [

                const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  height: 1,
                  color: Colors.grey.shade300,
                ),
              ),
              const SizedBox(
                height: 10,
              ),


              Obx(
                () {
                  return
                    Get.put(HomeController()).isReviewLoading.value?loader():


                    Get.put(HomeController()).reviewList.isNotEmpty?


                    ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      primary: false,
                      itemCount: Get.put(HomeController()).reviewList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              Get.put(HomeController()).reviewList[index].author??"",


                                              style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    color: Colors.black,

                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold),

                                              ),
                                              textAlign: TextAlign.left,
                                            ),

                                          ],
                                        ),




                                      ],
                                    ),
                                    Text(
                                      Get.put(HomeController()).reviewList[index].dateAdded??"",
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              color: Colors.black, fontSize: 13)),
                                    ),


                                  ],
                                ),
                              ),
                              Get.put(HomeController()).reviewList[index].text==""?const SizedBox.shrink():
                              SizedBox(height:Get.height*0.015),
                              Get.put(HomeController()).reviewList[index].text==""?const SizedBox.shrink():
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  Get.put(HomeController()).reviewList[index].text??"",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: Colors.grey.shade700,
                                        fontSize: 12,
                                      )),
                                ),
                              ),
                              SizedBox(height:Get.height*0.01),
                              Get.put(HomeController()).reviewList[index].images!=null?
                              SizedBox(
                                height:Get.height*0.14,
                                child: ListView.builder(

                                    itemCount: Get.put(HomeController()).reviewList[index].images?.length,
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.horizontal,



                                    itemBuilder: (BuildContext context, int i) {
                                      return Container(
                                        margin: EdgeInsets.symmetric(horizontal: 7),
                                        height: Get.height*0.12,
                                        width: Get.height*0.12,
                                        decoration: BoxDecoration(
                                            color: AppColor.whiteColor,
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(color: AppColor.boldBlackColor.withOpacity(0.1))
                                        ),
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: Image.network( Get.put(HomeController()).reviewList[index].images?[i].thumb??"",
                                              fit: BoxFit.cover,
                                            )),
                                      );
                                    }),
                              ):SizedBox.shrink(),


                              SizedBox(height:Get.height*0.01),
                              Get.put(HomeController()).reviewList[index].rating==0?
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 15,
                                ),
                              ):

                              Get.put(HomeController()).reviewList[index].rating==1?
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                      size: 15,
                                    ),

                                  ],
                                ),
                              ):
                              Get.put(HomeController()).reviewList[index].rating==2?
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                      size: 15,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                      size: 15,
                                    ),
                                  ],
                                ),
                              ):

                              Get.put(HomeController()).reviewList[index].rating==3?
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                      size: 15,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                      size: 15,
                                    ),

                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                      size: 15,
                                    ),
                                  ],
                                ),
                              ):


                              Get.put(HomeController()).reviewList[index].rating==4?
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                      size: 15,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                      size: 15,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                      size: 15,
                                    ),

                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                      size: 15,
                                    ),
                                  ],
                                ),
                              ):


                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                      size: 15,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                      size: 15,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                      size: 15,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                      size: 15,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                      size: 15,
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(
                                height: 10,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Divider(
                                  height: 1,
                                  color: Colors.grey,
                                ),
                              ),

                            ],
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
      ),
    );
  }
}
