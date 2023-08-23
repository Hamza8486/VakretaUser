import 'dart:convert';
import 'dart:io';
import "package:async/async.dart";
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vkreta/controllers/categoryController.dart';
import 'package:vkreta/controllers/pin_model.dart';
import 'package:vkreta/custom_widgets/social_button.dart';
import 'package:vkreta/custom_widgets/widgets.dart';
import 'package:vkreta/getx_controllers/homepage.dart';
import 'package:vkreta/getx_controllers/productInfo.dart';
import 'package:vkreta/models/MyOrderHistoryModel.dart';
import 'package:vkreta/models/WishlistModel.dart';
import 'package:vkreta/models/addorderModel.dart';
import 'package:vkreta/models/addtowishlistModel.dart';
import 'package:vkreta/models/bages_model.dart';
import 'package:vkreta/models/cartlistModel.dart';
import 'package:vkreta/models/carttotalModel.dart';
import 'package:vkreta/models/countryModel.dart';
import 'package:vkreta/models/customdetail.dart';
import 'package:vkreta/models/deleteaddressModel.dart';
import 'package:vkreta/models/homemodel.dart';
import 'package:vkreta/models/listaddressModel.dart';
import 'package:vkreta/models/new_return.dart';
import 'package:vkreta/models/orderinfordetailModel.dart';
import 'package:vkreta/models/orderreturnaddModel.dart';
import 'package:vkreta/models/orderreturnsaveModel.dart';
import 'package:vkreta/models/phone_model.dart';
import 'package:vkreta/models/removecartitemModel.dart';
import 'package:vkreta/models/removeproductmodel.dart';
import 'package:vkreta/models/reviewModel.dart';
import 'package:vkreta/models/searchModel.dart';
import 'package:vkreta/models/sellerratingModel.dart';
import 'package:vkreta/models/shipping_model.dart';
import 'package:vkreta/models/signupmodel.dart';
import 'package:vkreta/models/updatecartquantityModel.dart';
import 'package:vkreta/models/zoneModel.dart';
import 'package:vkreta/new/model.dart';
import 'package:vkreta/response/sugest_api_response.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:vkreta/view/home/controller/home_controller.dart';
import 'package:vkreta/view/home/controller/reviews.dart';
import 'package:vkreta/view/home/controller/seller_model.dart';
import 'package:vkreta/view/home/selectscreen.dart';
import 'package:vkreta/view/login_signup/forget_otp.dart';
import 'package:vkreta/view/login_signup/login.dart';
import 'package:vkreta/view/otp.dart';

import '../models/cartModel.dart';
import '../models/coupon_moder.dart';
import '../models/forgotpasswordmodel.dart';
import '../models/loginmodel.dart';
import '../models/paymentmethodList.dart';
import '../models/productdetailModel.dart';
import '../models/return_model.dart';
import '../response/search_products_response.dart';
import 'package:dio/dio.dart' as dio;

import '../view/order_history/ReturnOrderScreen.dart';

class ApiService {
  static var client = http.Client();
  static Uri uriPath({required String nameUrl}) {
    return Uri.parse("https://www.vkreta.com/index.php?" + nameUrl);
  }
  final log = Logger();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  String basicAuth_username = 'mobile_API';
  String basicAuth_password =
      'A4kNlBvMYLpBRwzVuvY8oyVJaHdehe7wyAJDXaT5dUSD7sWKKErT7wpJurwa7ViByfQMLfX6gy7EL8PRbCWtjN4rwjmUcbAEb62dwN14m8ksdcL2DAaNKhsSUvGWaEpN6ywVKZRiBXLsCHHf86Bltxz3zRC1vpPAZZooVNw3HtUCwWmwK2xoKtsWiVUxnNc1CbLvLWt1JkmkZfNhcMP0VdMLxwSPleAGTTi5APr1Lh4gzxCRM4QdrC5UzIbRuqjS';
  // Future<AuthResponse> loginWithGoogle() async {
  //   late AuthResponse response;
  //   try {
  //     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
  //     final GoogleSignInAuthentication googleAuth =
  //         await googleUser!.authentication;
  //     log.d('accessToken => ${googleAuth.accessToken!}');
  //     log.d('idToken => ${googleAuth.idToken!}');

  //     log.d('googleUser ==================> ${googleAuth.accessToken}');

  //     response = await _dbService.loginWithGoogle(googleAuth.accessToken!);
  //     if (response.success) {
  //       if (response.success) {
  //         _localStorageService.accessToken = response.accessToken;

  //         // isNotificationTurnOn = _localStorageService.notificationFlag != null;
  //         //await _getUserProfile();
  //         //if (isNotificationTurnOn) await _updateFcmToken();
  //       }
  //     }
  //     return response;
  //   } catch (e) {
  //     log.e('Exception @signUpWithGoogle: $e');
  //   }
  //   return response;
  // }

  Future userRegister(
      String firstname,
      String lastname,
      String email,
      String telephone,
      String password,
      String confirm,
      dynamic newsletter) async {
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final loginUrl =
    Uri.parse("https://www.vkreta.com/index.php?route=api/register");
    final response = await http.post(loginUrl, headers: {
      'authorization': basicAuth
    }, body: {
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'telephone': telephone,
      'password': password,
      'confirm': confirm,
      'newsletter': newsletter,
    });
    if (response.statusCode == 200 || response.statusCode == 201) {
      var jsonString = jsonDecode(response.body);

      print(response.body);
      if (jsonString["warning"] ==
          "Warning: E-Mail Address is already registered!") {
        Get.back();
        showErrorToast("Warning: E-Mail Address is already registered!");
      } else {
        print(response.toString());
        successToast("Account Created Successfully!");

        Get.offAll(LoginScreen());

        // Get.toNamed("/OtpScreen");
      }
    }
    // print(response.statusCode.toString());
    // print(response.body.toString());
    RegisterModel _model = registerModelFromJson(response.body);
    // print(_model);
    return _model;
    // return json.decode(response.body);
  }

  Future userLogin(
      String email, String password, String deviceId, context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final loginUrl =
    Uri.parse("https://www.vkreta.com/index.php?route=api/loginverify");
    final response = await http.post(loginUrl, headers: {
      'authorization': basicAuth
    }, body: {
      'email': email,
      'password': password,
      'device_id': deviceId,
    });

    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);

      if (jsonString["error"].toString() == "Mail id not exist!") {
        Get.back();
        showErrorToast("Mail id not exist!");

      }

      else if(jsonString["error"].toString() == "Incorrect password"){
        Get.back();
        showErrorToast("Incorrect password");
      }


