import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vkreta/controllers/theme.dart';
import 'package:vkreta/custom_widgets/social_button.dart';
import 'package:vkreta/new/sort.dart';
import 'package:vkreta/view/filter/show_filter_results_screen.dart';
import 'package:vkreta/view/home/controller/home_controller.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
 // final controller=Get.find<ProductSearchModelController>();
  final homeController = Get.put(HomeController());
  String?  brand;
  String?  rating;
  String?  sortAll;
  String ?discount;
  RangeValues currentRangeValues =  RangeValues(0, 0);
  @override
  Widget build(BuildContext context) {
    var width =MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading:  GestureDetector(
          onTap: (){
            Get.back();
            setState(() {
              brand=null;
              rating=null;
              sortAll=null;
              homeController.updateOrderText("ASC");
              homeController.updateSortText("pd.name");
              discount=null;

            });
          },
          child: Icon(Icons.arrow_back_ios_outlined,color: Colors.black,
            size: Get.height*0.03,
          ),
        ),

        elevation: 0.5,
        title: Text(
          'Filter Product',
          style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 16,
          fontWeight: FontWeight.w700
          )),
        ),
      ),
      bottomNavigationBar: Padding(
        padding:  EdgeInsets.symmetric(horizontal: Get.width*0.04),
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: (){
                  setState(() {
                    brand=null;
                    sortAll=null;
                    homeController.updateOrderText("ASC");
                    homeController.updateSortText("pd.name");
                    discount="bbb";
                    homeController.updateStart("0");
                    homeController.updateEnd("0");

                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueAccent.withOpacity(0.5
                    ),
                  ),

                  margin: EdgeInsets.symmetric(vertical: width * 0.04),
                  padding: EdgeInsets.symmetric(vertical: width * 0.04,horizontal: width *0.04),
                  child:const Text("Clear Filter",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                ),
              ),
            ),
            SizedBox(width: Get.width*0.04,),
            Expanded(
              child: InkWell(
                onTap:
                brand==null?(){
                  showErrorToast("Please select brand");
                }:
                    (){



                  Get.put(HomeController()).getFilterData(discount: discount,brand: brand,
                   rat: rating.toString(),



                  );
                  print( Get.put(HomeController()).getFilterData(discount: discount,brand: brand,

                      // rating: rating.toString()


                  ));
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowFilterResults(min: "0",
                      max: "0",
                      rating: rating.toString(),
                      discount: discount.toString(),
                      brand: brand.toString())));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue[900],
                  ),

                  margin: EdgeInsets.symmetric(vertical: width * 0.04),
                  padding: EdgeInsets.symmetric(vertical: width * 0.04,horizontal: width *0.04),
                  child:const Text("Apply Filter",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                ),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: width * 0.04,horizontal: width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Select Price Range:",textAlign: TextAlign.start,style: TextStyle(fontSize: width * 0.05,fontWeight: FontWeight.bold),),
              SizedBox(height: width * 0.04,),
            Obx(
              () {
                return RangeSlider(
                  values: currentRangeValues,
                  max: homeController.start.value.isNotEmpty?2000:  2000,
                  divisions: 5,
                  labels: RangeLabels(
                    homeController.start.value,
                    homeController.end.value,
                  ),
                  onChanged: (RangeValues values) {
                    setState(() {
                      currentRangeValues = values;
                      homeController.updateStart(currentRangeValues.start.toStringAsFixed(0));
                      homeController.updateEnd(currentRangeValues.end.toStringAsFixed(0));
                    });
                  },
                );
              }
            ),



              SizedBox(height: width * 0.04,),
              Text("Select Brand:",textAlign: TextAlign.start,style: TextStyle(fontSize: width * 0.05,fontWeight: FontWeight.bold),),
              SizedBox(height: width * 0.04,),
            Obx(
              () {
                return GridView.builder(
                  itemCount: homeController.filterList.length,
                  shrinkWrap: true,
                  primary: false,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                      homeController.filterList.isNotEmpty?3:
                      3,
                      childAspectRatio: 3.0,

                      crossAxisSpacing: 4.0,
                    mainAxisSpacing: width * 0.02,
                  ),
                  itemBuilder: (BuildContext context, int index){
                    return GestureDetector(
                      onTap: (){
    setState(() {
                    brand=homeController.filterList[index].id.toString();
                    print(homeController.filterList[index].id.toString());
                  });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical:width * 0.02,horizontal: width * 0.02),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: homeController.filterList[index].id.toString()==brand? Colors.blue[900]: Colors.grey
                        ),
                        child: Text(homeController.filterList[index].value.toString(),style:const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      ),
                    );
                  },
                );
              }
            ),
              SizedBox(height: width * 0.04,),
              Obx(
                () {
                  return
                    homeController.filterList1.isNotEmpty?

                    Text("Select Discount:",textAlign: TextAlign.start,style: TextStyle(fontSize: width * 0.05,fontWeight: FontWeight.bold),):SizedBox.shrink();
                }
              ),
              Obx(
                () {
                  return SizedBox(height:
                  homeController.filterList1.isNotEmpty?0:
                  width * 0.04,);
                }
              ),
              Obx(
                      () {
                    return
                      homeController.filterList1.isNotEmpty?


                      GridView.count(crossAxisCount: 3,
                        mainAxisSpacing: width * 0.02,
                        crossAxisSpacing: width * 0.02,
                        childAspectRatio:homeController.filterList1.isNotEmpty?3.0: 3.0,
                        physics:const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children:

                        homeController.filterList1.map((e)  =>

                            InkWell(
                              onTap: (){
                                setState(() {
                                  discount=e.value.toString();
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(vertical:width * 0.02,horizontal: width * 0.02),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: e.value.toString()==discount? Colors.blue[900]: Colors.grey
                                ),
                                child: Text(e.value.toString(),style:const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                              ),
                            )).toList(),
                      ):SizedBox();
                  }
              ),
              Obx(
                      () {
                    return SizedBox(height:
                    homeController.filterList2.isNotEmpty?0:
                    width * 0.04,);
                  }
              ),
              Obx(
                      () {
                    return
                      homeController.filterList2.isNotEmpty?

                      Text("Select Rating:",textAlign: TextAlign.start,style: TextStyle(fontSize: width * 0.05,fontWeight: FontWeight.bold),):SizedBox.shrink();
                  }
              ),              SizedBox(height: width * 0.04,),
              Obx(
                () {
                  return
                    homeController.filterList2.isNotEmpty?

                    GridView.count(crossAxisCount: 3,
                    mainAxisSpacing: width * 0.02,
                    crossAxisSpacing: width * 0.02,
                    childAspectRatio: 3.0,
                    physics:const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: homeController.filterList2.map((e) => InkWell(
                      onTap: (){
                        setState(() {
                          rating=e.id.toString();
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical:width * 0.02,horizontal: width * 0.02),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: e.id.toString()==rating? Colors.blue[900]: Colors.grey
                        ),
                        child: Text(e.value!.toString(),style:const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      ),
                    )).toList(),
                  ):SizedBox.shrink();
                }
              ),

              SizedBox(height: width * 0.04,),
              Text("Select Order Filter:",textAlign: TextAlign.start,style: TextStyle(fontSize: width * 0.05,fontWeight: FontWeight.bold),),
              SizedBox(height: width * 0.04,),
              SortedByDropDown(
                hint: "Select Order Filter",
                icon: null,
                fontSize: 13,
                hintColor: AppColor.blackColor.withOpacity(0.6),
                buttonWidth: Get.width,
                buttonHeight: Get.height * 0.055,
                dropdownItems: const [
                  "A - Z",
                  "Z - A",
                  "High to Low",
                  "Low to High",
                ],
                value: sortAll,

                dropdownWidth: Get.width * 0.93,
                buttonElevation: 0,
                onChanged: (value) {
                  setState(() {
                    sortAll = value;
                    if(value == "A - Z"){
                      homeController.updateOrderText("DESC");
                      homeController.updateSortText("pd.name");
                    }
                    else if(value == "Z - A"){
                      homeController.updateOrderText("ASC");
                      homeController.updateSortText("pd.name");
                    }
                    else if(value == "High to Low"){
                      homeController.updateOrderText("DESC");
                      homeController.updateSortText("p.price");
                    }
                    else if(value == "Low to High"){
                      homeController.updateOrderText("ASC");
                      homeController.updateSortText("p.price");
                    }
                  });
                },
              ),



              SizedBox(height: width * 0.04,),

            ],
          ),
        ),
      ),
    );
  }
}
