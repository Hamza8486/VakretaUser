import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vkreta/controllers/categoryController.dart';
import 'package:vkreta/custom_widgets/widgets.dart';
import 'package:vkreta/view/filter/fliter_screen.dart';
import 'package:vkreta/getx_controllers/homepage.dart';
import 'package:vkreta/models/productsearchModel.dart';
import 'package:vkreta/models/searchModel.dart';
import 'package:vkreta/view/product/productdisplay.dart';
import 'package:vkreta/services/apiservice.dart';

import '../home/controller/home_controller.dart';
import '../notification/allnotifications.dart';

class ShowFilterResults extends StatefulWidget {
  final String min;
  final String max;
  final String brand;
  final String discount;
  final String rating;
  ShowFilterResults({required this.min,required this.max,required this.rating,required this.discount,required this.brand});

  @override
  State<ShowFilterResults> createState() => _ShowFilterResultsState();
}

class _ShowFilterResultsState extends State<ShowFilterResults> {
  final homeController=Get.put(HomeController());

  bool isLoading=false;
  final  ScrollController _controller=ScrollController();


  int page=1;

  pageListener(){
    if(_controller.position.pixels==_controller.position.maxScrollExtent){
      setState(() {
        page=page+1;
      });
      homeController.getFilterData(discount: widget.discount.toString(),
      rat: widget.rating.toString(),
        brand: widget.brand.toString(),
        page: page.toString()
      );
    }else{
      print("error");
    }
  }

  @override
  void initState() {
    homeController.getFilterData(discount: widget.discount.toString(),
        rat: widget.rating.toString(),
        brand: widget.brand.toString(),
        page: page.toString()
    );
    _controller.addListener(pageListener);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading:  GestureDetector(
          onTap: (){
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios_outlined,color: Colors.black,
            size: Get.height*0.03,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          'Filter Results',
          style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 16)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: Get.width * 0.04),
              child: Obx(
              () {
                  return
                homeController.isFilterLoading.value?loader(height: Get.height*0.35):
                    homeController.filterGetList.isNotEmpty?
                GridView.builder(
                    shrinkWrap: true,
                    controller: _controller,
                    itemCount: homeController.filterGetList.length,
                    physics: BouncingScrollPhysics(),

                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: Get.width * 0.04,
                      mainAxisSpacing: Get.width * 0.04,
                      childAspectRatio: 0.75,


                      crossAxisCount: 2,),
                    itemBuilder: (context, index) {

                      return  Obx(
                              () {
                            return


                              Padding(
                                padding: EdgeInsets.symmetric(vertical:Get.width * 0.01),
                                child: Container(
                                  height:homeController.filterGetList.isNotEmpty?Get.width * 0.5: Get.width * 0.5,
                                  color: Colors.white,
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  child:
                                  InkWell(
                                    onTap: (){
                                      Get.put(HomeController()).clearValueAll();
                                      Get.put(CategoryController()).updateText("");
                                      Get.put(CategoryController()).updateCode("");
                                      Get.put(HomeController()).clearValueAll();
                                      Get.put(CategoryController()).updateText("");
                                      Get.put(CategoryController()).updateCode("");

                                      Get.put(HomeController()).updateKeyId("");
                                      Get.put(HomeController()).updateKeyId1("");
                                      Get.put(HomeController()).updateMainId("");
                                      Get.put(HomeController()).updateMainId1("");
                                      setState(() {
                                        prices="null";
                                        textPrice=null;
                                        textName=null;
                                      });
                                      Navigator.of(context).push(PageRouteBuilder(
                                          transitionDuration:const Duration(seconds: 1),
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
                                            return  ProductDisplay(int.parse(homeController.filterGetList[index].productId!));
                                          }));
                                    },
                                    child: Container(
                                      height: Get.width * 0.55,
                                      width: Get.width * 0.4,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(color: Colors.grey.withOpacity(0.5)),
                                        borderRadius: BorderRadius.circular(7),
                                        // boxShadow: const [
                                        //   BoxShadow(
                                        //       color: Colors.grey,
                                        //       spreadRadius: 1,
                                        //       blurRadius: 2,
                                        //       offset: Offset(-2, 5))
                                        // ]
                                      ),
                                      child: Stack(
                                          children: [
                                            Column(
                                              children: [
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Container(
                                                  height: Get.width * 0.36,
                                                  width: Get.width * 0.4,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(20)),
                                                  child: Padding(
                                                    padding: EdgeInsets.all(Get.width * 0.02),
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(7),
                                                      child: Image.network(homeController.filterGetList[index].thumb!.toString()==null?"https://dfdsf":homeController.filterGetList[index].thumb??"",
                                                        fit: BoxFit.fill,
                                                        errorBuilder: (context,object,straeTree){
                                                          return Icon(Icons.image,color: Colors.grey,size:Get.width * 0.06,);
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  EdgeInsets.symmetric(horizontal: Get.width * 0.02),
                                                  child: Text(
                                                    homeController.filterGetList[index].name!,
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                            color: Colors.grey.shade900,
                                                            fontSize: Get.width * 0.03)),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: Get.width * 0.01,
                                                ),
                                                Padding(
                                                  padding:
                                                  EdgeInsets.symmetric(horizontal: Get.width * 0.01),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        homeController.filterGetList[index].price!,
                                                        style: GoogleFonts.poppins(
                                                            textStyle: TextStyle(
                                                                color: Colors.black,
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: Get.width * 0.035)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: Get.width * 0.01,
                                                ),
                                              ],
                                            ),
                                            // Padding(
                                            //   padding: EdgeInsets.all(widget.width * 0.01),
                                            //   child: Row(children: [
                                            //     Container(
                                            //         height: widget.width * 0.12,
                                            //         width: widget.width * 0.1,
                                            //         decoration:const BoxDecoration(
                                            //             color: Colors.red,
                                            //             borderRadius: BorderRadius.only(
                                            //                 bottomRight: Radius.circular(20))),
                                            //         child: Center(
                                            //           child: Text(
                                            //             widget.product![0].special!,
                                            //             style: GoogleFonts.poppins(
                                            //                 textStyle: TextStyle(
                                            //                     color: Colors.white, fontSize: widget.width * 0.03)),
                                            //           ),
                                            //         ))
                                            //   ]),
                                            // ),
                                          ]
                                      ),
                                    ),
                                  ),
                                ),
                              );
                          }
                      );
                    }):

                    Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: Get.width * 0.02,vertical: 350),
                      child: Center(
                        child: Text(
                          "No Data",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.grey.shade900,
                                  fontSize: Get.width * 0.036)),
                        ),
                      ),
                    )
                  ;


                }
              ),
            )

          ],
        ),
      ),
    );
  }
}
