import 'package:flutter/material.dart';
import 'package:vkreta/models/homemodel.dart';

class HomeData extends ChangeNotifier{
  HomeScreenModel? homeData;

  loadData(HomeScreenModel data){
    homeData=data;
    notifyListeners();
  }
}