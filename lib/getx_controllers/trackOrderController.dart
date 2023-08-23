import 'package:get/get.dart';
import 'package:vkreta/models/TrackOrderModel.dart';

class TrackOrderController extends GetxController{
  Rx<TrackOrderModel> track= TrackOrderModel().obs;
}