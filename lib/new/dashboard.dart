import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:url_launcher/url_launcher.dart';
import 'package:vkreta/controllers/app_button.dart';
import 'package:vkreta/controllers/categoryController.dart';
import 'package:vkreta/custom_widgets/social_button.dart';
import 'package:vkreta/custom_widgets/widgets.dart';
import 'package:vkreta/services/apiservice.dart';
import 'package:vkreta/view/home/controller/home_controller.dart';
import 'package:vkreta/view/home/home.dart';
import 'package:vkreta/view/others/about.dart';
import 'package:vkreta/view/product/category_screen.dart';
import 'package:vkreta/view/product/productdisplay.dart';
import 'package:vkreta/view/product/search_screen.dart';
import 'package:vkreta/view/product/viewall.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  launchWhatsApp(phone) async {
    final link =
    WhatsAppUnilink(phoneNumber: phone, text: "Hey! I'm looking ?");
    await launch('$link');
  }

  String phoneNumber = '';
  _launchURL({urlValue = ""}) async {
    var url = urlValue;
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
  String address = "Searching";
  TextEditingController postalCode = TextEditingController();
  final catController = Get.put(CategoryController());
  final data=Get.put(CategoryController());

  getUserLocation() async {
    //call this async method from whereever you need

    LocationData myLocation;
    String error;
    Location location = Location();
    try {
      myLocation = await location.getLocation();
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'please grant permission';
        print(error);
      }
      if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error = 'permission denied- please enable it from app settings';
        print(error);
      }
    }
    myLocation = await location.getLocation();
    List<geo.Placemark> placemarks = await geo.placemarkFromCoordinates(
        myLocation.latitude!, myLocation.longitude!);
    geo.Placemark place = placemarks[0];
    print(placemarks.toString());


    setState(() {

      address = placemarks[0].country.toString() +
          ", " +
          placemarks[0].locality.toString() +
          ", " +
          placemarks[0].subLocality.toString();
      postalCode.text = placemarks[0].postalCode.toString();
    });
    // var first = addresses.first;
    // print(' ${first.locality}, ${first.adminArea},${first.subLocality}, ${first.subAdminArea},${first.addressLine}, ${first.featureName},${first.thoroughfare}, ${first.subThoroughfare}');
    return place;
  }
  setLoading(bool value) {
    setState(() {
      isLoading = false;
    });
  }
  bool isLoading = false;
  Widget commonBottomSheets({
    BuildContext? context,
    Widget? widget,
  }) {
    return Padding(
      padding:
      EdgeInsets.only(bottom: MediaQuery.of(context!).viewInsets.bottom),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 4,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 18,
            ),
            padding: const EdgeInsets.only(
              // top: ResponsiveFlutter.of(context).moderateScale(5),
              bottom: 20,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: widget!,
          ),
        ],
      ),
    );
  }
  openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => commonBottomSheets(
        context: context,
        widget: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: Get.height*0.02,),
            Container(
              color: Colors.grey.withOpacity(0.1),
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: const Center(
                child: Text(
                  "Enter Postal Code Here",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: Get.height*0.02,),
            //select your address
            Container(
              margin: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(5)),
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/ic_pincode.png",
                    height: 18,
                    width: 18,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Postal CODE",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          "Enter a postal code",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 44,
                                child: TextField(
                                  controller: postalCode,

                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.all(10),

                                  ),
                                ),
                              ),
                            ),


                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: Get.width*0.04),
              child: AppButton(textColor: Colors.white,
              buttonWidth: Get.width,
                buttonRadius: BorderRadius.circular(10),
                buttonColor: Colors.blue.shade900, buttonName: 'Apply Code',
                onTap: (){
                if(postalCode.text.length<5){
                  showErrorToast("Please enter valid postal code");

                }
                else{
                  Get.back();
                  catController.updatePinCodeValue(postalCode.text);
                  catController.getHomeData(pin:postalCode.text );


                }
                },

              ),
            )

          ],
        ),
      ),
    );
  }
  @override
  void initState() {
    getUserLocation();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          launchWhatsApp(phoneNumber);
        },
        child: const Icon(
          Icons.whatsapp,
          size: 35,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Get.height*0.055,),
            Padding(
              padding: EdgeInsets.all(Get.width * 0.04),
              child: SizedBox(
                height: Get.width * 0.12,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const SearchScreen())),
                        child: TextFormField(
                          enabled: false,
                          // controller: _search,
                          textInputAction: TextInputAction.search,
                          onFieldSubmitted: (value) {

                          },
                          decoration: InputDecoration(
                            prefixIcon: InkWell(
                              onTap: () {

                              },
                              child: Icon(
                                Icons.search,
                                color: Colors.grey.shade600,
                                size: 25,
                              ),
                            ),
                            isDense: true,
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Search Product',
                            hintStyle: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            // search field and notification

            // address
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.028),
              child: InkWell(
                onTap: () {
                  openBottomSheet(context);
                },
                child: Container(
                    height: Get.width * 0.14,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(children: [
                      SizedBox(width: Get.width * 0.02),
                      Icon(Icons.room,
                          color: Colors.white, size: Get.width * 0.05),
                      SizedBox(width: Get.width * 0.04),


                      Obx(() {
                          return
                            catController.pinCodeValue.value.isEmpty?

                            Text(
                            address,
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: Get.width * 0.035,
                                )),
                          ):Text(
                              catController.pinCodeValue.value,
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: Get.width * 0.035,
                                  )),
                            );
                        }
                      ),
                    ])),
              ),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
           Obx(
                   () {
                 return
                 catController.isReqLoading.value?loader(
                   height: Get.height * 0.25
                 ):

                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Container(
                       padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                       height: width * 0.32,
                       child: ListView.separated(
                           scrollDirection: Axis.horizontal,
                           itemBuilder: (context, index) {
                             return Obx(
                                     () {
                                   return CategoryButton(
                                       onTap: () {
                                         print(catController.topCatList[index]
                                             .categoryId);

                                         setState(() {
                                           Get.put(HomeController()).updateText("");
                                           Get.put(HomeController()).clearValueAll();
                                           Get.put(HomeController()).subList.clear();
                                           Get.put(CategoryController()).data.value.products?.clear();
                                           Get.put(CategoryController()).data.value.limit=null;
                                         });

                                         Get.put(HomeController()).updateIds(catController.topCatList[index]
                                             .categoryId.toString());
                                         Get.put(HomeController()).subData(search: catController.topCatList[index]
                                             .categoryId,page: 1,
                                             isUpdate: false
                                         );

                                         // Get.put(CategoryController()).data.value.products?.clear();
                                         Navigator.of(context).push(
                                           MaterialPageRoute(
                                               builder: (context) => TopCategoryScreen(
                                                   id: catController.topCatList[index]
                                                       .categoryId)),
                                         );
                                       },
                                       width:catController.topCatList.isNotEmpty?width: width,
                                       list: catController.topCatList[index]);
                                 }
                             );
                           },
                           separatorBuilder: (context, index) {
                             return SizedBox(
                               width: width * 0.04,
                             );
                           },
                           itemCount:
                           catController.topCatList.length),
                     ),

                     Padding(
                       padding: const EdgeInsets.all(10.0),
                       child: Divider(
                         height: 1,
                         color: Colors.grey.shade500,
                       ),
                     ),
                     SizedBox(
                       height: width * 0.02,
                     ),
                     Obx(
                       () {
                         return Padding(
                           padding:  EdgeInsets.symmetric(horizontal: Get.width*0.04),
                           child: ListView.builder(
                               itemCount: catController.productList.length,
                               shrinkWrap: true,
                               padding: EdgeInsets.zero,
                               primary: catController.productList.isNotEmpty?false:false,
                               itemBuilder: (BuildContext context, int index3) {
                                 // catController.productList.sort((a, b) => int.parse(a.sort).compareTo(int.parse(b.sort)));

                                 return

                                   Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: [
                                         Obx(
                                           () {
                                             return Text(
                                               catController.productList[index3].title,
                                               style: GoogleFonts.poppins(
                                                   textStyle: TextStyle(
                                                       color:
                                                       catController.productList.isNotEmpty?Colors.black:
                                                       Colors.black,
                                                       fontSize: Get.width * 0.06,
                                                       fontWeight: FontWeight.bold)),
                                             );
                                           }
                                         ),
                                         GestureDetector(
                                           onTap: (){
                                             Navigator.of(context).push(MaterialPageRoute(
                                                 builder: (context) => ViewAll(
                                                   title1:catController.productList[index3].title ,
                                                   title: catController.productList[index3].preset!,
                                                 )));
                                           },
                                           child: Text(
                                             'View All',
                                             style: GoogleFonts.poppins(
                                                 textStyle: TextStyle(
                                                     color: Colors.blue.shade900,
                                                     fontSize: 12,
                                                     fontWeight: FontWeight.bold)),
                                           ),
                                         )
                                       ],
                                     ),
                                     SizedBox(
                                       height: Get.height * 0.02,
                                     ),
                                      Obx(
                                           () {
                                             return
                                               catController.productList.isNotEmpty
                                                   ?
                                               SizedBox(
                                       height: Get.width * 0.58,
                                       child: ListView.separated(
                                               shrinkWrap: true,
                                               scrollDirection: Axis.horizontal,
                                               itemCount: catController.productList[index3].data.length,
                                               separatorBuilder: (context, index4) {
                                                 return SizedBox(
                                                   width: Get.width * 0.04,
                                                 );
                                               },
                                               itemBuilder: (context, index4) {
                                                 return Padding(
                                                   padding:
                                                   EdgeInsets.symmetric(vertical: Get.width * 0.01),
                                                   child: Container(
                                                     height: Get.width * 0.6,
                                                     color: Colors.white,
                                                     width: MediaQuery.of(context).size.width * 0.4,
                                                     child: InkWell(
                                                       onTap: () {
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
                                                         Get.put(HomeController()).clearValueAll();
                                                         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductDisplay(int.parse(catController.productList[index3].data[index4].productId!))));


                                                       },
                                                       child: Container(
                                                         height: Get.width * 0.55,
                                                         width: Get.width * 0.4,
                                                         decoration: BoxDecoration(
                                                           color: Colors.white,
                                                           border: Border.all(
                                                               color: Colors.grey.withOpacity(0.5)),
                                                           borderRadius: BorderRadius.circular(7),
                                                           // boxShadow: const [
                                                           //   BoxShadow(
                                                           //       color: Colors.grey,
                                                           //       spreadRadius: 1,
                                                           //       blurRadius: 2,
                                                           //       offset: Offset(-2, 5))
                                                           // ]
                                                         ),
                                                         child: Stack(children: [
                                                           Column(
                                                             children: [
                                                               const SizedBox(
                                                                 height: 5,
                                                               ),
                                                               Container(
                                                                 height: Get.width * 0.36,
                                                                 width: Get.width * 0.4,
                                                                 decoration: BoxDecoration(
                                                                     borderRadius:
                                                                     BorderRadius.circular(20)),
                                                                 child: Padding(
                                                                   padding:
                                                                   EdgeInsets.all(Get.width * 0.02),
                                                                   child: ClipRRect(
                                                                     borderRadius:
                                                                     BorderRadius.circular(7),
                                                                     child: Image.network(
                                                                       catController.productList[index3].data[index4].thumb??""
                                                                          ,
                                                                       fit: BoxFit.fill,
                                                                       errorBuilder:
                                                                           (context, object, straeTree) {
                                                                         return Icon(
                                                                           Icons.image,
                                                                           color: Colors.grey,
                                                                           size: Get.width * 0.06,
                                                                         );
                                                                       },
                                                                     ),
                                                                   ),
                                                                 ),
                                                               ),
                                                               Padding(
                                                                 padding: EdgeInsets.symmetric(
                                                                     horizontal: Get.width * 0.02),
                                                                 child: Text(
                                                                   catController.productList[index3].data[index4].name??"",
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
                                                                 padding: EdgeInsets.symmetric(
                                                                     horizontal: Get.width * 0.02),
                                                                 child: Row(
                                                                   children: [
                                                                     Text(
                                                                       catController.productList[index3].data[index4].special.toString(),
                                                                       style: GoogleFonts.poppins(
                                                                           textStyle: TextStyle(
                                                                               color: Colors.black,
                                                                               fontWeight: FontWeight.bold,
                                                                               fontSize:
                                                                               Get.width * 0.04)),
                                                                     ),
                                                                   ],
                                                                 ),
                                                               ),
                                                               SizedBox(
                                                                 height: Get.width * 0.01,
                                                               ),
                                                             ],
                                                           ),
                                                           Row(children: [
                                                             catController.productList[index3].data[index4].discount.toString()=="0"?SizedBox.shrink():
                                                             Container(
                                                                 height: Get.width * 0.1,

                                                                 decoration:const BoxDecoration(
                                                                     color: Colors.red,
                                                                     borderRadius: BorderRadius.only(
                                                                         bottomRight: Radius.circular(20))),
                                                                 child: Center(
                                                                   child: Padding(
                                                                     padding: const EdgeInsets.all(4.0),
                                                                     child: Text(
                                                                       "${catController.productList[index3].data[index4].discount.toString().split(".").first}% OFF",
                                                                       style: GoogleFonts.poppins(
                                                                           textStyle: TextStyle(
                                                                               color: Colors.white, fontSize: Get.width * 0.028)),
                                                                     ),
                                                                   ),
                                                                 ))
                                                           ]),
                                                         ]),
                                                       ),
                                                     ),
                                                   ),
                                                 );
                                               }),
                                     ) : Column(
                                       children: [
                                         SizedBox(
                                           height: Get.width * 0.02,
                                         ),
                                         Center(
                                           child: Text("No result are found",
                                           style: TextStyle(color: Colors.black,fontSize: Get.height*0.04),
                                           ),
                                         ),
                                       ],
                                     );
                                           }
                                         ),

                                     SizedBox(
                                       height: Get.width * 0.04,
                                     ),
                                   ],
                                 );
                               }),
                         );
                       }
                     ),


                     SizedBox(
                       height: Get.height * 0.02,
                     ),
                     Obx(
                       () {
                         return ListView.builder(
                         itemCount: catController.sliderList.length,
                         shrinkWrap: true,
                         padding: EdgeInsets.zero,
                         primary: false,
                         itemBuilder: (BuildContext context, int index1) {
                         return Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Container(
                               padding: EdgeInsets.symmetric(horizontal: width * 0.04,),
                               child: Text(
                                 catController.sliderList[index1].title??"",
                                 textAlign: TextAlign.start,
                                 style: TextStyle(
                                     fontSize: width * 0.06, fontWeight: FontWeight.w900),
                               ),
                             ),

                             Padding(
                               padding:  EdgeInsets.symmetric(horizontal: Get.width*0.04,vertical: 12),
                               child: CarouselSlider(

                                 options: CarouselOptions(
                                   aspectRatio: 16 / 9,
                                   pageSnapping: false,
                                   height: Get.height * 0.2,
                                   viewportFraction: 1,
                                   initialPage: 0,

                                   enableInfiniteScroll: false,
                                   pauseAutoPlayInFiniteScroll: false,
                                   reverse: true,
                                   autoPlay: true,
                                   autoPlayInterval: const Duration(seconds: 2),
                                   autoPlayAnimationDuration: const Duration(milliseconds: 400),
                                   autoPlayCurve: Curves.fastOutSlowIn,
                                   enlargeCenterPage: true,
                                   scrollDirection: Axis.horizontal,

                                   enlargeStrategy: CenterPageEnlargeStrategy.height,
                                 ),
                                 items: catController.sliderList[index1].data?.map((item) =>
                                     GestureDetector(
                                   onTap:(){
                                     Get.put(HomeController()).clearValueAll();
                                     switch (item.linkType) {
                                       case "product_id":
                                         {
                                           Get.put(HomeController()).clearValueAll();
                                           Get.put(CategoryController()).updateText("");
                                           Get.put(CategoryController()).updateCode("");

                                           Get.put(HomeController()).updateKeyId("");
                                           Get.put(HomeController()).updateKeyId1("");
                                           Get.put(HomeController()).updateMainId("");
                                           Get.put(HomeController()).updateMainId1("");
                                           Get.put(CategoryController()).updateText("");
                                           Get.put(CategoryController()).updateCode("");
                                           setState(() {
                                             prices="null";
                                             prices="null";
                                             textPrice=null;
                                             textName=null;
                                           });
                                           Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductDisplay(int.parse(item.link??""))));

                                         }
                                         break;
                                       case "category_id":
                                         {
                                           Get.put(HomeController()).clearValueAll();
                                           Get.put(CategoryController()).updateText("");
                                           Get.put(CategoryController()).updateCode("");

                                           Get.put(HomeController()).updateKeyId("");
                                           Get.put(HomeController()).updateKeyId1("");
                                           Get.put(HomeController()).updateMainId("");
                                           Get.put(HomeController()).updateMainId1("");
                                           Get.put(HomeController()).updateText("");
                                           data.data.value == null;
                                           Get.put(HomeController()).subList.clear();

                                           Navigator.of(context).push(
                                             MaterialPageRoute(
                                                 builder: (context) => TopCategoryScreen(
                                                     id: item.link??"")),
                                           );

                                         }
                                         break;
                                     }
                                   },
                                       child: Container(
                                   margin: const EdgeInsets.all(5.0),
                                   child: ClipRRect(
                                       borderRadius: BorderRadius.circular(10),
                                       child: CachedNetworkImage(
                                         placeholder: (context, url) =>  Center(
                                           child: SpinKitThreeBounce(
                                               size: 25,
                                               color: Colors.blue.shade900
                                           ),
                                         ),
                                         imageUrl: item.image??"",

                                         width: Get.width,


                                         errorWidget: (context, url, error) => ClipRRect(
                                           borderRadius: BorderRadius.circular(10),
                                           child: Icon(Icons.error)
                                         ),
                                       ),
                                   ),
                                 ),
                                     ))
                                     .toList(),
                               ),
                             ),



                           ],
                         );
                         });
                       }
                     ),

                     SizedBox(
                       height: Get.height * 0.02,
                     ),
                     Obx(
                             () {
                           return Padding(
                             padding:  EdgeInsets.symmetric(horizontal: Get.width*0.04),
                             child: ListView.builder(
                                 itemCount: catController.bannerList.length,
                                 shrinkWrap: true,
                                 padding: EdgeInsets.zero,
                                 primary: false,
                                 itemBuilder: (BuildContext context, int index5) {
                                   return Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [

                                       Container(

                                         child: Text(
                                           catController.bannerList[index5].title??"",
                                           textAlign: TextAlign.start,
                                           style: TextStyle(
                                               fontSize: width * 0.06, fontWeight: FontWeight.w900),
                                         ),
                                       ),
                                       SizedBox(
                                         height: height * 0.023,
                                       ),
                                       Obx(
                                         () {
                                           return
                                             GridView.count(
                                                 shrinkWrap: true,
                                                 childAspectRatio:
                                                 int.parse(catController.bannerList[index5].column)==3?

                                                 0.78:int.parse(catController.bannerList[index5].column)==2?0.85:
                                                 int.parse(catController.bannerList[index5].column)==4?0.75:

                                                 0.92,
                                                 padding: EdgeInsets.zero,
                                                 physics: const NeverScrollableScrollPhysics(),
                                                 crossAxisCount: int.parse(catController.bannerList[index5].column),
                                                 mainAxisSpacing: 0,
                                                 children: List.generate(catController.bannerList[index5].data.length, (index6) {
                                                   return GestureDetector(
                                                     onTap: (){
                                                       Get.put(HomeController()).clearValueAll();
                                                       switch (catController.bannerList[index5].data[index6].linkType) {
                                                         case "product_id":
                                                           {
                                                             Get.put(HomeController()).clearValueAll();
                                                             Get.put(CategoryController()).updateText("");
                                                             Get.put(CategoryController()).updateCode("");

                                                             Get.put(HomeController()).updateKeyId("");
                                                             Get.put(HomeController()).updateKeyId1("");
                                                             Get.put(HomeController()).updateMainId("");
                                                             Get.put(HomeController()).updateMainId1("");
                                                             Get.put(CategoryController()).updateText("");
                                                             Get.put(CategoryController()).updateCode("");
                                                             Get.put(HomeController()).clearValueAll();
                                                             setState(() {
                                                               prices="null";
                                                               prices="null";
                                                               textPrice=null;
                                                               textName=null;
                                                             });
                                                             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductDisplay(int.parse(catController.bannerList[index5].data[index6].link))));

                                                           }
                                                           break;
                                                         case "category_id":
                                                           {
                                                             //getData(id:catController.bannerList[index5].data[index6].link==""?"255":catController.bannerList[index5].data[index6].link );
                                                             Get.put(HomeController()).updateText("");
                                                             Get.put(HomeController()).subList.clear();
                                                             Get.put(HomeController()).clearValueAll();

                                                             Navigator.of(context).push(
                                                               MaterialPageRoute(
                                                                   builder: (context) => TopCategoryScreen(
                                                                       id: catController.bannerList[index5].data[index6].link)),
                                                             );
                                                             //Get.to(TopCategoryScreen(id: catController.bannerList[index5].data[index6].link==""?"255":catController.bannerList[index5].data[index6].link));
                                                           }
                                                           break;
                                                         case "information_id":
                                                           {
                                                             ApiService().getAboutUs(id:catController.bannerList[index5].data[index6].link.toString() );
                                                             Get.to(About());
                                                           }
                                                           break;
                                                         case "custom":
                                                           {
                                                             log(catController.bannerList[index5].data[index6].link.toString());
                                                             _launchURL(urlValue:catController.bannerList[index5].data[index6].link.toString() );

                                                           }
                                                           break;
                                                       }
                                                     },
                                                     child: Container(
                                                       padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                                                       child: Column(
                                                         children: [
                                                           ClipRRect(
                                                               borderRadius: BorderRadius.circular(7),
                                                               child: Image.network(
                                                                 catController.bannerList[index5].data[index6].image??"",
                                                                 // width: width * 0.4,
                                                                 // height: width * 0.4,
                                                                 fit: BoxFit.fill,
                                                               )),
                                                           SizedBox(
                                                             height: height * 0.02,
                                                           ),
                                                           Text(
                                                             catController.bannerList[index5].data[index6].name??"",
                                                           )
                                                         ],
                                                       ),
                                                     ),
                                                   );
                                                 }
                                                 )
                                             );





                                         }
                                       ),

                                     ],
                                   );
                                 }),
                           );
                         }
                     ),



                   ],
                 );
               }
           ),
            SizedBox(
              height: Get.height * 0.08,
            ),
          ],
        ),
      ),
    );
  }
}
