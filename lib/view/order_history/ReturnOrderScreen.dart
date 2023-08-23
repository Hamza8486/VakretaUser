import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vkreta/custom_widgets/social_button.dart';
import 'package:vkreta/custom_widgets/widgets.dart';
import 'package:vkreta/services/apiservice.dart';
import 'package:vkreta/view/home/controller/home_controller.dart';

import '../../models/MyOrderHistoryModel.dart';
bool isReturnAllLoading=false;
class ReturnOrderScreen extends StatefulWidget {
  final String order_id;
  final data;
  final Product product;
  final Status status;
  var qty;
   ReturnOrderScreen(
      {required this.product,
         this.qty,
        required this.data,
      required this.order_id,
      required this.status,
      Key? key})
      : super(key: key);

  @override
  State<ReturnOrderScreen> createState() => _ReturnOrderScreenState();
}

class _ReturnOrderScreenState extends State<ReturnOrderScreen> {
  bool valuesecond = false;
  final ImagePicker _picker = ImagePicker();
  List<File> list = [];
  TextEditingController title = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController telephone = TextEditingController();
  TextEditingController qty = TextEditingController();
  TextEditingController productName = TextEditingController();
  TextEditingController orderDate = TextEditingController();
  TextEditingController model = TextEditingController();

  TextEditingController paymentType = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController boxStatus = TextEditingController();
  TextEditingController bankCode = TextEditingController();
  TextEditingController bankName = TextEditingController();
  TextEditingController bankAccountNumber = TextEditingController();
  String label = "Title";
  var reason;

  List issueList = ["Product damaged, but shipping box OK",
  "Both product and shipping box damaged",
    "Wrong item was sent",
    "Item defective, spoilt, expired, or doesn't work",
    "Items or parts missing",
  ];
  String ?errorMsg;
  String comment ="";