      else {
        print(response.toString());
        print(jsonString["telephone"]);

        getPhoneResponse(phone:jsonString["telephone"].toString() );
        Provider.of<BadgesModel>(context, listen: false).email = email;

      }
    }

    LoginModel _model = loginModelFromJson(response.body);
    return _model;
  }










  Future checkPinCode({id,context,pincode}) async {
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final pinUrl =
    Uri.parse("https://www.vkreta.com/index.php?route=extension/module/shipping_charge/checkpincode");
    final response = await http.post(pinUrl, headers: {
      'authorization': basicAuth
    }, body: {
      'product_id': id.toString(),
      'pincode': pincode.toString(),
    });

    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      print(response.body);

      if (jsonString["mess"].toString() == "Not Available.") {
        Get.back();
        Get.put(CategoryController()).updateText("");
        Get.put(CategoryController()).updateCode("");
        showErrorToast(jsonString["mess"].toString());

      }
      else  {
        Get.back();
        Get.put(CategoryController()).updateText(jsonString["mess"].toString());
        successToast(jsonString["mess"].toString());
      }
      //
      // else if(jsonString["error"].toString() == "Incorrect password"){
      //   Get.back();
      //   showErrorToast("Incorrect password");
      // }
      //
      //
      // else {
      //   print(response.toString());
      //   print(jsonString["telephone"]);
      //
      //   getPhoneResponse(phone:jsonString["telephone"].toString() );
      //
      // }
    }


  }




  Future<List<SellerModel>?> getSellerResponse({id}) async {
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    var response = await client.get(uriPath(nameUrl: "route=common/other_seller_product/othersellerproductapi&product_id=${id.toString()}"),
      headers: {

        'authorization': basicAuth
      },);

    if (response.statusCode == 200) {
      print(response.body);
      var jsonString = jsonDecode(response.body);
      return sellerModelFromJson(response.body);
    } else if(response.statusCode == 202) {

      var jsonString = jsonDecode(response.body);

      // Get.back();

      print(response.body);

      //show error message
      return null;
    }
  }







  Future forgotPssword(
      String email,
      context,
      ) async {
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final loginUrl = Uri.parse(
        "https://www.vkreta.com/index.php?route=api/checkUser/forgotPasswordApi");
    final response = await http.post(
      loginUrl,
      headers: {'authorization': basicAuth},
      body: {
        'telephone_email': email,
      },
    );
    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);

      if (jsonString["error"].toString() == "We cannot find an account with that mobile number") {
        Get.back();
        showErrorToast("We cannot find an account with Id");

      }

      else {
        print(response.toString());

        getPhoneResponseAll(phone:email.toString() );
        Provider.of<BadgesModel>(context, listen: false).email = email;

      }
    }

    print(response.statusCode.toString());
    print(response.body.toString());
    ForgotPasswordModel _model = forgotpasswordModelFromJson(response.body);

    print(_model);
    return _model;
    // return json.decode(response.body);
  }

  Future<PhoneModel?> getPhoneResponse({phone}) async {
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    var response = await client.get(
      uriPath(nameUrl: "route=api/checkUser/sendsms&telephone=${phone}"),
      headers: {'authorization': basicAuth},
    );
    debugPrint(response.body);
    if (response.statusCode == 200) {

      var jsonString = jsonDecode(response.body);
      Get.back();
      print(jsonString["otp"]);
      showErrorToast("Please verify your number/email!");
      Get.to(EnterOtp(data:phone.toString() ,otp:jsonString["otp"].toString() ,));

      return phoneModelFromJson(response.body);
    } else {
      //show error message
      return null;
    }
  }



  Future<PhoneModel?> getPhoneResponseAll({phone}) async {
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    var response = await client.get(
      uriPath(nameUrl: "route=api/checkUser/sendsms&telephone=${phone}"),
      headers: {'authorization': basicAuth},
    );
    debugPrint(response.body);
    if (response.statusCode == 200) {

      var jsonString = jsonDecode(response.body);
      Get.back();
      print(jsonString["otp"]);
      showErrorToast("Please verify your number/email!");
      Get.to(ForgetOtpView(data:phone.toString() ,otp:jsonString["otp"].toString() ,));

      return phoneModelFromJson(response.body);
    } else {
      //show error message
      return null;
    }
  }
  Future changePassword(String email, String password) async {
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final loginUrl =
    Uri.parse("https://www.vkreta.com/index.php?route=api/reset");
    // print(0);
    final response = await http.post(loginUrl,
        headers: {'authorization': basicAuth},
        body: {'telephone_email': email, 'password': password});
    // print(0);
    // print(response.statusCode.toString());
    // // print(response.body.toString());
    return json.decode(response.body);
    // print(_model);
  }





  Future changeForgetPassword(String email, String password) async {
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final loginUrl =
    Uri.parse("https://www.vkreta.com/index.php?route=api/reset");
    // print(0);
    final response = await http.post(loginUrl,
        headers: {'authorization': basicAuth},
        body: {'telephone_email': email, 'password': password});
    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      successToast("Password has been update");
      Get.offAll(LoginScreen());

      print(jsonString.toString());
      print(response.body);
      //Get.offAll(SelectScreen());

    }
    return json.decode(response.body);
    // print(_model);
  }

  Future verifyResponse(
      String phone,
      ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final loginUrl = Uri.parse(
        "https://www.vkreta.com/index.php?route=api/checkUser");
    final response = await http.post(
      loginUrl,
      headers: {'authorization': basicAuth},
      body: {
        'telephone': phone,
      },
    );
    print(response.statusCode.toString());
    print(response.body.toString());
    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      HelperFunctions.saveInPreference("userId", jsonString["success"].toString());
      // HelperFunctions.saveInPreference("id", jsonString["address"]["address_id"].toString());
      // HelperFunctions.saveInPreference("name", jsonString["address"]["firstname"].toString());
      // HelperFunctions.saveInPreference("address1", jsonString["address"]["address_1"].toString());
      // HelperFunctions.saveInPreference("address2", jsonString["address"]["address_2"].toString());
      // HelperFunctions.saveInPreference("city", jsonString["address"]["city"].toString());
      // HelperFunctions.saveInPreference("country", jsonString["address"]["country"].toString());
      // HelperFunctions.saveInPreference("postalcode", jsonString["address"]["postcode"].toString());
      prefs.setInt(
          'customer_id', int.parse(jsonString["success"].toString()));
      print(jsonString.toString());
      print(response.body);
      Get.offAll(SelectScreen());

    }
    ForgotPasswordModel _model = forgotpasswordModelFromJson(response.body);
    print(_model);
    return _model;

    // return json.decode(response.body);
  }


  Future verifyForgetResponse(
      String phone,
      ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final loginUrl = Uri.parse(
        "https://www.vkreta.com/index.php?route=api/checkUser");
    final response = await http.post(
      loginUrl,
      headers: {'authorization': basicAuth},
      body: {
        'telephone': phone,
      },
    );
    print(response.statusCode.toString());
    print(response.body.toString());
    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);

      print(jsonString.toString());
      print(response.body);
      //Get.offAll(SelectScreen());

    }
    ForgotPasswordModel _model = forgotpasswordModelFromJson(response.body);
    print(_model);
    return _model;

    // return json.decode(response.body);
  }











  Future<List<ViewAllModel>> viewAll(String preset, String page) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    final data = Get.put(ProductList());
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final loginUrl = Uri.parse(
        "https://www.vkreta.com/index.php?route=api/home/products&preset=$preset&page=$page&customer_id=${customer_id.toString()}");
    final response = await http.post(
      loginUrl,
      headers: {'authorization': basicAuth},
    );
    print(loginUrl);
    var object = jsonDecode(response.body);
    print(response.statusCode.toString());

    if (int.parse(page) == 1) {
      data.product.clear();
      for (var i in object) {
        data.product.add(ViewAllModel.fromJson(i));
      }
    } else {
      for (var i in object) {
        data.product.add(ViewAllModel.fromJson(i));
      }
    }
    return data.product;
    // return json.decode(response.body);
  }

  Future<List<ViewAllModel>> otherSellerSameProduct(
      {required String productId, required String picCode}) async {
    final data = Get.put(SameProduct());
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final loginUrl = Uri.parse(
        "https://www.vkreta.com/index.php?route=common/other_seller_product/othersellerproductapi&product_id=$productId&pincode=$picCode");
    final response = await http.get(
      loginUrl,
      headers: {'authorization': basicAuth},
    );
    var object = jsonDecode(response.body);
    print(response.statusCode.toString());

    return data.product;
    // return json.decode(response.body);
  }



