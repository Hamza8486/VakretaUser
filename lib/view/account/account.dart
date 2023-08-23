import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vkreta/custom_widgets/widgets.dart';
import 'package:vkreta/new/order_history.dart';
import 'package:vkreta/view/others/about.dart';
import 'package:vkreta/view/login_signup/changepassword.dart';
import 'package:vkreta/view/others/contactus.dart';
import 'package:vkreta/helper/helper.dart';
import 'package:vkreta/view/login_signup/login.dart';
import 'package:vkreta/view/address/modifyyouraddress.dart';
import 'package:vkreta/view/notification/notifications.dart';
import 'package:vkreta/view/home/pagescreen.dart';
import 'package:vkreta/view/others/privacypolicy.dart';
import 'package:vkreta/view/account/profilechange.dart';
import 'package:vkreta/services/apiservice.dart';
import 'package:vkreta/view/others/termandconditions.dart';
import 'package:vkreta/view/order_history/vieworderhistory.dart';

import '../order_history/orderHistoryScreen.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
  var width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.1,
        title: Text(
          'My Account',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(color: Colors.grey.shade900, fontSize: width * 0.04),
          ),
        ),
      ),
      body: FutureBuilder(
        future: ApiService().getcustomerDetail(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: width * 0.04,
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          transitionDuration:const Duration(seconds: 1),
                          transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {
                            animation = CurvedAnimation(parent: animation, curve: Curves.linear);
                            return SharedAxisTransition(child: child, animation: animation, secondaryAnimation: secAnimation, transitionType: SharedAxisTransitionType.horizontal);
                          },
                          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
                            return  ProfileChange(data: snapshot.data,);
                          },
                        ),
                      );
                    },
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Icon(
                        Icons.person,
                        size: width * 0.05,
                      ),
                    ),
                    subtitle: Text(
                      snapshot.data.email??"",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    title: Text(
                      snapshot.data.firstname + " " + snapshot.data.lastname,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey.shade500,
                      size: 20,
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          transitionDuration:const Duration(seconds: 1),
                          transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {
                            animation = CurvedAnimation(parent: animation, curve: Curves.linear);
                            return SharedAxisTransition(child: child, animation: animation, secondaryAnimation: secAnimation, transitionType: SharedAxisTransitionType.horizontal);
                          },
                          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
                            return  ChangePassword();
                          },
                        ),
                      );
                    },
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey.shade500,
                      size: 16,
                    ),
                    title: Text(
                      'Change Password',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.grey.shade400,
                  ),
                  ListTile(
                    onTap: () {
                      Get.to(ModifyYourAddress());

                    },
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey.shade500,
                      size: 16,
                    ),
                    title: Text(
                      'My Shipping Addresses',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.grey.shade400,
                  ),
                  ListTile(
                    onTap: () {
                      ApiService().Orderlist();
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          transitionDuration:const Duration(seconds: 1),
                          transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {
                            animation = CurvedAnimation(parent: animation, curve: Curves.linear);
                            return SharedAxisTransition(child: child, animation: animation, secondaryAnimation: secAnimation, transitionType: SharedAxisTransitionType.horizontal);
                          },
                          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
                            return const MyOrders();
                          },
                        ),
                      );
                    },
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey.shade500,
                      size: 16,
                    ),
                    title: Text(
                      'Order History',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.grey.shade400,
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          transitionDuration:const Duration(seconds: 1),
                          transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {
                            animation = CurvedAnimation(parent: animation, curve: Curves.linear);
                            return SharedAxisTransition(child: child, animation: animation, secondaryAnimation: secAnimation, transitionType: SharedAxisTransitionType.horizontal);
                          },
                          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
                            return const Notifications();
                          },
                        ),
                      );
                    },
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey.shade500,
                      size: 16,
                    ),
                    title: Text(
                      'Notifications',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),

                  Divider(
                    height: 1,
                    color: Colors.grey.shade400,
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          transitionDuration:const Duration(seconds: 1),
                          transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {
                            animation = CurvedAnimation(parent: animation, curve: Curves.linear);
                            return SharedAxisTransition(child: child, animation: animation, secondaryAnimation: secAnimation, transitionType: SharedAxisTransitionType.horizontal);
                          },
                          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
                            return const About();
                          },
                        ),
                      );
                    },
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey.shade500,
                      size: 16,
                    ),
                    title: Text(
                      'About',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.grey.shade400,
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          transitionDuration:const Duration(seconds: 1),
                          transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {
                            animation = CurvedAnimation(parent: animation, curve: Curves.linear);
                            return SharedAxisTransition(child: child, animation: animation, secondaryAnimation: secAnimation, transitionType: SharedAxisTransitionType.horizontal);
                          },
                          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
                            return PageScreen(title: 'Frequently Asked Questions', page_id: 7);
                          },
                        ),
                      );
                    },
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey.shade500,
                      size: 16,
                    ),
                    title: Text(
                      'Frequently Asked Questions',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.grey.shade400,
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          transitionDuration:const Duration(seconds: 1),
                          transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {
                            animation = CurvedAnimation(parent: animation, curve: Curves.linear);
                            return SharedAxisTransition(child: child, animation: animation, secondaryAnimation: secAnimation, transitionType: SharedAxisTransitionType.horizontal);
                          },
                          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
                            return const Contactus();
                          },
                        ),
                      );
                    },
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey.shade500,
                      size: 16,
                    ),
                    title: Text(
                      'Contact Us',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.grey.shade400,
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          transitionDuration:const Duration(seconds: 1),
                          transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {
                            animation = CurvedAnimation(parent: animation, curve: Curves.linear);
                            return SharedAxisTransition(child: child, animation: animation, secondaryAnimation: secAnimation, transitionType: SharedAxisTransitionType.horizontal);
                          },
                          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
                            return const TC();
                          },
                        ),
                      );
                    },
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey.shade500,
                      size: 16,
                    ),
                    title: Text(
                      'Terms and Conditions',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.grey.shade400,
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          transitionDuration:const Duration(seconds: 1),
                          transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {
                            animation = CurvedAnimation(parent: animation, curve: Curves.linear);
                            return SharedAxisTransition(child: child, animation: animation, secondaryAnimation: secAnimation, transitionType: SharedAxisTransitionType.horizontal);
                          },
                          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
                            return const PP();
                          },
                        ),
                      );
                    },
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey.shade500,
                      size: 16,
                    ),
                    title: Text(
                      'Privacy Policy',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.grey.shade400,
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          transitionDuration:const Duration(seconds: 1),
                          transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {
                            animation = CurvedAnimation(parent: animation, curve: Curves.linear);
                            return SharedAxisTransition(child: child, animation: animation, secondaryAnimation: secAnimation, transitionType: SharedAxisTransitionType.horizontal);
                          },
                          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
                            return PageScreen(title: 'Disclaimer Policy', page_id: 8);
                          },
                        ),
                      );
                    },
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey.shade500,
                      size: 16,
                    ),
                    title: Text(
                      'Disclaimer Policy',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.grey.shade400,
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          transitionDuration: const Duration(seconds: 1),
                          transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {
                            animation = CurvedAnimation(parent: animation, curve: Curves.linear);
                            return SharedAxisTransition(child: child, animation: animation, secondaryAnimation: secAnimation, transitionType: SharedAxisTransitionType.horizontal);
                          },
                          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
                            return PageScreen(title: 'Return Policy', page_id: 6);
                          },
                        ),
                      );
                    },
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey.shade500,
                      size: 16,
                    ),
                    title: Text(
                      'Return Policy',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.grey.shade400,
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          transitionDuration:const Duration(seconds: 1),
                          transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {
                            animation = CurvedAnimation(parent: animation, curve: Curves.linear);
                            return SharedAxisTransition(child: child, animation: animation, secondaryAnimation: secAnimation, transitionType: SharedAxisTransitionType.horizontal);
                          },
                          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
                            return PageScreen(title: 'Cookies Policy', page_id: 9);
                          },
                        ),
                      );
                    },
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey.shade500,
                      size: 16,
                    ),
                    title: Text(
                      'Cookies Policy',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.grey.shade400,
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          transitionDuration:const Duration(seconds: 1),
                          transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {
                            animation = CurvedAnimation(parent: animation, curve: Curves.linear);
                            return SharedAxisTransition(child: child, animation: animation, secondaryAnimation: secAnimation, transitionType: SharedAxisTransitionType.horizontal);
                          },
                          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
                            return PageScreen(title: 'Delivery Policy', page_id: 10);
                          },
                        ),
                      );
                    },
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey.shade500,
                      size: 16,
                    ),
                    title: Text(
                      'Delivery Policy',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.grey.shade400,
                  ),
                  InkWell(
                    onTap: () async {
                      SharedPreferences sharedPreference = await SharedPreferences.getInstance();
                      await sharedPreference.remove("customer_id");
                      await  HelperFunctions().clearPrefs();
                      Get.offAll(LoginScreen());

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.logout,
                              color: Colors.red,
                              size: width * 0.04,
                            ),
                            SizedBox(
                              width: width * 0.04,
                            ),
                            Text(
                              'Sign Out',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Colors.red,
                                  fontSize: width * 0.04,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.grey.shade400,
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
