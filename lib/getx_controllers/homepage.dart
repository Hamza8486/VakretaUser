import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vkreta/models/homemodel.dart';
import 'package:vkreta/models/listaddressModel.dart';
import 'package:vkreta/services/apiservice.dart';

import '../models/searchModel.dart';

class HomePage extends GetxController {
  Rx<HomeScreenModel> homeScreenModel = HomeScreenModel().obs;

  var isHomeLoading = false.obs;
  var isAddressLoading = false.obs;

  var homeList = [].obs;
  var cartList = [].obs;
  var slider = [].obs;
  var addressList = <ListAddressModel>[].obs;
  @override
  Future<void> onInit() async {
    homeData();
    addressData();
    cartData();

    super.onInit();
  }

  homeData() async {
    try {
      isHomeLoading(true);
      update();
      var homeViewData = await ApiService().getHome();
      if (homeViewData != null) {
        homeList.value = homeViewData.banner as dynamic;
        slider.value = homeViewData.silder as dynamic;

        update();
        print("HomeData");
      } else {
        isHomeLoading(false);
        update();
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isHomeLoading(false);
      update();
    }
    update();
  }



  cartData() async {
    try {

      update();
      var homeViewData = await ApiService().getCartItems();
      if (homeViewData != null) {
        cartList.value = homeViewData.products as dynamic;


        update();
        print("HomeData CartList");
      } else {

        update();
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {

      update();
    }
    update();
  }


  addressData() async {
    try {
      isAddressLoading(true);
      update();
      var homeViewData = await ApiService().getAddressResponse();
      if (homeViewData != null) {
        addressList.value = homeViewData as dynamic;

        update();
        print("Address Data All ${homeViewData.length}");
      } else {
        isAddressLoading(false);
        update();
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isAddressLoading(false);
      update();
    }
    update();
  }
}

class ViewAllController extends GetxController {
  RxList<ViewAllModel> viewAllModel = <ViewAllModel>[].obs;
}

class ProductSearchModelController extends GetxController {
  Rx<SearchModel> product = SearchModel().obs;
  RxBool exist = false.obs;
}

class FilterSearchModelController extends GetxController {
  Rx<SearchModel> product = SearchModel().obs;
  RxBool exist = false.obs;
}
