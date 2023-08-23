import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vkreta/controllers/categoryController.dart';
import 'package:vkreta/getx_controllers/homepage.dart';
import 'package:vkreta/models/homemodel.dart';
import 'package:vkreta/view/home/controller/home_controller.dart';
import 'package:vkreta/view/product/productdisplay.dart';
import 'package:vkreta/view/product/search_screen.dart';
import 'package:vkreta/services/apiservice.dart';

import '../home/home.dart';

class ViewAll extends StatefulWidget {
  String title;
  String title1;
  ViewAll({
    required this.title,
    required this.title1,
  });

  @override
  State<ViewAll> createState() => _ViewAllState();
}

class _ViewAllState extends State<ViewAll> {
  final viewAll=Get.put(ViewAllController());
  Future<List<ViewAllModel>> getAllProducts(String page,String title)async{
    setLoading(true);
    List<ViewAllModel> viewAllModel=await ApiService().viewAll(widget.title, page.toString()).then((value){
      viewAll.viewAllModel.value=value;
    setLoading(false);
    return value;
    });
    return viewAllModel;
  }
  setLoading(bool value){
    setState(() {
      isLoading=value;
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
      getAllProducts(page.toString(), widget.title);
    }else{
      print("error");
    }
  }

  @override
  void initState() {
    getAllProducts(page.toString(), widget.title);
    _controller.addListener(pageListener);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    List<ViewAllModel> snapshot= viewAll.viewAllModel;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: width * 0.2,
          elevation: 0,
          actions: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    right: width * 0.02,
                  ),
                  child: PopupMenuButton(
                    icon: Icon(
                      Icons.format_line_spacing,
                      color: Colors.black,
                      size: width * 0.06,
                    ),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                          onTap:()=> setOrder("prices"),
                          child:Row(
                            children: [
                              Text(
                                'High Price',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: width * 0.035,
                                    )),
                              ),
                            ],
                          ),),
                      PopupMenuItem(
                        onTap:()=> setOrder("popularity"),
                        child:Row(
                          children: [
                            Text(
                              'Popularity',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.035,
                                  )),
                            ),
                          ],
                        ),),
                      // PopupMenuItem(
                      //   onTap:()=> setOrder("rating"),
                      //   child:Row(
                      //     children: [
                      //       Text(
                      //         'Rating',
                      //         style: GoogleFonts.poppins(
                      //             textStyle: TextStyle(
                      //               color: Colors.black,
                      //               fontSize: width * 0.035,
                      //             )),
                      //       ),
                      //     ],
                      //   ),),
                    ],
                  ),
                ),
                Text(
                  'Sort',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: width * 0.035,
                  )),
                ),
              ],
            ),
          ],
          backgroundColor: Colors.white,
          title: Text(
            widget.title1,
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: width * 0.05,
                    fontWeight: FontWeight.bold)),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: width * 0.06,
              )),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: Get.width*0.04),
          child: Stack(
            children: [
              Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                      child: Column(
                        children: [
                          Container(
                            height: width * 0.2,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              // boxShadow: [BoxShadow(
                              //   color: Colors.grey.shade100,spreadRadius: 5,
                              //   offset: Offset(0, 5)
                              // )]
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        const SearchScreen())),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 0),
                                  child: TextFormField(
                                    enabled: false,
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
                                            borderSide: BorderSide.none),
                                        hintText: 'Search Product',
                                        hintStyle: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                color: Colors.grey.shade600,
                                                fontSize: width * 0.04))),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: width * 0.02,
                          ),
                          Divider(
                            height: 1,
                            color: Colors.grey.shade400,
                          ),
                          SizedBox(
                            height: width * 0.02,
                          ),
                          SizedBox(
                            height: width * 0.02,
                          ),
                          //ViewAllCard(onTap: onTap, width: width, product: product),
                          Expanded(
                            child: GridView.builder(
                              shrinkWrap: true,
                               controller: _controller,
                                itemCount: snapshot.length,
                                addRepaintBoundaries: false,
                                addAutomaticKeepAlives: false,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: Get.width/Get.height*1.6,
                                        mainAxisSpacing: width * 0.04,
                                        crossAxisSpacing: width * 0.04),
                                itemBuilder: (context, index) {
                                  List<ViewAllModel> product =
                                      sortList(sortingOrder, snapshot);
                                  return ViewAllCard(
                                      onTap: () {
                                        Get.put(HomeController()).clearValueAll();
                                        Get.put(CategoryController()).updateText("");
                                        Get.put(CategoryController()).updateCode("");
                                        Navigator.of(context).push(PageRouteBuilder(
                                            transitionDuration:
                                                const Duration(seconds: 1),
                                            transitionsBuilder: (BuildContext context,
                                                Animation<double> animation,
                                                Animation<double> secAnimation,
                                                Widget child) {
                                              animation = CurvedAnimation(
                                                  parent: animation,
                                                  curve: Curves.linear);
                                              return SharedAxisTransition(
                                                  child: child,
                                                  animation: animation,
                                                  secondaryAnimation: secAnimation,
                                                  transitionType:
                                                      SharedAxisTransitionType
                                                          .horizontal);
                                            },
                                            pageBuilder: (BuildContext context,
                                                Animation<double> animation,
                                                Animation<double> secAnimation) {
                                              return ProductDisplay(int.parse(product[index].productId!));
                                            }));
                                      },
                                      width: width,
                                      product: product[index]);
                                }),
                          )
                        ],
                      ),
                    ),
              isLoading?Positioned.fill(child: Container(child:const Center(child: CircularProgressIndicator(),),)):Container()
            ],
          ),
        )
            );
  }

  List<ViewAllModel> sortList(String sortingOrder, List<ViewAllModel> list) {
    switch (sortingOrder) {
      case "popularity":
        list.sort((a, b) =>
            int.parse(b.quantity!).compareTo(int.parse(a.quantity!)));
        break;
      case "prices":
        list.sort(
            (a, b) => double.parse(b.price!.toString().replaceAll("₹", "").replaceAll(",", "")).compareTo(double.parse(a.price!.toString().replaceAll("₹", "").replaceAll(",", ""))));
        break;
      case "Rating":
        list.sort((a, b) => int.parse(b.rating!.toString())
            .compareTo(int.parse(a.rating!.toString())));
        break;
      case "none":
        break;
    }

    return list;
  }

}

class ViewAllCard extends StatelessWidget {
  const ViewAllCard({
    Key? key,
    required this.onTap,
    required this.width,
    required this.product,
  }) : super(key: key);

  final Null Function() onTap;
  final double width;
  final ViewAllModel product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: width * 0.53,
        width: width * 0.4,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(7),
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
                  child: Image.network(product.thumb != null?product.thumb! :"https://sdad",
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
                  product.name!,
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
                      product.price!,
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


          //Sales display
          //        Padding(
          //        padding: EdgeInsets.all( width * 0.02,),
          //        child: Row(children: [
          //          Container(
          // height: 25,
          // width: 40,
          // decoration:const  BoxDecoration(
          //     color: Colors.red,
          //     borderRadius: BorderRadius.only(
          //         bottomRight: Radius.circular(20))),
          // child: Center(
          //   child: Text(
          //     '-60%',
          //     style: GoogleFonts.poppins(
          //         textStyle:const TextStyle(
          //             color: Colors.white, fontSize: 10)),
          //   ),
          // ))
          //        ]),
          //      ),
        ]),
      ),
    );
  }
}
