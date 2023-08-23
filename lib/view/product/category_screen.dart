import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vkreta/controllers/app_text.dart';
import 'package:vkreta/custom_widgets/widgets.dart';
import 'package:vkreta/models/TopCategoryModel.dart';
import 'package:vkreta/services/apiservice.dart';
import 'package:vkreta/view/home/controller/home_controller.dart';
import 'package:vkreta/view/product/category_filter_screen.dart';
import 'package:vkreta/view/product/productdisplay.dart';
import 'package:vkreta/view/product/viewall.dart';

import '../../controllers/categoryController.dart';
import '../filter/fliter_screen.dart';
import '../home/home.dart';
import 'otherSellerProductsScreen.dart';

class TopCategoryScreen extends StatefulWidget {
  final String id;
  const TopCategoryScreen({required this.id, Key? key}) : super(key: key);

  @override
  State<TopCategoryScreen> createState() => _TopCategoryScreenState();
}

class _TopCategoryScreenState extends State<TopCategoryScreen> {
  final data=Get.put(CategoryController());
  getData(String page)async{
    var response=await ApiService().getProductList(widget.id,page.toString()).then((value){
      data.data.value=
      TopCategoryModel.fromJson(value);
      setState(() {});
      print(data.data.value.thumb.toString());
    });

  }


  bool isLoading=false;
  final  ScrollController _controller=ScrollController();

  setOrder(String value) {
    setState(() {
      sortingOrder = value;
    });
  }
  int page=1;
  String sortingOrder = "none";
  pageListener(){
    if(_controller.position.pixels==_controller.position.maxScrollExtent){
      setState(() {
        page=page+1;
      });
      getData(page.toString());

    }else{
      print("error");
    }
  }



  @override
  void initState() {
    getData(page.toString());
    super.initState();
    _controller.addListener(() async {
      if (_controller.position.pixels ==
          _controller.position.maxScrollExtent) {
        setState(() {
          page = page + 1;
        });
        getData(page.toString());

        (Get.put(HomeController()).subData(search: Get.put(HomeController()).updateId.value,page: page,
        isUpdate: true
        ));


        // setState(() {
        //   isPaginationLoader = false;
        // });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    return



      Scaffold(
      appBar: AppBar(
        title:const Text("Top Category"),
        leading:IconButton(onPressed: ()=>Navigator.pop(context),icon: const Icon(Icons.arrow_back_ios),),

      ),
      body:
      data.data.value == null ?loader():

      Obx(
        () {
          return
            data.data.value.limit == null ?loader():

            SingleChildScrollView(
              controller: _controller,
            child: Column(
              children: [
                SizedBox(height: Get.height * 0.02,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  height: width * 0.32,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(width * 0.01),
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                Get.put(HomeController()).subList.clear();
                                Get.put(CategoryController()).data.value.products?.clear();
                              });
                              Get.put(HomeController()).subData(search: data.data.value.categories![index].categoryId.toString(),page: 1,
                              isUpdate: false
                              );
                              print(data.data.value.categories![index].categoryId);
                              Get.put(HomeController()).updateIds(data.data.value.categories![index].categoryId.toString());


                            },
                            child:




                            Container(
                              height: width * 0.18,
                              width: width * 0.22,
                              color: Colors.white,
                              child: Column(children: [
                                SizedBox(
                                    height: width * 0.18,
                                    width: width * 0.22,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(7),
                                      child: Image.network(
                                        data.data.value.categories![index].image == "null"
                                            ? "https://kdfsdf"
                                            :  data.data.value.categories![index].image! ,
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, object, stracktree) {
                                          return Icon(
                                            Icons.image,
                                            size: width * 0.06,
                                            color: Colors.grey,
                                          );
                                        },
                                      ),
                                    )),
                                SizedBox(
                                  height: width * 0.015,
                                ),
                                Text(
                                  data.data.value.categories![index].name!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ]),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: width * 0.01,
                        );
                      },
                      itemCount:
                      data.data.value.categories!.length),
                ),


                SizedBox(height: width * 0.02,),

                Obx(
                  () {
                    return

                          Get.put(HomeController()).isSubLoading.value?loader():

                          Get.put(HomeController()).subList.isNotEmpty?
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                            child: GridView.builder(
                                shrinkWrap: true,
                                itemCount: Get.put(HomeController()).subList.length,
                                primary: false,
                                gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: Get.width/Get.height*1.6,
                                    mainAxisSpacing: width * 0.04,
                                    crossAxisSpacing: width * 0.04),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: (){
                                      Get.put(HomeController()).clearValueAll();
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductDisplay(int.parse(Get.put(HomeController()).subList[index].productId!))));
                                    },
                                    child: Container(
                                      height: width * 0.53,
                                      width: width * 0.4,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(7),
                                          border: Border.all(
                                              color: Colors.grey.withOpacity(0.5)),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey.shade200,
                                                spreadRadius: 1,
                                                blurRadius: 2,
                                                offset: const Offset(1, 3))
                                          ]),
                                      child: Stack(children: [
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: width * 0.02,
                                            ),
                                            Container(
                                              height: Get.width * 0.36,
                                              width: Get.width * 0.4,
                                              decoration:
                                              BoxDecoration(borderRadius: BorderRadius.circular(20),

                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(
                                                  width * 0.02,
                                                ),
                                                child: Image.network(Get.put(HomeController()).subList[index].thumb != null?Get.put(HomeController()).subList[index].thumb! :"https://sdad",
                                                  fit: BoxFit.fill,
                                                  errorBuilder: (context,error,streak){
                                                    return Icon(Icons.image,color: Colors.grey,);
                                                  },
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: width * 0.02,
                                              ),
                                              child: Text(
                                                Get.put(HomeController()).subList[index].name??"",
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color: Colors.grey.shade900, fontSize: Get.width * 0.03)),
                                              ),
                                            ),
                                            SizedBox(
                                              height: width * 0.015,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: width * 0.02,
                                              ),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    Get.put(HomeController()).subList[index].price.toString(),
                                                    style: GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: width * 0.04)),
                                                  ),
                                                ],
                                              ),
                                            ),

                                          ],
                                        ),
                                        Row(children: [
                                          Get.put(HomeController()).subList[index].discount.toString()=="0"?SizedBox.shrink():
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
                                                    "${  Get.put(HomeController()).subList[index].discount?.toStringAsFixed(0)??""}% OFF",
                                                    style: GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                            color: Colors.white, fontSize: Get.width * 0.03)),
                                                  ),
                                                ),
                                              ))
                                        ]),


                                      ]),
                                    ),
                                  );
                                }),
                          ):Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: Get.height*0.3,),
                              Center(
                                child: AppText(title: "No Data",
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  size: Get.height*0.024,
                                ),
                              ),
                            ],
                          );
                  }
                ),

                Obx(() {
                  return Get.put(HomeController()).isPagLoading.value
                      ? Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.black26,
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.black //<-- SEE HERE

                        ),
                      ))
                      : SizedBox();
                }),
                Obx(
                        () {
                      return
                        Get.put(HomeController()).isPagLoading.value?
                        SizedBox(
                          height: Get.height * 0.08,
                        ):SizedBox.shrink();
                    }
                )
              ],
            ),
          );
        }
      ),
    );
  }
}
