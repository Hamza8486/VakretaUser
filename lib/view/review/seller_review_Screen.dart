import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vkreta/custom_widgets/widgets.dart';
import 'package:vkreta/models/MyOrderHistoryModel.dart';
import 'package:vkreta/services/apiservice.dart';

class SellerReviewScreen extends StatefulWidget {
  final String title;
  final String order_id;
  final Product product;
  final Status status;
  SellerReviewScreen(
      {required this.product,
      required this.order_id,
      required this.status,
      required this.title,
      Key? key})
      : super(key: key);

  @override
  State<SellerReviewScreen> createState() => _SellerReviewScreenState();
}

class _SellerReviewScreenState extends State<SellerReviewScreen> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  submitReview() {
    var response = ApiService()
        .sellerReview(
            seller_id: widget.status.sellerId!,
            order_id: widget.order_id,
            rating: rating.toString(),
            review_title: title.text,
            review_description: description.text)
        .then((value) {
      if (value['data'] != null) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.rightSlide,
          title: 'Thanks',
          desc: 'Thanks for your Feedback',
          btnOkColor: Colors.blue.shade900,
          btnOkOnPress: ()=>Navigator.of(context)..pop(),
        ).show();
      }
    });
  }

  double rating = 3;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(widget.title),
      ),
      bottomNavigationBar: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(
              vertical: width * 0.04, horizontal: width * 0.06),
          child: ElevatedButton(onPressed:submitReview, child:const Text("Submit"))),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.04, vertical: width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: width * 0.04,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Title",
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blue.shade900, width: 2),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                  ),
                ),
              ),
              SizedBox(
                height: width * 0.04,
              ),
              TextField(
                textAlignVertical: TextAlignVertical.top,
                maxLines: 10,
                decoration: InputDecoration(
                  labelText: "Review",
                  alignLabelWithHint: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blue.shade900, width: 2),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                  ),
                ),
              ),
              SizedBox(
                height: width * 0.06,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Rating: ",
                    style: TextStyle(
                        fontSize: width * 0.05, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: width * 0.04,
                  ),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: width * 0.06,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 1),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rate) {
                      setState(() {
                        rating = rate;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class ProductReviewScreen extends StatefulWidget {
  final String title;
  final String order_id;
  final Product product;
  final Status status;
  ProductReviewScreen(
      {required this.product,
        required this.order_id,
        required this.status,
        required this.title,
        Key? key})
      : super(key: key);

  @override
  State<ProductReviewScreen> createState() => _ProductReviewScreenState();
}

class _ProductReviewScreenState extends State<ProductReviewScreen> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  List<File>list=[];


  double rating = 3;
  @override
  Widget build(BuildContext context) {
    final isKeyBoard = MediaQuery.of(context).viewInsets.bottom != 0;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(widget.title),
      ),

      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.04, vertical: width * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: width * 0.04,
                    ),
                    TextField(
                      controller: title,
                      decoration: InputDecoration(
                        labelText: "Title",
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.blue.shade900, width: 2),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: width * 0.04,
                    ),
                    TextField(
                      controller: description,
                      textAlignVertical: TextAlignVertical.top,
                      maxLines: 10,
                      decoration: InputDecoration(
                        labelText: "Review",
                        alignLabelWithHint: true,
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.blue.shade900, width: 2),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: width * 0.06,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Rating: ",
                          style: TextStyle(
                              fontSize: width * 0.05, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: width * 0.04,
                        ),
                        RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: width * 0.06,
                          itemPadding: const EdgeInsets.symmetric(horizontal: 1),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rate) {
                            setState(() {
                              rating = rate;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: width * 0.04,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(color: Colors.grey)
                      ),
                      child: ListTile(
                        onTap: ()async{
                          final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                          if(image != null){
                            setState(() {
                              list.add(File(image.path));
                            });
                          }
                        },
                        leading:const Icon(Icons.image),
                      title:const Text("Add Images"),
                      ),
                    ),
                    SizedBox(height: width * 0.04,),
                    ListView.separated(
                      physics:const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context,index){
                        return SizedBox(height: width * 0.04,);
                      },
                      itemBuilder: (context,index){
                        return Dismissible(
                          key: UniqueKey(),
                          onDismissed: (direction){
                            list.removeAt(index);
                          },
                          child: Container(
                              height: width * 0.7,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.memory(list[index].readAsBytesSync(),fit: BoxFit.fill,))),
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
            width: Get.width,
              color: Colors.white,
              padding: EdgeInsets.symmetric(
                  vertical: width * 0.04, horizontal: width * 0.06),
              child: ElevatedButton(onPressed:(){
                loader();
                ApiService().productReview(

                    order_id: widget.order_id,
                    sellerId:widget.status.sellerId.toString() ,
                    productId: widget.product.productId.toString(),
                    rating: rating.toString(),
                    review_title: title.text,
                    image:list, context: context);
              }, child:const Text("Submit"))),
          SizedBox(height: Get.height*0.01,),
        ],
      ),
    );
  }
}

