// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:vkreta/getx_controllers/homepage.dart';
// import 'package:vkreta/view/filter/show_filter_results_screen.dart';
//
// import '../../controllers/categoryController.dart';
//
// class CategoryFilterScreen extends StatefulWidget {
//   const CategoryFilterScreen({Key? key}) : super(key: key);
//
//   @override
//   State<CategoryFilterScreen> createState() => _CategoryFilterScreenState();
// }
//
// class _CategoryFilterScreenState extends State<CategoryFilterScreen> {
//   final controller=Get.find<CategoryController>();
//   String brand="bbb";
//   String discount="bbb";
//   String rating="bbb";
//   double low=0;
//   double high=0;
//
//   @override
//   void initState() {
//         high=double.parse(controller.data.value.filter![0].priceRange!.max!.toString());
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     var width =MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0.5,
//         title: Text(
//           'Filter Product',
//           style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 16)),
//         ),
//       ),
//       bottomNavigationBar: InkWell(
//         onTap: (){
//           Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowFilterResults(min: low < double.parse(controller.data.value.filter![0].priceRange!.min.toString()) ?controller.data.value.filter![0].priceRange!.min!.toString().toString():low.toStringAsFixed(0),
//               max: high.toStringAsFixed(0),
//               rating: rating,
//               discount: discount,
//               brand: brand)));
//         },
//         child: Container(
//           color: Colors.blue[900],
//           margin: EdgeInsets.symmetric(vertical: width * 0.04,horizontal: width *0.04),
//           padding: EdgeInsets.symmetric(vertical: width * 0.04,horizontal: width *0.04),
//           child:const Text("Apply Filter",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.symmetric(vertical: width * 0.04,horizontal: width * 0.04),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Text("Select Price Range:",textAlign: TextAlign.start,style: TextStyle(fontSize: width * 0.05,fontWeight: FontWeight.bold),),
//               SizedBox(height: width * 0.04,),
//               Row(
//                 children: [
//                   Text(low < controller.data.value.filter![0].priceRange!.min!?controller.data.value.filter![0].priceRange!.min!.toString().toString():low.toStringAsFixed(0),style: const TextStyle(fontWeight: FontWeight.bold),),
//                   Expanded(
//                     child: RangeSlider(
//                         activeColor: Colors.blue[900] ,
//                         inactiveColor: Colors.grey,
//                         labels: RangeLabels(
//                           low.toString(),
//                           high.toString(),
//                         ),
//                         values: RangeValues(
//                           low < double.parse(controller.data.value.filter![0].priceRange!.min!.toString())?double.parse(controller.data.value.filter![0].priceRange!.min!.toString()):low,
//                           high,
//                         ),
//                         min: double.parse(controller.data.value.filter![0].priceRange!.min!.toString()),
//                         max: double.parse(controller.data.value.filter![0].priceRange!.max!.toString()),
//                         // value < double.parse(controller.product!.value.filter![0].priceRange!.min!.toString())?double.parse(controller.product!.value.filter![0].priceRange!.min!.toString()):value,
//                         onChanged:(prices){
//                           setState(() {
//                             low=prices.start;
//                             high=prices.end;
//                           });
//                         }),
//                   ),
//                   Text(high < controller.data.value.filter![0].priceRange!.max!?controller.data.value.filter![0].priceRange!.max!.toString():high.toStringAsFixed(0),style:const TextStyle(fontWeight: FontWeight.bold),),
//                 ],
//               ),
//               SizedBox(height: width * 0.04,),
//               Text("Select Brand:",textAlign: TextAlign.start,style: TextStyle(fontSize: width * 0.05,fontWeight: FontWeight.bold),),
//               SizedBox(height: width * 0.04,),
//               GridView.count(crossAxisCount: 3,
//                 mainAxisSpacing: width * 0.02,
//                 crossAxisSpacing: width * 0.02,
//                 childAspectRatio: 3.0,
//                 physics:const NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 children: controller.data.value.filter![1].items!.map((e) => InkWell(
//                   onTap: (){
//                     setState(() {
//                       brand=e.value.toString();
//                       print(e.value.toString());
//                     });
//                   },
//                   child: Container(
//                     alignment: Alignment.center,
//                     padding: EdgeInsets.symmetric(vertical:width * 0.02,horizontal: width * 0.02),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(7),
//                         color: e.value.toString()==brand? Colors.blue[900]: Colors.grey
//                     ),
//                     child: Text(e.value!.toString(),style:const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
//                   ),
//                 )).toList(),
//               ),
//               SizedBox(height: width * 0.04,),
//               Text("Select Discount:",textAlign: TextAlign.start,style: TextStyle(fontSize: width * 0.05,fontWeight: FontWeight.bold),),
//               SizedBox(height: width * 0.04,),
//               GridView.count(crossAxisCount: 3,
//                 mainAxisSpacing: width * 0.02,
//                 crossAxisSpacing: width * 0.02,
//                 childAspectRatio: 3.0,
//                 physics:const NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 children: controller.data.value.filter![2].items!.map((e) => InkWell(
//                   onTap: (){
//                     setState(() {
//                       discount=e.value.toString();
//                     });
//                   },
//                   child: Container(
//                     alignment: Alignment.center,
//                     padding: EdgeInsets.symmetric(vertical:width * 0.02,horizontal: width * 0.02),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(7),
//                         color: e.value.toString()==discount? Colors.blue[900]: Colors.grey
//                     ),
//                     child: Text(e.value!.toString(),style:const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
//                   ),
//                 )).toList(),
//               ),
//               SizedBox(height: width * 0.04,),
//               // Text("Select Rating:",textAlign: TextAlign.start,style: TextStyle(fontSize: width * 0.05,fontWeight: FontWeight.bold),),
//               // SizedBox(height: width * 0.04,),
//               // GridView.count(
//               //   crossAxisCount: 3,
//               //   mainAxisSpacing: width * 0.02,
//               //   crossAxisSpacing: width * 0.02,
//               //   childAspectRatio: 3.0,
//               //   physics:const NeverScrollableScrollPhysics(),
//               //   shrinkWrap: true,
//               //   children: controller.data.value.filter![3].items!.map((e) => InkWell(
//               //     onTap: (){
//               //       setState(() {
//               //         rating=e.value.toString();
//               //       });
//               //     },
//               //     child: Container(
//               //       alignment: Alignment.center,
//               //       padding: EdgeInsets.symmetric(vertical:width * 0.02,horizontal: width * 0.02),
//               //       decoration: BoxDecoration(
//               //           borderRadius: BorderRadius.circular(7),
//               //           color: e.value.toString()==rating? Colors.blue[900]: Colors.grey
//               //       ),
//               //       child: Text(e.value!.toString(),style:const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
//               //     ),
//               //   )).toList(),
//               // ),
//               // SizedBox(height: width * 0.04,),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
