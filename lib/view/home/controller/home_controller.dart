import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vkreta/custom_widgets/widgets.dart';
import 'package:vkreta/models/MyOrderHistoryModel.dart';
import 'package:vkreta/models/new_return.dart';
import 'package:vkreta/models/paymentmethodList.dart';
import 'package:vkreta/models/return_model.dart';
import 'package:vkreta/models/reviewModel.dart';
import 'package:vkreta/models/searchModel.dart';
import 'package:vkreta/services/apiservice.dart';
import 'package:vkreta/view/home/controller/seller_model.dart';

class HomeController extends GetxController {

  var id = "".obs;

var key = "".obs;


var paymentId="".obs;
updatePaymentId(val){
  paymentId.value=val;
  update();
}


var key1 = "".obs;
var mainId = "".obs;
var mainId1 = "".obs;

  updateKeyId(val){
    key.value = val;
    update();

  }

  updateKeyId1(val){
    key1.value = val;
    update();

  }

  updateMainId(val){
    mainId.value = val;
    update();

  }
  updateMainId1(val){
    mainId1.value = val;
    update();

  }

clearValueAll(){
    updateMainId("");
    updateValueText("");
  updateMainId1("");
  updateKeyId("");
  updateKeyId1("");
}
  var textValue = "All".obs;
  updateText(val){
    textValue.value = val;
    update();

  }
  bool isUpdate=false;
  var isPag1Loading = false.obs;
  var isPagLoading = false.obs;
  var address = "".obs;
  var name = "".obs;
  var address1 = "".obs;
  var address2 = "".obs;
  var city = "".obs;
  var zone = "".obs;
  var country = "".obs;
  var postalcode = "".obs;

  var searchList = <Products>[].obs;
  var subList = <Products>[].obs;
  var couponList =[].obs;
  var orderList =<MyOrderHistoryModel>[].obs;
  var shippingList =[].obs;
  var filterList = <M>[].obs;
  var filterList1 = [].obs;
  var filterList2 = [].obs;
  var filterGetList = <Products>[].obs;
  var reviewList = <ReviewAllModel>[].obs;
  var sellerList = <SellerModel>[].obs;
  var returnList = <ReturnReasons>[].obs;
  var paymentList = [].obs;
  var isUserLoading = false.obs;
  var isCouponLoading = false.obs;
  var isReturnLoading = false.obs;
  var isOrderLoading = false.obs;
  var isSellerLoading = false.obs;
  var isSipperLoading = false.obs;
  var isSubLoading = false.obs;
  var isFilterLoading = false.obs;
  var isReviewLoading = false.obs;
  var isPaymentLoading = false.obs;
  cartData({search,page, bool isUpdate=false,}) async {
    try {
      if(isUpdate==false){
        isUserLoading(true);
      }
      else{
        isPag1Loading(true);
        update();
      }

      update();
      var cartViewData = await ApiService().getProductSearch(search: search,page: page);
      if (cartViewData != null) {
        // searchList.value = mcartViewData.products as dynamic;
        for(int i=0;i<cartViewData.products!.length;i++) {
          searchList.add(cartViewData.products![i]);
        }
        filterList.value = cartViewData.filter?.m as dynamic;
        filterList1.value = cartViewData.filter?.f4 as dynamic;
        filterList2.value = cartViewData.filter?.f5 as dynamic;
        isPag1Loading(false);
        isUserLoading(false);
        update();
        debugPrint("Hamza Sabbbbbb");
        debugPrint("Hamza Sabbbbbb");
        debugPrint("Hamza Sabbbbbb");
        debugPrint("Hamza");

        debugPrint(cartViewData.products.toString());
      } else {

        isPag1Loading(false);
        isUserLoading(false);
        update();
      }
    } catch (e) {
      isPag1Loading(false);
      isUserLoading(false);
      update();
    } finally {
      isPag1Loading(false);
      isUserLoading(false);
      update();
    }
    update();
  }



  subData({search,page, bool isUpdate=false,}) async {
    try {
      if(isUpdate==false){
        isSubLoading(true);
        update();
      }
      else{
        isPagLoading(true);
        update();
      }

      var cartViewData = await ApiService().getSubCatSearch(id: search,page: page);
      if (cartViewData != null) {
        for(int i=0;i<cartViewData.products!.length;i++) {
          subList.add(cartViewData.products![i]);
        }
        isPagLoading(false);
        isSubLoading(false);
        update();
        debugPrint("Hamza Sabbbbbb");
        debugPrint("Hamza Sabbbbbb");
        debugPrint("Hamza Sabbbbbb");
        debugPrint("Hamza");

        debugPrint(cartViewData.products.toString());
      } else {
        isPagLoading(false);
        isSubLoading(false);
        update();
      }
    } catch (e) {
      debugPrint(e.toString());
      isPagLoading(false);
      isSubLoading(false);
      update();
    } finally {
      isPagLoading(false);
      isSubLoading(false);
      update();
    }
    update();
  }


