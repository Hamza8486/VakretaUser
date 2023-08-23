import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vkreta/controllers/categoryController.dart';
import 'package:vkreta/custom_widgets/widgets.dart';
import 'package:vkreta/view/filter/fliter_screen.dart';
import 'package:vkreta/getx_controllers/homepage.dart';
import 'package:vkreta/models/productsearchModel.dart';
import 'package:vkreta/models/searchModel.dart';
import 'package:vkreta/view/home/controller/home_controller.dart';
import 'package:vkreta/view/product/productdisplay.dart';
import 'package:vkreta/services/apiservice.dart';

import '../notification/allnotifications.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final controller=Get.put(ProductSearchModelController());
  final homeController=Get.put(HomeController());

  // Future<SearchModel>getSearch(String key)async{
  //   setLoading(true);
  //   SearchModel search=await ApiService().getProductSearch(search: key).then((value){
  //   controller.product.value=value;
  //   controller.exist.value=true;
  //   setLoading(false);
  //     return value;
  //   });
  //   return search;
  // }

  setLoading(bool value){
    setState(() {
      isLoading=value;
    });
  }
   bool isLoading=false;
  int pageNumber = 1;
   final TextEditingController _search = TextEditingController();
  ScrollController _scrollController = ScrollController();
   @override
  void initState() {
    controller.exist.value=false;
    super.initState();
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        setState(() {
          pageNumber = pageNumber + 1;
        });
        homeController.cartData(search: _search.text,page: pageNumber,isUpdate: true);


        // setState(() {
        //   isPaginationLoader = false;
        // });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    ProductSearchModelController snapshot=controller;
    var width =MediaQuery.of(context).size.width;
    return Scaffold(
     body: SingleChildScrollView(
       controller: _scrollController,
       child: Column(
         children: [
           SizedBox(height: Get.height*0.06,),
           Padding(
             padding: EdgeInsets.all(width * 0.02),
             child: SizedBox(
               height: width * 0.12,
               width: MediaQuery.of(context).size.width,
               child: Row(
                 children: [
                   GestureDetector(
                     onTap: (){
                       Get.back();
                     },
                     child: Icon(Icons.arrow_back_ios_outlined,color: Colors.black,
                     size: Get.height*0.04,
                     ),
                   ),
                   SizedBox(width: 15,),
                   Expanded(
                     child: Container(
                       decoration:BoxDecoration(
                   borderRadius: BorderRadius.circular(10),
               border: Border.all(color:Colors.black),
               ),
                       child: TextFormField(
                         controller: _search,
                         textInputAction: TextInputAction.search,
                         onChanged: (value){
                         setState(() {
                           homeController.searchList.clear();
                           homeController.cartData(search: value.toString(), page: 1,
                               isUpdate: false);
                           //getSearch(value.trim().toString());
                         });

                         },
                         decoration: InputDecoration(
                           prefixIcon: Icon(
                             Icons.search,
                             color: Colors.grey.shade600,
                             size: 25,
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

                   Obx(
                     () {
                       return IconButton(
                           onPressed: () {
                           if(homeController.searchList.isNotEmpty){
                             Get.to(FilterScreen(),
                             transition: Transition.rightToLeft
                             );

                           }else{
                             Fluttertoast.showToast(msg: "No Search to filter results");
                           }
                           },
                           icon: Icon(
                             Icons.filter_list_alt,
                             color: homeController.searchList.isNotEmpty?Colors.black:Colors.black,
                             size: width * 0.06,
                           ));
                     }
                   )
                 ],
               ),
             ),
           ),
           const Divider(),
           Obx(
             () {
               return
               homeController.isUserLoading.value?loader():
         homeController.searchList.isNotEmpty?


               Padding(
                 padding:  EdgeInsets.symmetric(horizontal: width * 0.04),
                 child: GridView.count(
                   crossAxisSpacing: width * 0.04,
                   mainAxisSpacing: width * 0.04,
                   padding: EdgeInsets.zero,
                   primary: false,
                   childAspectRatio: 0.75,
                   shrinkWrap: true,
                   crossAxisCount: 2,
                   children: homeController.searchList.map((e)=>
                       Obx(
                         () {
                           return Padding(
                             padding: EdgeInsets.symmetric(vertical:width * 0.01),
                             child: Container(
                               height: width * 0.5,
                               color:homeController.searchList.isNotEmpty?Colors.white: Colors.white,
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
                                   ApiService().lastSearchAdd(prodId:e.productId.toString() );
                                  Get.to(ProductDisplay(int.parse(e.productId!)),
                                  transition: Transition.rightToLeft
                                  );

                                 },
                                 child: Container(
                                   height: width * 0.55,
                                   width: width * 0.4,
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
                                               height: width * 0.36,
                                               width: width * 0.4,
                                               decoration: BoxDecoration(
                                                   borderRadius: BorderRadius.circular(20)),
                                               child: Padding(
                                                 padding: EdgeInsets.all(width * 0.02),
                                                 child: ClipRRect(
                                                   borderRadius: BorderRadius.circular(7),
                                                   child:

                                                   Image.network(e.thumb.toString()==null?"https://dfdsf":e.thumb.toString(),
                                                     fit: BoxFit.fill,
                                                     errorBuilder: (context,object,straeTree){
                                                       return Icon(Icons.image,color: Colors.grey,size: width * 0.06,);
                                                     },
                                                   ),
                                                 ),
                                               ),
                                             ),
                                             Padding(
                                               padding:
                                               EdgeInsets.symmetric(horizontal: width * 0.02),
                                               child: Text(
                                                 e.name!,
                                                 maxLines: 2,
                                                 overflow: TextOverflow.ellipsis,
                                                 style: GoogleFonts.poppins(
                                                     textStyle: TextStyle(
                                                         color: Colors.grey.shade900,
                                                         fontSize: width * 0.03)),
                                               ),
                                             ),
                                             SizedBox(
                                               height: width * 0.01,
                                             ),
                                             Padding(
                                               padding:
                                               EdgeInsets.symmetric(horizontal: width * 0.01),
                                               child: Row(
                                                 children: [
                                                   Text(
                                                     e.price!,
                                                     style: GoogleFonts.poppins(
                                                         textStyle: TextStyle(
                                                             color: Colors.black,
                                                             fontWeight: FontWeight.bold,
                                                             fontSize: width * 0.035)),
                                                   ),
                                                 ],
                                               ),
                                             ),
                                             SizedBox(
                                               height: width * 0.01,
                                             ),
                                           ],
                                         ),

                                       ]
                                   ),
                                 ),
                               ),
                             ),
                           );
                         }
                       )

                   ).toList(),
                 ),
               ): Container();
             }
           ),
           Obx(() {
             return homeController.isPag1Loading.value
                 ? Center(
                 child: CircularProgressIndicator(
                   backgroundColor: Colors.black26,
                   valueColor: AlwaysStoppedAnimation<Color>(
                       Colors.black //<-- SEE HERE

                   ),
                 ))
                 : SizedBox();
           }),
           SizedBox(
             height: Get.height * 0.08,
           )

         ],
       ),
     ),
    );
  }
}