  @override
  Widget build(BuildContext context) {
    final isKeyBoard = MediaQuery.of(context).viewInsets.bottom != 0;
    print("this is payment code ${widget.data.paymentCode.toString()}");
    print("this is payment code ${widget.qty.toString()}");
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Return Order Screen"),
      ),




      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: width * 0.04, horizontal: width * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: width * 0.02,
                    ),
                    Text("What is the issue with the item?",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,
                    fontSize: Get.height*0.02
                    ),),
                    SizedBox(
                      height: width * 0.04,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(7)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Obx(
                          () {
                            return
                              Get.put(HomeController()).isReturnLoading.value?loader(height: Get.height*0.1):


                              Get.put(HomeController()).returnList.isNotEmpty?

                              ListView.builder(
                              shrinkWrap: true,
                                primary: false,
                                padding: EdgeInsets.zero,
                                itemCount:Get.put(HomeController()).returnList.length ,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 14),
                                    child: GestureDetector(
                                      onTap: (){
                                       setState(() {

                                         reason =Get.put(HomeController()).returnList[index].returnReasonId.toString();
                                         comment =Get.put(HomeController()).returnList[index].name.toString();
                                         print(reason.toString());
                                       });
                                      },
                                      child: Container(
                                        color: Colors.transparent,
                                        child: Row(
                                          children: [
                                            reason ==Get.put(HomeController()).returnList[index].returnReasonId.toString()?
                                            Icon(Icons.check_box,color: Colors.black,):
                                            Icon(Icons.check_box_outline_blank,color: Colors.black,),
                                            SizedBox(width: Get.width*0.04,),
                                            Text(Get.put(HomeController()).returnList[index].name.toString())
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }):
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 40,),
                                  Center(
                                    child: Text("No Data",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,
                                        fontSize: Get.height*0.02
                                    ),),
                                  ),
                                ],
                              )
                            ;
                          }
                        ),
                      ),
                    ),
                    SizedBox(
                      height: width * 0.04,
                    ),
                    TextField(
                      controller: qty,
                      onChanged: (val){
                        if(int.parse(val)>int.parse(widget.qty)){
                          setState(() {
                            qty.clear();
                            print(val.toString());
                            showErrorToast("Quantity cannot be greater than");
                          });

                        }

                      },

                      decoration: InputDecoration(
                        labelText: "Quantity",


                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue.shade900, width: 2),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: width * 0.03,
                    ),
                    TextBox(title: telephone, label: "Telephone"),
                    widget.data.paymentCode=="cod"?
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: width * 0.04,
                        ),
                        TextBox(title: bankCode, label: "IFSC Code"),
                        SizedBox(
                          height: width * 0.04,
                        ),
                        TextBox(title: bankName, label: "Account Holder Name"),
                        SizedBox(
                          height: width * 0.04,
                        ),
                        TextBox(
                            title: bankAccountNumber, label: "Account Number"),
                      ],
                    ):SizedBox.shrink(),
                    SizedBox(
                      height: width * 0.04,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(color: Colors.grey)),
                      child: ListTile(
                        onTap: () async {
                          final XFile? image =
                              await _picker.pickImage(source: ImageSource.gallery);
                          if (image != null) {
                            setState(() {
                              list.add(File(image.path));
                            });
                          }
                        },
                        leading: const Icon(Icons.image),
                        title: const Text("Add Images"),
                      ),
                    ),
                    SizedBox(
                      height: width * 0.04,
                    ),
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: width * 0.04,
                        );
                      },
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: UniqueKey(),
                          onDismissed: (direction) {
                            list.removeAt(index);
                          },
                          child: Container(
                              height: width * 0.7,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.memory(
                                    list[index].readAsBytesSync(),
                                    fit: BoxFit.fill,
                                  ))),
                        );
                      },
                      shrinkWrap: true,
                      itemCount: list.length,
                    ),
                  ],
                ),
              ),
            ),
          ),
          isKeyBoard?SizedBox.shrink():
          Container(
            height: width * 0.3,
            padding: EdgeInsets.symmetric(
                vertical: width * 0.04, horizontal: width * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: width * 0.08,
                  child: Row(
                    children: [
                      Checkbox(
                        value: valuesecond,
                        onChanged: (value) {
                          setState(() {
                            valuesecond = value!;
                          });
                        },
                      ),
                      const Text("I accept all the term and Conditions"),
                    ],
                  ),
                ),
                Obx(
                        () {
                      return
                        Get.put(HomeController()).isLoading.value?
                        Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.black26,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.blue.shade900 //<-- SEE HERE

                              ),
                            )):
                        ElevatedButton(onPressed: (){
                          if(validatedeal(context)){
                            Get.put(HomeController()).updateLoading(true);
                            ApiService().orderReturn(
                                order_id: widget.order_id,
                                product_id: widget.product.productId.toString(),
                                comment: comment.toString(),
                                firstname: widget.data.name,
                                lastname: widget.data.name,
                                email: "email@gmail.com",
                                telephone: telephone.text,
                                date_ordered:
                                widget.data.dateAdded==null?"25/04/2023":
                                widget.data.dateAdded.toString(),
                                product: widget.product.productName.toString(),
                                model:  widget.product.productName.toString(),
                                payment_code: widget.data.paymentCode.toString(),
                                quantity: qty.text,
                                return_reason_id: reason.toString(),
                                opened:  "0",
                                bank_swift_code: bankCode.text,
                                bank_account_name: bankAccountNumber.text,
                                bank_account_number: bankAccountNumber.text,
                                agree: 1.toString(),
                                image: list, context: context);
                          }

                        }, child: const Text("Submit"));
                    }
                )

              ],
            ),
          ),
        ],
      ),
    );
  }
  bool validatedeal(BuildContext context) {

    if (comment=="") {
      showErrorToast( "Please select reason");
      return false;
    }

    if (telephone.text.isEmpty) {
      showErrorToast( "Please enter phone number");
      return false;
    }
    if (telephone.text.length<7) {
      showErrorToast( "Please enter valid phone number");
      return false;
    }


    return true;
  }
}

class TextBox extends StatelessWidget {
   TextBox({
    Key? key,
    required this.title,
    required this.label,
     this.onChange,
  }) : super(key: key);

  final TextEditingController title;
  final String label;
  Function(String?)? onChange;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: title,
      onChanged: onChange,
      decoration: InputDecoration(
        labelText: label,


        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue.shade900, width: 2),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2),
        ),
      ),
    );
  }
}
