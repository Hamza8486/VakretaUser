import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/apiservice.dart';
import 'WishlistModel.dart';
import 'cartlistModel.dart';

class BadgesModel extends ChangeNotifier {
  String email = '';
  BadgesModel() {
    getdata();
  }
  getdata() async {
    await getSharedPref();

    WishlistModel wishData = await ApiService().getWishlist(customer_id);
    CartlistModel cartData = await ApiService().getCartItems();
    wishListCount = wishData.products!.length;
    cartCount = cartData.products!.length;
    print("customer_id: $customer_id");
    print('cartCount: $cartCount');
    print('wishListCount: $wishListCount');
    notifyListeners();
  }

  int wishListCount = 0;
  int cartCount = 0;
  int currentindex = 0;
  int customer_id = 0;

  updatecart(int value) {
    cartCount = cartCount + value;
    notifyListeners();
  }

  updateWishList(int value) {
    wishListCount = wishListCount + value;
    notifyListeners();
  }

  SharedPreferences? sharedPrefs;
  Future<void> getSharedPref() async {
    SharedPreferences.getInstance().then((prefs) {
      // setState(() => sharedPrefs = prefs);
      sharedPrefs = prefs;
      int? _customer_id = sharedPrefs?.getInt("customer_id");

      customer_id = _customer_id!.toInt();
    });
  }

  String selectedCourier = '';
  String shipping_method = '';

  updateSelectedCourier(name) {
    selectedCourier = name;
    notifyListeners();
  }

  updateShippingMethod(name) {
    shipping_method = name;
    notifyListeners();
  }
}
