import 'dart:developer';

import 'package:get/get.dart';
import 'package:vkreta/models/MyOrderHistoryModel.dart';
import 'package:vkreta/services/apiservice.dart';

class MyOrderHistory extends GetxController{
  RxList<MyOrderHistoryModel> list=<MyOrderHistoryModel>[].obs;

  var orderList = [].obs;
  var isOrderLoading = false.obs;
  cartData({search}) async {
    try {
      isOrderLoading(true);
      update();
      var cartViewData = await ApiService().Orderlist();
      if (cartViewData != null) {
        list.value = cartViewData;

        update();


        log(cartViewData.products.toString());
      } else {
        isOrderLoading(false);
        update();
      }
    } catch (e) {
      log(e.toString());
      isOrderLoading(false);
      update();
    } finally {
      isOrderLoading(false);
      update();
    }
    update();
  }

}