  paymentData({search}) async {
    try {
      isPaymentLoading(true);
      update();
      var cartViewData = await ApiService().getPayment(address_id: search);
      if (cartViewData != null) {
        paymentList.value = cartViewData as dynamic;

        update();
        debugPrint("Hamza Sabbbbbb");
        debugPrint("Hamza Sabbbbbb");
        debugPrint("Hamza Sabbbbbb");
        debugPrint("Hamza");

        debugPrint(cartViewData.toString());
      } else {
        isPaymentLoading(false);
        update();
      }
    } catch (e) {
      debugPrint(e.toString());
      isPaymentLoading(false);
      update();
    } finally {
      isPaymentLoading(false);
      update();
    }
    update();
  }



  var valueText = "".obs;
  updateValueText(val){
    valueText.value = val;
    update();
  }

  var start = "0".obs;
  updateStart(val){
    start.value = val;
    update();
  }
  var model = "".obs;
  updateModel(val){
    model.value = val;
    update();
  }


  var end = "1000".obs;
  updateEnd(val){
    end.value = val;
    update();
  }


  var orderText = "ASC".obs;
  updateOrderText(val){
    orderText.value = val;
    update();
  }


  var sortText = "pd.name".obs;
  updateSortText(val){
    sortText.value = val;
    update();
  }


  sellerData({id}) async {
    try {
      isSellerLoading(true);
      update();
      var cartViewData = await ApiService().getSellerResponse(id: id);
      if (cartViewData != null) {
        sellerList.value = cartViewData as dynamic;
        update();
        debugPrint("Hamza Sabbbbbb");
        debugPrint("Hamza Sabbbbbb");
        debugPrint("Hamza Sabbbbbb");
        debugPrint("Hamza");

        debugPrint(cartViewData.toString());
      } else {
        isSellerLoading(false);
        update();
      }
    } catch (e) {
      debugPrint(e.toString());
      isSellerLoading(false);
      update();
    } finally {
      isSellerLoading(false);
      update();
    }
    update();
  }



var isLoading=false.obs;
  updateLoading(val){
    isLoading.value=val;
    update();
  }




  retuenData({order,product}) async {
    try {
      isReturnLoading(true);
      update();
      var cartViewData = await ApiService().returnModelAll(product: product.toString(),order: order.toString());
      if (cartViewData != null) {
        returnList.value = cartViewData.returnReasons as dynamic;
        updateModel(cartViewData.model.toString());
        print("This is return ${cartViewData.model.toString()}");
        update();
        debugPrint("Hamza Sabbbbbb");
        debugPrint("Hamza Sabbbbbb");
        debugPrint("Hamza Sabbbbbb");
        debugPrint("Hamza");

        debugPrint(cartViewData.returnReasons.toString());
      } else {
        isReturnLoading(false);
        update();
      }
    } catch (e) {
      debugPrint(e.toString());
      isReturnLoading(false);
      update();
    } finally {
      isReturnLoading(false);
      update();
    }
    update();
  }




  shippingData({id}) async {
    try {
      isSipperLoading(true);
      update();
      var cartViewData = await ApiService().getShippingMethodAll(addressId: id.toString());
      if (cartViewData != null) {
        shippingList.value = cartViewData as dynamic;
        update();
        debugPrint("Hamza Sabbbbbb");
        debugPrint("Hamza Sabbbbbb");
        debugPrint("Hamza Sabbbbbb");
        debugPrint("Hamza");

        debugPrint(cartViewData.toString());
      } else {
        isSipperLoading(false);
        update();
      }
    } catch (e) {
      debugPrint(e.toString());
      isSipperLoading(false);
      update();
    } finally {
      isSipperLoading(false);
      update();
    }
    update();
  }

  var updateId="".obs;
  updateIds(val){
    updateId.value=val;
    update();

  }





  couponData({couponV = ""}) async {
    try {
      isCouponLoading(true);
      update();
      var cartViewData = await ApiService().getTotalCart(coup: couponV);
      if (cartViewData != null) {
        couponList.value = cartViewData.totals as dynamic;
        update();
        debugPrint("Coupon All");
        debugPrint(cartViewData.totals.toString());
      } else {
        isCouponLoading(false);
        update();
      }
    } catch (e) {
      debugPrint(e.toString());
      isCouponLoading(false);
      update();
    } finally {
      isCouponLoading(false);
      update();
    }
    update();
  }

  var couponValue = "".obs;

  updateCouponValue(val){
    couponValue.value = val;
    update();

  }


  reviewData({id}) async {
    try {
      isReviewLoading(true);
      update();
      var cartViewData = await ApiService().getProductReview(product_id: id);
      if (cartViewData != null) {
        reviewList.value = cartViewData.reviews as dynamic;
        update();
        debugPrint("Hamza Sabbbbbb");
        debugPrint("Hamza Sabbbbbb");
        debugPrint("Hamza Sabbbbbb");
        debugPrint("Hamza");

        debugPrint(cartViewData.reviews.toString());
      } else {
        isReviewLoading(false);
        update();
      }
    } catch (e) {
      debugPrint(e.toString());
      isReviewLoading(false);
      update();
    } finally {
      isReviewLoading(false);
      update();
    }
    update();
  }




