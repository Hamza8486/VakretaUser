import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vkreta/custom_widgets/social_button.dart';
import 'package:vkreta/custom_widgets/widgets.dart';
import 'package:vkreta/getx_controllers/homepage.dart';
import 'package:vkreta/view/address/addaddress.dart';
import 'package:vkreta/view/address/editaddress.dart';
import 'package:vkreta/models/listaddressModel.dart';
import 'package:vkreta/services/apiservice.dart';
import 'package:vkreta/view/home/controller/home_controller.dart';

class ModifyYourAddress extends StatefulWidget {
   ModifyYourAddress({Key? key,this.data,this.id}) : super(key: key);
  var data;
  var id;

  @override
  State<ModifyYourAddress> createState() => _ModifyYourAddressState();
}

class _ModifyYourAddressState extends State<ModifyYourAddress> {
  final snapshot = Get.put(HomePage());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back, color: Colors.black, size: 25)),
          backgroundColor: Colors.white,
          elevation: 0.5,
          title: Text(
            widget.data == "select"?"Select Address":
            'Set Address',
            style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 16,
            fontWeight: FontWeight.w700

            )),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: IconButton(
                onPressed: () async {
                  ListAddressModel newAddress = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddAddress(
                          default_: 1,
                        )),
                  );
                  setState(() {

                  });
                },
                icon: Icon(
                  Icons.add,
                  color: Colors.blue.shade900,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Obx(
            () {
              return
                snapshot.isAddressLoading.value?loader():
                    snapshot.addressList.isNotEmpty?

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    for (int i = 0; i < snapshot.addressList.length; ++i)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: GestureDetector(
                        onTap:widget.data=="biling"?(){
                          Get.put(HomeController()).updatePaymentId(snapshot.addressList[i].addressId.toString());
                          print("object");

                          successToast("Address Selected");
                          Navigator.pop(context);
                        }:
                        widget.data == "select"?
                            (){
                              Get.put(HomeController()).shippingData(id:snapshot.addressList[i].addressId.toString() );
                          Get.put(HomeController()).updateFirst("${snapshot.addressList[i].firstname??""} ${snapshot.addressList[i].lastname??""}");
                          Get.put(HomeController()).updateAddressId(snapshot.addressList[i].addressId.toString());
                          Get.put(HomeController()).updatePhone(snapshot.addressList[i].telephone.toString());
                          Get.put(HomeController()).updateaddressAll("${snapshot.addressList[i].address1} ${snapshot.addressList[i].address2}");
                          Get.put(HomeController()).updatecountryAll(snapshot.addressList[i].country.toString());
                          Get.put(HomeController()).updatecityAll(snapshot.addressList[i].city.toString());
                          Get.put(HomeController()).updatestateAll(snapshot.addressList[i].zone.toString());
                          Get.put(HomeController()).updatepinAll(snapshot.addressList[i].postcode.toString());
                          Get.put(HomeController()).updateCompany(snapshot.addressList[i].company.toString());
                          Get.back();

                        }:(){},
                        child: Container(
                          height: 210,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: Colors.grey.shade300, spreadRadius: 3, blurRadius: 5)]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    Text(
                                       "${snapshot.addressList[i].firstname??""} ${snapshot.addressList[i].lastname??""}",
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            color: Colors.grey.shade900,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  snapshot.addressList[i].company??"",
                                  style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,)),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                      "${snapshot.addressList[i].address1} ${snapshot.addressList[i].address2}",
                                        style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 14, fontWeight: FontWeight.w600,)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    Text(
                                      "${snapshot.addressList[i].city.toString()} ${snapshot.addressList[i].zone.toString()}",
                                      style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 14,fontWeight: FontWeight.w600)),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    Text(
                                      snapshot.addressList[i].country??"",
                                      style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 14,fontWeight: FontWeight.w600)),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(EditAddress(
                                          object: snapshot.addressList[i],
                                          default_: 1,
                                        ));
                                      },
                                      child: Text(
                                        'Edit',
                                        style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.blue.shade900, fontWeight: FontWeight.bold, fontSize: 15)),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    snapshot.addressList.length==1?SizedBox.shrink():
                                    InkWell(
                                      onTap: () async {
                                        final delete = await ApiService().deletAddress(int.parse(snapshot.addressList[i].addressId.toString()));
                                        // print(delete);
                                        // String? error = '';
                                        // // print(signUp.firstname);
                                        // // signUp.then((value){
                                        // if (delete.error != null) {
                                        //   error = delete.error;
                                        // }
                                        // });

                                        // snapshot.data!
                                        //     .products.remove(index);

                                        // print error if found from api
                                        // if (error != '') {
                                        //   ScaffoldMessenger.of(context)
                                        //       .showSnackBar(SnackBar(
                                        //     content: Text(error!),
                                        //     backgroundColor: Colors.red,
                                        //   ));
                                        // }
                                        if (delete.success != null) {
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                            content: Text('Address deleted successfully'),
                                            backgroundColor: Colors.green,
                                          ));

                                          setState(() {
                                            snapshot.addressList.removeAt(i);
                                          });
                                        }
                                      },
                                      child: Text(
                                        'Delete',
                                        style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.blue.shade900, fontWeight: FontWeight.bold, fontSize: 15)),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ):Column(
                      children: [
                        SizedBox(height: Get.height*0.37,),
                        Center(
                          child: GestureDetector(
                            onTap: (){
                              snapshot.addressData();
                            },
                            child: Text("No Data",
                            style: TextStyle(color: Colors.black,fontSize: Get.height*0.025,),
                            ),
                          ),
                        )
                      ],
                    );
            }
          ),
        ));
  }
}
