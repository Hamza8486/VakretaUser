import 'package:get/get.dart';
import 'package:vkreta/models/TopCategoryModel.dart';
import 'package:vkreta/models/home_model.dart';
import 'package:vkreta/models/homemodel.dart';
import 'package:vkreta/services/apiservice.dart';


class CategoryController extends GetxController{
  Rx<TopCategoryModel> data =TopCategoryModel().obs;


  var isReqLoading = false.obs;


  var text = "".obs;
  var updateCode = "".obs;
  updateText(val){
    text.value = val;
    update();
  }

  updateCodePostal(val){
    updateCode.value = val;
    update();
  }

  var bannerList = [].obs;
  var productList = [].obs;
  var sliderList = <Silder>[].obs;
  var topCatList = [].obs;


  var pinCodeValue = "".obs;
  updatePinCodeValue(val){
    pinCodeValue.value = val;
    update();
  }


  var orderFilterValue = "ASC".obs;
  updateOrderFilterValue(val){
    orderFilterValue.value = val;
    update();
  }



  @override
  void onInit() async {
    getHomeData();
    super.onInit();

  }


  getHomeData({pin = ""}) async {
    try {
      isReqLoading(true);
      update();

      var requestViewData = await ApiService().getHome(pinCode: pin);
      if (requestViewData != null) {
        bannerList.value = requestViewData.banner as dynamic;
        sliderList.value = requestViewData.silder as dynamic;
        productList.value = requestViewData.products as dynamic;
        topCatList.value = requestViewData.topCategory as dynamic;

        update();
        print("testtstss");

        print(requestViewData.banner);
      } else {
        isReqLoading(false);
        update();
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isReqLoading(false);
      update();
    }

    update();
  }



}