  getFilterData({min="",max="",brand="",discount="",rat="",page}) async {
    try {
      isFilterLoading(true);
      update();
      var cartViewData = await ApiService().getFilterSearch(max: end.value,min:start.value,brand: brand,discount: discount,
      order: orderText.value,sortAl: sortText.value,
        page: page,
        rating: rat
      );
      if (cartViewData != null) {
        filterGetList.value = cartViewData.products as dynamic;
        update();
        debugPrint("Hamza Sabbbbbb");
        debugPrint("Hamza Sabbbbbb");
        debugPrint("Hamza Sabbbbbb");
        debugPrint("Hamza");

        debugPrint(cartViewData.products.toString());
      } else {
        isFilterLoading(false);
        update();
      }
    } catch (e) {
      debugPrint(e.toString());
      isFilterLoading(false);
      update();
    } finally {
      isFilterLoading(false);
      update();
    }
    update();
  }



  @override
  Future<void> onInit() async {



    HelperFunctions.getFromPreference("id").then((value) {
      id.value = value;
      debugPrint("id.value");

      debugPrint(id.value);
      update();
    });
    HelperFunctions.getFromPreference("address").then((value) {
      address.value = value;
      debugPrint("address.value");
      debugPrint(address.value);
      update();
    });
    HelperFunctions.getFromPreference("name").then((value) {
      name.value = value;
      debugPrint("name.value");
      debugPrint(name.value);
      update();
    });
    HelperFunctions.getFromPreference("address1").then((value) {
      address1.value = value;
      debugPrint("address1.value");
      debugPrint(address1.value);
      update();
    });

    HelperFunctions.getFromPreference("address2").then((value) {
      address2.value = value;
      debugPrint("adaddress1dress.value");
      debugPrint(address2.value);
      update();
    });


    HelperFunctions.getFromPreference("city").then((value) {
      city.value = value;
      debugPrint("city.value");
      debugPrint(city.value);
      update();
    });
    HelperFunctions.getFromPreference("zone").then((value) {
      zone.value = value;
      debugPrint("zone.value");
      debugPrint(zone.value);
      update();
    });
    HelperFunctions.getFromPreference("country").then((value) {
      country.value = value;
      debugPrint("country.value");
      debugPrint(country.value);
      update();
    });
    HelperFunctions.getFromPreference("postalcode").then((value) {
      postalcode.value = value;
      debugPrint("postalcode.value");
      debugPrint(postalcode.value);
      update();
    });

    super.onInit();
    couponData();
  }


  var firstName = "".obs;
  var shipping = "".obs;
  var phone = "".obs;
  var addressId = "".obs;
  var addressAll = "".obs;
  var countryAll = "".obs;
  var cityAll = "".obs;
  var stateAll = "".obs;
  var pinAll = "".obs;
  var company = "".obs;


  updateFirst(val){
    firstName.value = val;
    update();

  }
  updateCompany(val){
    company.value = val;
    update();

  }
  updateShipping(val){
    shipping.value = val;
    update();

  }
  updateAddressId(val){
    addressId.value = val;
    update();

  }

  updatePhone(val){
    phone.value = val;
    update();

  }
  updateaddressAll(val){
    addressAll.value = val;
    update();

  }
  updatecountryAll(val){
    countryAll.value = val;
    update();

  }
  updatecityAll(val){
    cityAll.value = val;
    update();

  }
  updatestateAll(val){
    stateAll.value = val;
    update();

  }
  updatepinAll(val){
    pinAll.value = val;
    update();

  }




  var returnNewList = <HistoryModelAll>[].obs;

  var returnNewLoading = false.obs;

  var returnData;


  var reason="".obs;
  var status="".obs;
  updateReason(val){
    reason.value=val;
    update();
  }
  updateStatus(val){
    status.value=val;
    update();
  }

  returnNewTrackData({productId="",sellerId="",rId=""}) async {
    try {
      returnNewLoading(true);
      update();
      var cartViewData = await ApiService().returnTrackModelAll(
        productId: productId.toString(),sellerId: sellerId.toString(),rId: rId.toString()
      );
      if (cartViewData != null) {
        returnNewList.value = cartViewData.history as dynamic;
        updateReason(cartViewData.reason.toString());
        updateStatus(cartViewData.status.toString());

        update();
        debugPrint("Hamza Sabbbbbb");
        debugPrint("Hamza Sabbbbbb");
        debugPrint("Hamza Sabbbbbb");
        debugPrint("Hamza");

        debugPrint(cartViewData.history.toString());
      } else {
        returnNewLoading(false);
        update();
      }
    } catch (e) {
      debugPrint(e.toString());
      returnNewLoading(false);
      update();
    } finally {
      returnNewLoading(false);
      update();
    }
    update();
  }

}