//home api

  Future getAboutUs({String ?id}) async {
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final allAboutUs = Uri.parse(
        "https://www.vkreta.com/index.php?route=api/info&information_id=${id==null?"5":id.toString()}");
    final response = await http.get(
      allAboutUs,
      headers: {'authorization': basicAuth},
    );
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }
  Future getProductList(String id,String page) async {
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final allAboutUs = Uri.parse(
        "https://www.vkreta.com/index.php?route=api/product&path=$id&sort=pd.name&order=ASC&page=$page");
    final response = await http.get(
      allAboutUs,
      headers: {'authorization': basicAuth},
    );
    print(allAboutUs);
    print(response.body);
    return json.decode(response.body);
  }

  Future getPrivacyPolicy() async {
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final allPrivayPolicy = Uri.parse(
        "https://www.vkreta.com/index.php?route=api/info&information_id=3");
    final response = await http.get(
      allPrivayPolicy,
      headers: {'authorization': basicAuth},
    );
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }

  Future getOrderTrack(
      {required String orderId,
      required String productId,
      required String sellerId}) async {
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    final allPrivayPolicy = Uri.parse(
        "https://www.vkreta.com/index.php?route=api/ordernew/trackorder&order_id=$orderId&seller_id=$sellerId&customer_id=$customer_id&product_id=$productId");
    final response = await http.get(
      allPrivayPolicy,
      headers: {'authorization': basicAuth},
    );
    print(allPrivayPolicy);
    print(response.body);
    return json.decode(response.body);
  }

  Future<dynamic> cancelOrder(
      {required String orderId,
      required String productId,
      required String sellerId}) async {
    //final data= Get.put(SameProduct());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final loginUrl = Uri.parse(
        "https://www.vkreta.com/index.php?route=api/ordernew/cancelProduct&order_id=$orderId&seller_id=$sellerId&product_id=$productId&customer_id=$customer_id");
    final response = await http.post(
      loginUrl,
      headers: {'authorization': basicAuth},
    );
    var object = jsonDecode(response.body);
    print(response.statusCode.toString());
    if(response.statusCode == 200){
      successToast("Order has been cancelled");
    }

    return jsonDecode(response.body);
    // return json.decode(response.body);
  }

  Future getTermsCondition() async {
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final allTermsCondition = Uri.parse(
        "https://www.vkreta.com/index.php?route=api/info&information_id=5");
    final response = await http.get(
      allTermsCondition,
      headers: {'authorization': basicAuth},
    );
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }

  Future sellerReview(
      {required String seller_id,
      required String order_id,
      required String rating,
      required String review_title,
      required String review_description}) async {
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    final allTermsCondition = Uri.parse(
        "https://www.vkreta.com/index.php?route=api/productdetail/ordersellerreview");

    final response = await http.post(
      allTermsCondition,
      body: {
        "customer_id": customer_id.toString(),
        "seller_id": seller_id,
        "order_id": order_id,
        "rating": rating,
        "review_title": review_title,
        "review_description": review_description,
      },
      headers: {'authorization': basicAuth},
    );
    print(response.statusCode);
    print(response.body);
    return json.decode(response.body);
  }



  productReview(
      {List<dynamic>? image,
        required String productId,
        required String order_id,
        required String rating,
        required String review_title,
        required String sellerId,

        required BuildContext context}) async {
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customerId = prefs.getInt('customer_id');
    try {
      late dio.MultipartFile x, lisenceFile;

      List<dio.MultipartFile> multiPartPics = [];

      if (image != null) {
        for (var i = 0; i < image.length; i++) {
          multiPartPics.add(await dio.MultipartFile.fromFile(image[i].path));
        }
      }
      try {
        /*Map data*/ dio.FormData data = dio.FormData.fromMap({
          'seller_id': sellerId.toString(),
          'order_id': order_id.toString(),
          'customer_id' : customerId.toString(),
          'product_id' : productId.toString(),
          'rating' : rating,
          'text' : review_title.toString(),
          'review_image[0]' : multiPartPics,

        });

        print("Data::::: ${data.fields}");
        print("Data::::: ${data.fields}");




        var response = await dio.Dio().post(
            "https://www.vkreta.com/index.php?route=api/productdetail/orderproductreview",
            data: data,

            options: dio.Options(headers: {'authorization': basicAuth},));
        print(response.toString());
        if (response.statusCode == 200 || response.statusCode == 201) {


          print(response.data.toString());
          if(response.data["error"]=="Already send you feedback so not allow a second time"){
            showErrorToast("Already send you feedback so not allow a second time");
          }
          else{
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

        }
      } on dio.DioError catch (e) {
        print("object");
        Get.back();
        isReturnAllLoading=false;
        showErrorToast(e.response!.data["error"].toString());

        //Get.to(ErrorMessage(data:e.response?.data ,));
        print(e.response.toString());
        print(e.response?.statusCode.toString());

      }
    } on dio.DioError catch (e) {
      // Get.to(ErrorMessage(data:e.response?.data ,));
      print("objectsss");
      Get.back();
      isReturnAllLoading=false;
      showErrorToast(e.response!.data["error"].toString());
      print(e.response.toString());
      print(e.response?.statusCode.toString());

      print(e.toString());
    }
  }









  orderReturn(
      {List<dynamic>? image,
        required String order_id,
        required String product_id,
        required String comment,
        required String firstname,
        required String lastname,
        required String email,
        required String telephone,
        required String date_ordered,
        required String product,
        required String model,
        required String payment_code,
        required String quantity,
        required String return_reason_id,
        required String opened,
        required String bank_swift_code,
        required String bank_account_name,
        required String bank_account_number,
        required String agree,
        required BuildContext context}) async {
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customerId = prefs.getInt('customer_id');
    try {
      late dio.MultipartFile x, lisenceFile;

      List<dio.MultipartFile> multiPartPics = [];

      if (image != null) {
        for (var i = 0; i < image.length; i++) {
          multiPartPics.add(await dio.MultipartFile.fromFile(image[i].path));
        }
      }
      try {
        /*Map data*/ dio.FormData data = dio.FormData.fromMap({
       'order_id': order_id.toString(),
        'customer_id' : customerId.toString(),
        'product_id' : product_id,
        'comment' : comment,
        'firstname' : firstname,
        'lastname' : lastname,
       'email' : email,
        'telephone' : telephone,
        'date_ordered' : date_ordered,
        'product' : product,
        'model':Get.put(HomeController()).model.value.toString(),
       'payment_code' : payment_code,
        'quantity' : quantity,
        'return_reason_id' : return_reason_id,
        'opened' : opened,
        'bank_swift_code' : bank_swift_code,
        'bank_account_name': bank_account_name,
       'bank_account_number' : bank_account_number,
        'agree' : agree,
        'images[0]' : multiPartPics,


        });
        print(multiPartPics.length);
        print(multiPartPics.length);

        print("Data::::: ${data.fields}");
        print("Data::::: ${data.fields}");




        var response = await dio.Dio().post(
            "https://www.vkreta.com/index.php?route=api/ordernew/returnorder",
            data: data,

            options: dio.Options(headers: {'authorization': basicAuth},));
        print(response.toString());
        if (response.statusCode == 200 || response.statusCode == 201) {

          if(response.data["success"]=="<p>Thank you for submitting your return request. Your request has been sent to the relevant department for processing.</p><p> You will be notified via e-mail as to the status of your request.</p>"){
            AwesomeDialog(
              context: context,
              dialogType: DialogType.success,
              animType: AnimType.rightSlide,
              title: 'Congratulation',
              desc: 'Your Request Successfully saved',
              btnOkColor: Colors.blue.shade900,
              btnOkOnPress: ()=>Navigator.of(context)..pop(),
            ).show();
            isReturnAllLoading=false;
            Get.put(HomeController()).updateLoading(false);

            isReturnAllLoading=false;


            print("Hamza true");

          }else if(response.data=="error"){
            print("Hamza false");
            showErrorToast(response.data.toString());
            isReturnAllLoading=false;
            Get.put(HomeController()).updateLoading(false);
            isReturnAllLoading=false;

          }
          print(response.data.toString());
          showErrorToast(response.data.toString());
          Get.put(HomeController()).updateLoading(false);
        }
      } on dio.DioError catch (e) {
        print("object");
        Get.put(HomeController()).updateLoading(false);
        isReturnAllLoading=false;
        showErrorToast(e.response!.data["error"].toString());

        //Get.to(ErrorMessage(data:e.response?.data ,));
        print(e.response.toString());
        print(e.response?.statusCode.toString());

      }
    } on dio.DioError catch (e) {
      // Get.to(ErrorMessage(data:e.response?.data ,));
      print("objectsss");
      Get.put(HomeController()).updateLoading(false);
      isReturnAllLoading=false;
      showErrorToast(e.response!.data["error"].toString());
      print(e.response.toString());
      print(e.response?.statusCode.toString());

      print(e.toString());
    }
  }

  Future getPageScreenData(int id) async {
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final data = Uri.parse(
        "https://www.vkreta.com/index.php?route=api/info&information_id=" +
            id.toString());
    final response = await http.get(
      data,
      headers: {'authorization': basicAuth},
    );
    // print(response.statusCode);
    // print(response.body);
    return json.decode(response.body);
  }

  Future<HomeScreenModel> getHome({pinCode = ""}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final data = Uri.parse("https://www.vkreta.com/index.php?route=api/home&pincode=$pinCode&customer_id=${customer_id.toString()}");
    final response = await http.get(
      data,
      headers: {'authorization': basicAuth},
    );
    print(data);
    //  print(response.statusCode);
    print(response.body);
    final homeModel = HomeScreenModel.fromJson(jsonDecode(response.body));
    return homeModel;
  }

  Future getSearchSugest(String text) async {
    // String basicAuth = 'Basic ' +
    //     base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    // final data = Uri.parse("https://www.vkreta.com/index.php?route=api/home");
    // final response = await http.get(
    //   data,
    //   headers: {'authorization': basicAuth},
    // );
    // //  print(response.statusCode);
    // // print(response.body);
    // return json.decode(response.body);
  }

  Future getcustomerDetail() async {
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    // print(customer_id);

    final loginUrl =
        Uri.parse("https://www.vkreta.com/index.php?route=api/cutomerInfo");
    final response = await http.post(loginUrl, headers: {
      'authorization': basicAuth
    }, body: {
      'customer_id': customer_id.toString(),
    });

    // check if data is comming proced
    // otherwise snakbar error

    // print(response.statusCode.toString());
    // print(response.body.toString());
    CustomerDetailModel _model = customerDetailModelFromJson(response.body);
    prefs.setString('firstname', _model.firstname.toString());
    prefs.setString('lastname', _model.lastname.toString());
    prefs.setString('phone', _model.phone.toString());
    prefs.setString('email', _model.email.toString());

    // print(response.body);
    return _model;
    // return json.decode(response.body);
  }




  Future lastSearchAdd({prodId}) async {
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    // print(customer_id);

    final loginUrl =
    Uri.parse("https://www.vkreta.com/index.php?route=api/home/last_search_add");
    final response = await http.post(loginUrl, headers: {
      'authorization': basicAuth
    }, body: {
      'customer_id': customer_id.toString(),
      'product_id': prodId.toString(),
    });
    if(response.statusCode==200){
      Get.put(CategoryController()).getHomeData();
      Get.put(CategoryController()).getHomeData();
    }


    // print(response.body);
    return json.decode(response.body);
    // return json.decode(response.body);
  }



  Future addAddress(
    String firstname,
    String lastname,
    String company,
    String address_1,
    String address_2,
    String city,
    String postcode,
    int country_id,
    int zone_id,
    int _default,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final loginUrl = Uri.parse(
        "https://www.vkreta.com/index.php?route=api/cutomerInfo/address_add");
    // print(0);
    final response = await http.post(loginUrl, headers: {
      'authorization': basicAuth
    }, body: {
      'customer_id': customer_id.toString(),
      'firstname': firstname.toString(),
      'lastname': lastname.toString(),
      'company': company.toString(),
      'address_1': address_1.toString(),
      'address_2': address_2.toString(),
      'city': city.toString(),
      'postcode': postcode.toString(),
      'country_id': country_id.toString(),
      'zone_id': zone_id.toString(),
      '_default': '1',
    });
    // print(0);
    // print(response.statusCode.toString());
    // print(response.body.toString());
    return json.decode(response.body);
    // print(_model);
  }

  Future<WishlistModel> getWishlist(int product_id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final wishlist =
        Uri.parse("https://www.vkreta.com/index.php?route=api/wishlist");
    final response = await http.post(wishlist, headers: {
      'authorization': basicAuth
    }, body: {
      'customer_id': customer_id.toString(),
    });
    // var data= jsonDecode(response.body.toString());

    // print("response.body1");
    // print("response.body2");
    WishlistModel _model = wishlistModelFromJson(response.body);
    // print("response.body3");
    return _model;
  }

  Future<ProductDetailModel> getProductDetail(int product_id) async {
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final wishlist = Uri.parse(
        "https://www.vkreta.com/index.php?route=api/productdetail&product_id=${product_id.toString()}");
    final response = await http
        .post(wishlist, headers: {'authorization': basicAuth}, body: {});

    print("wishlist ---------->> $wishlist");
    print("response.body --------------->>${response.body}");

    ProductDetailModel _model = productDetailModelFromJson(response.body);
    print("response.body --------------->>${_model}");
    return _model;
  }

  //
  Future googleLogin(String email, String firstname) async {
    List name = firstname.split(' ');
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final loginUrl = Uri.parse(
        "https://www.vkreta.com/index.php?route=api/register/googleRegisterOrLogin");
    final response = await http.post(loginUrl, headers: {
      'authorization': basicAuth
    }, body: {
      'email': email.toString(),
      'firstname': firstname.toString(),
      'lastname': name[1],
    });
    var data = jsonDecode(response.body);

    return data;
  }

  // Future userLogin(
  //   String email,
  //   String password,
  // ) async {
  //   String basicAuth = 'Basic ' +
  //       base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
  //   final loginUrl =
  //       Uri.parse("https://www.vkreta.com/index.php?route=api/loginverify");
  //   final response = await http.post(loginUrl, headers: {
  //     'authorization': basicAuth
  //   }, body: {
  //     'email': email,
  //     'password': password,
  //   });
  //   // print(response.statusCode.toString());
  //   // print(response.body.toString());
  //   LoginModel _model = loginModelFromJson(response.body);
  //   // print(_model);
  //   return _model;
  //   // return json.decode(response.body);
  // }

  // Future getSearchApi(int? category_id,String search,int limit) async{
  //   String basicAuth = 'Basic ' + base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
  //   final data = Uri.parse('}index.php?route=api/search&search=&category_id=266&limit=5= $category_id,$search,$limit');
  //   final response = await http.get(data,headers: {'authorization': basicAuth},);
  //   // print(response.statusCode);
  //   // print(response.body);
  //   return json.decode(response.body);
  // }
  Future<RemoveproductModel> removewishlistproduct(int product_id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final wishlist =
        Uri.parse("https://www.vkreta.com/index.php?route=api/wishlist/remove");
    final response = await http.post(wishlist, headers: {
      'authorization': basicAuth
    }, body: {
      'customer_id': customer_id.toString(),
      'product_id': product_id.toString(),
    });
    var data = jsonDecode(response.body.toString());
    // print("response.body2");
    // WishlistModel _model = wishlistModelFromJson(response.body);
    // // print("response.body3");
    // return _model;
    RemoveproductModel _model = removeproductModelFromJson(response.body);
    // print(_model);
    return _model;
  }

  Future<CountryModel> getCountry() async {
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final wishlist = Uri.parse(
        "https://www.vkreta.com/index.php?route=api/cutomerInfo/country");
    final response = await http
        .post(wishlist, headers: {'authorization': basicAuth}, body: {});
    var data = jsonDecode(response.body.toString());
    // print("response.body2");
    // WishlistModel _model = wishlistModelFromJson(response.body);
    // // print("response.body3");
    // return _model;
    CountryModel _model = countryModelFromJson(response.body);
    // print(_model);
    return _model;
  }

  Future<ZoneModel> getZone(int country_id) async {
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final wishlist = Uri.parse(
        "https://www.vkreta.com/index.php?route=api/cutomerInfo/zone&country_id=99");
    final response = await http.post(wishlist, headers: {
      'authorization': basicAuth
    }, body: {
      'country_id': country_id.toString(),
    });
    var data = jsonDecode(response.body.toString());
    // print("response.body2");
    // WishlistModel _model = wishlistModelFromJson(response.body);
    // // print("response.body3");
    // return _model;
    ZoneModel _model = zoneModelFromJson(response.body);
    // print(_model);
    return _model;
  }

  Future<CartModel> AddToCart({product_id,  quantity, key,key1, id,id1}) async {
    print("response.bod");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final wishlist =
        Uri.parse("https://www.vkreta.com/index.php?route=api/cartnew/add");

    //
    Map<String, String> body = {
      'customer_id': customer_id.toString(),
      'product_id': product_id.toString(),
      'quantity': quantity.toString(),
      'option[${key.toString()}]': id.toString(),
      Get.put(HomeController()).mainId1.value.isEmpty?"":
      'option[${key1.toString()}]': id1.toString()
    };
    // for (String key in selectedVariants!.keys) {
    //   print(key);
    //   print(selectedVariants[key]);
    //   body["option[" + key + "]"] : selectedVariants[key].toString();
    // }

    print(body.toString());
    final response = await http.post(wishlist,
        headers: {'authorization': basicAuth}, body: body);
    var data = jsonDecode(response.body.toString());
    // print("response.body2");
    // WishlistModel _model = wishlistModelFromJson(response.body);
    print("response.body3");
    // return _model;
    CartModel _model = cartModelFromJson(response.body);
    print("response.body4");
    // print(_model);
    return _model;
  }

  Future<CartlistModel> getCartItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final wishlist =
        Uri.parse("https://www.vkreta.com/index.php?route=api/cartnew");
    final response = await http.post(wishlist, headers: {
      'authorization': basicAuth
    }, body: {
      'customer_id': customer_id.toString(),

    });
    print(wishlist);
    print(response.body);
    var data = jsonDecode(response.body.toString());
    // print("response.body2");
    // WishlistModel _model = wishlistModelFromJson(response.body);
    // // print("response.body3");
    // return _model;
    CartlistModel _model = cartlistModelFromJson(response.body);
    // print(_model);
    return _model;
  }

  Future<RemovecartitemModel> removeCartItems(int cart_id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final wishlist =
        Uri.parse("https://www.vkreta.com/index.php?route=api/cartnew/remove");
    final response = await http.post(wishlist, headers: {
      'authorization': basicAuth
    }, body: {
      'customer_id': customer_id.toString(),
      'cart_id': cart_id.toString(),
    });
    var data = jsonDecode(response.body.toString());
    // print("response.body2");
    // WishlistModel _model = wishlistModelFromJson(response.body);
    // // print("response.body3");
    // return _model;
    RemovecartitemModel _model = removecartitemModelFromJson(response.body);
    // print(_model);
    return _model;
  }

  Future<UpdatecartquantityModel> updateCartQuantity(
      int cart_id, int quantity) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final wishlist =
        Uri.parse("https://www.vkreta.com/index.php?route=api/cartnew/edit");
    final response = await http.post(wishlist, headers: {
      'authorization': basicAuth
    }, body: {
      'customer_id': customer_id.toString(),
      'cart_id': cart_id.toString(),
      'quantity': quantity.toString(),
    });

    print(jsonDecode(response.body.toString()));

    UpdatecartquantityModel _model =
        updatecartquantityModelFromJson(response.body);
    // print(_model);
    return _model;
  }







  Future<ReturnModel> returnModelAll({var product, var order}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final wishlist =
    Uri.parse("https://www.vkreta.com/index.php?route=api/ordernew/returnorderadd");
    final response = await http.post(wishlist, headers: {
      'authorization': basicAuth
    }, body: {
      'customer_id': customer_id.toString(),
      'product_id': product.toString(),
      'order_id': order.toString(),
    });

    print(jsonDecode(response.body.toString()));

    ReturnModel _model =
    returnModelFromJson(response.body);
    // print(_model);
    return _model;
  }





  Future<ReturnTrackOrdersAll> returnTrackModelAll({var productId, var rId, var sellerId}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final wishlist =
    Uri.parse("https://www.vkreta.com/index.php?route=api/ordernew/trackreturnorer&return_id=${rId.toString()}&customer_id=${customer_id.toString()}&seller_id=${sellerId.toString()}&product_id=${productId.toString()}");
    final response = await http.get(wishlist, headers: {
      'authorization': basicAuth
    });

    print(jsonDecode(response.body.toString()));

    ReturnTrackOrdersAll _model =
    returnTrackOrdersAllFromJson(response.body);
    // print(_model);
    return _model;
  }



  Future<CarttotalModel> getTotalCart({coup = ""}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final wishlist = Uri.parse(
        "https://www.vkreta.com/index.php?route=api/cartnew/cartTotal");
    final response = await http.post(wishlist, headers: {
      'authorization': basicAuth
    }, body: {
      'customer_id': customer_id.toString(),
      'coupon':coup.toString(),
    });
    print("This is wishlist");
    print(wishlist);

    print("getTotalCart --------------->> " + response.body.toString());


    CarttotalModel _model = carttotalModelFromJson(response.body);

    return _model;
  }




  Future<List<GetShippingMethod>?> getShippingMethodAll({addressId = ""} ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    Map<String, dynamic> body = Map<String, dynamic>();
    body['customer_id'] =customer_id.toString();
    body['address_id'] =addressId.toString();

    var response = await client.post(uriPath(nameUrl: "route=api/cartnew/shipping_method"),
        headers: {

          'authorization': basicAuth
        },
        body: jsonEncode(body));

    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      print("This is respomse ${jsonString}");
      print("Hamza Response");
      return getShippingMethodFromJson(response.body);
    } else if(response.statusCode == 202) {

      var jsonString = jsonDecode(response.body);

      // Get.back();
      print(jsonString.toString());
      print(response.statusCode);

      //show error message
      return null;
    }
  }



  Future getShippingList(String address_id) async {
    print("address id ????????" + address_id);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final wishlist = Uri.parse(
        "https://www.vkreta.com/index.php?route=api/cartnew/shipping_method");
    final response = await http.post(wishlist, headers: {
      'authorization': basicAuth
    }, body: {
      'customer_id': customer_id.toString(),
      'address_id': address_id,
    });
    print('>>>>>>>>>>>>>>>>>' + response.body);
    var data = jsonDecode(response.body);
    print("data");
    print(data);
    print("response.body2: $data");

    return data;
  }

  Future getCoupon() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final wishlist = Uri.parse(
        "https://www.vkreta.com/index.php?route=api/cartnew/coupon_lists&customer_id=$customer_id");
    final response = await http.get(
      wishlist,
      headers: {'authorization': basicAuth},
    );

    Coupons data = Coupons.fromJson(jsonDecode(response.body));
    print("response.body2: ${data}");

    return data;
  }

  Future applyCoupon(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final wishlist =
        Uri.parse("https://www.vkreta.com/index.php?route=api/coupon/check");
    final response = await http.post(wishlist, headers: {
      'authorization': basicAuth
    }, body: {
      'customer_id': customer_id.toString(),
      'coupon': name,
    });
    if(response.statusCode==200){
      var jsonString = jsonDecode(response.body);

      if(jsonString["error"] == "Warning: Coupon is either invalid, expired or reached it's usage limit!"){
        showErrorToast("Coupon is either invalid, expired");
        Get.put(HomeController()).updateCouponValue("");



      }
      else{
        Get.put(HomeController()).couponData(couponV:Get.put(HomeController()).couponValue.value.toString() );
        print('>>>>>>>>>>>>>>>>>' + response.body);
        successToast("Coupons apply Successfully");
      }





    }

  }

  // Future getPaymentMethod(String address_id) async {
  //   print("address id ????????" + address_id);
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   int? customer_id = prefs.getInt('customer_id');
  //   String basicAuth = 'Basic ' +
  //       base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
  //   final wishlist = Uri.parse(
  //       "https://www.vkreta.com/index.php?route=api/cartnew/payment_method");
  //   final response = await http.post(wishlist, headers: {
  //     'authorization': basicAuth
  //   }, body: {
  //     'customer_id': customer_id.toString(),
  //     'address_id': address_id,
  //   });
  //   //print('>>>>>>>>>>>>>>>>>' + response.body);
  //   print(wishlist);
  //
  //   Autogenerated data = Autogenerated.fromJson(jsonDecode(response.body));
  //
  //   print(
  //       "response.body>>>>>>>>>>>>>>>>>>>>: ${data.paymentMethodsList?[0].code}");
  //
  //   return data;
  // }
  //
  // static Future<CreatedModel?> createdResponse({value = ""}) async {
  //   var response = await client.get(
  //     uriPath(nameUrl: "${AppConstants.created}/$value"),
  //
  //   );
  //   log(response.body);
  //   if (response.statusCode == 200) {
  //     var jsonString = response.body;
  //
  //     return createdModelFromJson(jsonString);
  //   } else {
  //     //show error message
  //     return null;
  //   }
  // }

   Future<List<ListAddressModel>?> getAddressResponse() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    Map<String, dynamic> body = Map<String, dynamic>();
    body['customer_id'] =customer_id.toString();

    var response = await client.post(uriPath(nameUrl: "route=api/cutomerInfo/address_list"),
        headers: {

          'authorization': basicAuth
        },
        body: jsonEncode(body));

    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      return listAddressModelFromJson(response.body);
    } else if(response.statusCode == 202) {

      var jsonString = jsonDecode(response.body);

      // Get.back();
      print(jsonString.toString());
      print(response.statusCode);

      //show error message
      return null;
    }
  }


  Future<ReviewModel> getProductReview({  product_id,}) async {
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final data = Uri.parse("https://www.vkreta.com/index.php?route=api/"
        "productdetail/review&product_id=${product_id.toString()}&page=1&limit=100");
    final response = await http.get(
      data,
      headers: {'authorization': basicAuth},
    );
   print(data);
    //  print(response.body);
    // return json.decode(response.body);
    var data2 = jsonDecode(response.body.toString());
    // print("response.body2");
    // WishlistModel _model = wishlistModelFromJson(response.body);
    // // print("response.body3");
    // return _model;
    ReviewModel _model = reviewModelFromJson(response.body);
    // // print(_model);
    return _model;
  }

  Future<PaymentModelAll> getPayment({String? address_id}) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));

    String url =
        "https://www.vkreta.com/index.php?route=api/cartnew/payment_method";

    final data = Uri.parse(url);

    final response = await http.post(
        data,
        headers: {'authorization': basicAuth},
        body: {
          'customer_id': customer_id.toString(),
          'address_id': address_id.toString(),
        }
    );

    print(url);
    // print(response.statusCode);
    //  print(response.body);
    // index.php?route=api/"
    // "productdetail/review&product_id=${product_id.toString()}&page=${page.toInt()}&limit=${limit.toInt()}");
    // return json.decode(response.body);
    var data2 = jsonDecode(response.body.toString());
    print(data2);
    // WishlistModel _model = wishlistModelFromJson(response.body);
    // // print("response.body3");
    // return _model;
    print("response.asdasd");
    PaymentModelAll _model = PaymentModelAll.fromJson(jsonDecode(response.body));
    // // print(_model);
    print("response.body3");
    return _model;
  }

  Future<DeleteaddressModel> deletAddress(int address_id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final wishlist = Uri.parse(
        "https://www.vkreta.com/index.php?route=api/cutomerInfo/address_delete");
    final response = await http.post(wishlist, headers: {
      'authorization': basicAuth
    }, body: {
      'customer_id': customer_id.toString(),
      'address_id': address_id.toString(),
    });
    var data = jsonDecode(response.body.toString());
    // print("response.body2");
    // WishlistModel _model = wishlistModelFromJson(response.body);
    // // print("response.body3");
    // return _model;
    DeleteaddressModel _model = deleteaddressModelFromJson(response.body);
    // // print(_model);
    return _model;
  }

  Future editAddress(
    String firstname,
    String addressId,
    String lastname,
    String company,
    String address_1,
    String address_2,
    String city,
    String postcode,
    int country_id,
    int zone_id,
    int _default,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final loginUrl = Uri.parse(
        "https://www.vkreta.com/index.php?route=api/cutomerInfo/address_update");
    // print(0);
    final response = await http.post(loginUrl, headers: {
      'authorization': basicAuth
    }, body: {
      'customer_id': customer_id.toString(),
      'address_id': addressId.toString(),
      'firstname': firstname.toString(),
      'lastname': lastname.toString(),
      'company': company.toString(),
      'address_1': address_1.toString(),
      'address_2': address_2.toString(),
      'city': city.toString(),
      'postcode': postcode.toString(),
      'country_id': country_id.toString(),
      'zone_id': zone_id.toString(),
      '_default': '1',
    });
    print(response.body);
    if(response.statusCode == 200){
      Get.put(HomePage()).addressData();
      Get.back();
      print(response.body);
    }
    return json.decode(response.body);
    // print(_model);
  }

  Future<AddorderModel> addOrder(int payment_address,  shipping_address,
      String payment_method, String shipping_method, String comment) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final loginUrl =
        Uri.parse("https://www.vkreta.com/index.php?route=api/ordernew/add");

    print("customer_id -------------->> ${customer_id}");
    print("payment_address -------------->> ${payment_address}");
    print("shipping_address -------------->> ${shipping_address}");
    print("payment_method -------------->> ${payment_method}");
    print("shipping_method -------------->> ${shipping_method}");
    print("comment -------------->> ${comment}");

    final response = await http.post(
      loginUrl,
      headers: {'authorization': basicAuth},
      body: {
        'customer_id': customer_id.toString(),
        'payment_address': payment_address.toString(),
        'shipping_address': shipping_address.toString(),
        'payment_method': payment_method.toString(),
        'shipping_method': shipping_method.toString(),
        'comment': comment.toString(),
        'coupon': "",
      },
    );
    var data = jsonDecode(response.body.toString());
    print(data);
    // WishlistModel _model = wishlistModelFromJson(response.body);
    // // print("response.body3");
    // return _model;
    AddorderModel _model = addorderModelFromJson(response.body);
    // // print(_model);
    return _model;
  }

  Future getRazorPay() async {
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final loginUrl = Uri.parse(
        "https://www.vkreta.com/index.php?route=api/cartnew/razorpay_access");
    final response = await http.get(
      loginUrl,
      headers: {'authorization': basicAuth},
    );
    print(response.body);
    var data = jsonDecode(response.body.toString());

    print("response.body2 >>>>>>>>>>>>>> ${data}");
    return data;
  }

  Future<SearchModel> getProductSearch({String? search,page}) async {
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));

    String url =
        "https://www.vkreta.com/index.php?route=api/search&search=$search&page=$page";

    final data = Uri.parse(url);

    final response = await http.get(
      data,
      headers: {'authorization': basicAuth},
    );
    print(url);
    // print(response.statusCode);
    //  print(response.body);
    // index.php?route=api/"
    // "productdetail/review&product_id=${product_id.toString()}&page=${page.toInt()}&limit=${limit.toInt()}");
    // return json.decode(response.body);
    var data2 = jsonDecode(response.body.toString());
    print(data2);
    // WishlistModel _model = wishlistModelFromJson(response.body);
    // // print("response.body3");
    // return _model;
    print("response.asdasd");
    SearchModel _model = SearchModel.fromJson(jsonDecode(response.body));
    // // print(_model);
    print("response.body3");
    return _model;
  }

  Future<SearchModel> getFilterSearch(
      {String? min,
      String? max,
      String? order,
      String? sortAl,
      String? brand,
      var discount="",
      var page="1",
      String? prices,
      String? rating=""}) async {
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
   // String url = "https://www.vkreta.com/index.php?route=api/search&fm=$brand&fmin=$min&fmax=$max&order=$order&sort=$sortAl&ff4=$discount&ff5=$rating";

    String url = "https://www.vkreta.com/index.php?route=api/search&page=1";
    url += "&fmin=$min&fmax=$max";
    url += "&order=$order&sort=$sortAl";
    if (brand != "bbb") {
      url += "&fm=$brand";
    }
    // if (discount != "bbb") {
    //   url += "&ff4=${discount.toString()}";
    // }
    if (rating != "bbb") {
      url += "&ff5=$rating";
    }


    final data = Uri.parse(url);

    final response = await http.get(
      data,
      headers: {'authorization': basicAuth},
    );
    print(url);

    if(response.statusCode==200){


      var data2 = jsonDecode(response.body.toString());
      print(data2);

      print("response.asdasd");

    }

    SearchModel _model = SearchModel.fromJson(jsonDecode(response.body));
    // // print(_model);
    print("response.body3");
    return _model;
  }





  Future<ReviewsModel> reviewsAll(
      {String? min,
        String? max,
        String? brand,
        String? discount,
        String? prices,
        String? rating}) async {
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));

    String url = "https://www.vkreta.com/index.php?route=api/productdetail/";
    url += "&fp=$min,$max";
    if (brand != "bbb") {
      url += "&fm=$brand";
    }
    if (discount != "bbb") {
      url += "&f4=$discount";
    }
    if (rating != "bbb") {
      url += "&f5=$rating";
    }

    final data = Uri.parse(url);

    final response = await http.get(
      data,
      headers: {'authorization': basicAuth},
    );
    print(url);

    if(response.statusCode==200){


      var data2 = jsonDecode(response.body.toString());
      print(data2);

      print("response.asdasd");

    }

    ReviewsModel _model = ReviewsModel.fromJson(jsonDecode(response.body));
    // // print(_model);
    print("response.body3");
    return _model;
  }





  Future<SearchModel> getSubCatSearch(
      {String? id,
        page,
       }) async {
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));

    String url = "https://www.vkreta.com/index.php?route=api/search&page=${page}";
    if (id != "bbb") {
      url += "&fc=$id";
    }
   

    final data = Uri.parse(url);

    final response = await http.get(
      data,
      headers: {'authorization': basicAuth},
    );
    print(url);
    
    if(response.statusCode==200){
      print("object");
      var data2 = jsonDecode(response.body.toString());
      print(data2);
    }
  
   
  
    print("response.asdasd");
    SearchModel _model = SearchModel.fromJson(jsonDecode(response.body));
    // // print(_model);
    print("response.body3");
    return _model;
  }





  Future<SearchModel> getFilterSearchAll(
      {String? min,
        String? max,
        String? brand,
        String? discount,
        String? prices,
        String? rating}) async {
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));

    String url = "https://www.vkreta.com/index.php?route=api/search";
    url += "&fp=$min,$max";
    if (brand != "bbb") {
      url += "&fm=$brand";
    }
    if (discount != "bbb") {
      url += "&f4=$discount";
    }
    if (rating != "bbb") {
      url += "&f5=$rating";
    }

    final data = Uri.parse(url);

    final response = await http.get(
      data,
      headers: {'authorization': basicAuth},

    );
    print(url);
    // print(response.statusCode);
    //  print(response.body);
    // index.php?route=api/"
    // "productdetail/review&product_id=${product_id.toString()}&page=${page.toInt()}&limit=${limit.toInt()}");
    // return json.decode(response.body);
    var data2 = jsonDecode(response.body.toString());
    print(data2);
    // WishlistModel _model = wishlistModelFromJson(response.body);
    // // print("response.body3");
    // return _model;
    print("response.asdasd");
    SearchModel _model = SearchModel.fromJson(jsonDecode(response.body));
    // // print(_model);
    print("response.body3");
    return _model;
  }

  Future<AddtowishlistModel> addtowishlist(int product_id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final addwishlist =
        Uri.parse("https://www.vkreta.com/index.php?route=api/wishlist/add");
    final response = await http.post(addwishlist, headers: {
      'authorization': basicAuth
    }, body: {
      'customer_id': customer_id.toString(),
      'product_id': product_id.toString(),
    });
    // var data= jsonDecode(response.body.toString());
    // print("response.body2");
    // WishlistModel _model = wishlistModelFromJson(response.body);
    // print("response.body3");
    // return _model;
    AddtowishlistModel _model = addtowishlistModelFromJson(response.body);
    // print(_model);
    // print("response.body4");
    return _model;
  }






  Future Orderlist() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final addwishlist = Uri.parse(
        "https://www.vkreta.com/index.php?route=api/ordernew/OrderList");
    final response = await http.post(addwishlist, headers: {
      'authorization': basicAuth
    }, body: {
      'customer_id': customer_id.toString(),
    });
    // var data= jsonDecode(response.body.toString());
    // print("response.body2");
    // WishlistModel _model = wishlistModelFromJson(response.body);
    // print("response.body3");
    // return _model;
    // print(response.body);
    var data = jsonDecode(response.body);
    List<MyOrderHistoryModel> _model = [];
    for (var i in data) {
      _model.add(MyOrderHistoryModel.fromJson(i));
    }
    print(_model[0].status![0].product!.length.toString());
    // print("response.body4");
    // print(_model);
    // print("response.body4");
    return _model;
  }

  Future Orderinformationdetail(int order_id, int seller_id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final addwishlist =
        Uri.parse("https://www.vkreta.com/index.php?route=api/ordernew/info");
    print("customer_id --------->> ${customer_id}");
    print("order_id --------->> ${order_id}");
    print("seller_id --------->> ${seller_id}");
    final response = await http.post(
      addwishlist,
      headers: {'authorization': basicAuth},
      body: {
        'customer_id': customer_id.toString(),
        'order_id': order_id.toString(),
        'seller_id': seller_id.toString(),
      },
    );
    // return _model;

    print("response ---------------------->>> ${response.body}");
    OrderInfoDetailModel _model = orderInfoDetailModelFromJson(response.body);
    return _model;
  }

  Future SellerRating(int order_id, int seller_id, int rating,
      String review_description) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final addwishlist = Uri.parse(
        "https://www.vkreta.com/index.php?route=api/productdetail/ordersellerreview");
    final response = await http.post(addwishlist, headers: {
      'authorization': basicAuth
    }, body: {
      'customer_id': customer_id.toString(),
      'order_id': order_id.toString(),
      'seller_id': seller_id.toString(),
      'rating': rating.toString(),
      'review_description': review_description,
    });
    // return _model;

    SellerratingModel _model = sellerratingModelFromJson(response.body);
    // print("response.body4");
    // print(_model);
    // print("response.body4");
    return _model;
  }

  Future OrderReturnAdd(
    int order_id,
    int product_id,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final addwishlist = Uri.parse(
        "https://www.vkreta.com/index.php?route=api/ordernew/returnorderadd");
    final response = await http.post(addwishlist, headers: {
      'authorization': basicAuth
    }, body: {
      'customer_id': customer_id.toString(),
      'order_id': order_id.toString(),
      'product_id': product_id.toString(),
    });
    // return _model;

    OrderreturnaddModel _model = orderreturnaddModelFromJson(response.body);
    // print("response.body4");
    // print(_model);
    // print("response.body4");
    return _model;
  }

  Future OrderReturnSave(
      int order_id,
      int product_id,
      String firstname,
      String lastname,
      String email,
      String telephone,
      String date_ordered,
      String product,
      String model,
      String payment_code,
      int quantity,
      int return_reason_id,
      int opened,
      String comment,
      String bank_swift_code,
      String bank_account_name,
      String bank_account_number,
      int agree) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    final addwishlist = Uri.parse(
        "https://www.vkreta.com/index.php?route=api/ordernew/returnorder");
    final response = await http.post(addwishlist, headers: {
      'authorization': basicAuth
    }, body: {
      'customer_id': customer_id.toString(),
      'order_id': order_id.toString(),
      'product_id': product_id.toString(),
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'telephone': telephone.toString(),
      'date_ordered': date_ordered.toString(),
      'product': product.toString(),
      'model': model.toString(),
      'payment_code': payment_code.toString(),
      'quantity': quantity.toString(),
      'return_reason_id': return_reason_id.toString(),
      'opened': opened.toString(),
      'comment': comment.toString(),
      'bank_swift_code': bank_swift_code.toString(),
      'bank_account_name': order_id.toString(),
      'bank_account_number': bank_account_number.toString(),
      'agree': agree.toString(),
    });
    // return _model;

    print(response.body.toString());
    OrderreturnsaveModel _model = orderreturnsaveModelFromJson(response.body);
    print("response.body4");
    // print(_model);
    // print("response.body4");
    return _model;
  }

  Future sugestSearchApiCalled(String item) async {
    try {
      String basicAuth = 'Basic ' +
          base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // int? customer_id = prefs.getInt('customer_id');
      // print(customer_id);

      final loginUrl = Uri.parse(
          "https://www.vkreta.com/index.php?route=journal3/search&category_id=250&search=${item}");
      final response = await http.get(
        loginUrl,
        headers: {'authorization': basicAuth},
      );
      var data = SugestApiResponse.fromJson(json.decode(response.body));
      print(response.body);
      return data;
    } catch (e) {
      print(e);
    }

    // return json.decode(response.body);
  }

  Future searchApiCalled(
      {String item = '', String pageNO = '', String lmit = ''}) async {
    // try {
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? customer_id = prefs.getInt('customer_id');
    print(customer_id);

    final loginUrl = Uri.parse(
        "https://www.vkreta.com/index.php?route=api/search&search=$item&page=${pageNO}&limit=${lmit}");
    final response = await http.get(
      loginUrl,
      headers: {'authorization': basicAuth},
    );
    var data = SearchApiResponse.fromJson(json.decode(response.body));
    print(response.body);
    return data;
    // } catch (e) {
    //   print(e);
    // }
    // return json.decode(response.body);
  }

  Future filterApiCalled({
    String item = '',
    String pageNO = '',
    String lmit = '',
    String minp = '',
    String maxp = '',
    String category = '',
    String avaliable = '',
  }) async {
    // try {
    String basicAuth = 'Basic ' +
        base64.encode(utf8.encode('$basicAuth_username:$basicAuth_password'));
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // int? customer_id = prefs.getInt('customer_id');
    // print(customer_id);

    final loginUrl = Uri.parse(
        "https://www.vkreta.com/index.php?route=api/search&search=${item}&page=${pageNO}&limit=${lmit}&fmin=${minp}&fmax=${maxp}&fc=${category}&fm=167&fq=${avaliable}");
    final response = await http.get(
      loginUrl,
      headers: {'authorization': basicAuth},
    );
    var data = SearchApiResponse.fromJson(json.decode(response.body));
    print('>>>>>>>>>>>>>>>>>>>>>  ' + response.body);
    return data;
    // } catch (e) {
    //   print(e);
    // }
    // return json.decode(response.body);
  }




}
