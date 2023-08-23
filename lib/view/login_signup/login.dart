import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vkreta/custom_widgets/social_button.dart';
import 'package:vkreta/custom_widgets/widgets.dart';
import 'package:vkreta/models/bages_model.dart';
import 'package:vkreta/services/apiservice.dart';
import 'package:vkreta/view/home/selectscreen.dart';
import 'package:vkreta/view/login_signup/entermobileno.dart';
import 'package:vkreta/view/login_signup/forgotpasssword.dart';
import 'package:vkreta/view/login_signup/signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isVisiblePassword = false;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  String deviceId = "";

  // Future<void> main() async {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var email = prefs.getString('email');
  //   print(email);
  //   runApp(MaterialApp(home: email == null ? LoginScreen() : Home()));
  // }

  @override
  void initState() {
    // TODO: implement initState
    getId();
    super.initState();
  }

  getId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    deviceId = prefs.getString('notificationToken').toString();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Login',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(color: Colors.blue.shade900, fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width / 1.5,
                child: Image.asset(
                  'assets/login.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: email,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.mail,
                      size: 23,
                    ),
                    hintText: 'Email',
                    hintStyle: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade600, fontSize: 14))),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                obscureText: !isVisiblePassword ? true : false,
                controller: password,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.vpn_key,
                      size: 23,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisiblePassword = !isVisiblePassword;
                          });
                        },
                        icon: Icon(!isVisiblePassword ? Icons.visibility : Icons.visibility_off)),
                    hintText: 'Password',
                    hintStyle: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.grey.shade600, fontSize: 14))),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  GestureDetector(
                    onTap: () {
                      Get.to(ForgotPassword(),
                          transition: Transition.rightToLeft
                      );
                    },
                    child: Text(
                      'Forgot Password?',
                      style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.blue.shade900, fontWeight: FontWeight.bold, fontSize: 13)),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
              //login Button
              InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    PageRouteBuilder(
                      transitionDuration: Duration(seconds: 1),
                      transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {
                        animation = CurvedAnimation(parent: animation, curve: Curves.linear);
                        return SharedAxisTransition(child: child, animation: animation, secondaryAnimation: secAnimation, transitionType: SharedAxisTransitionType.horizontal);
                      },
                      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
                        return EnterMobileNo(
                          t: "",

                        );
                      },
                    ),
                  );
                },
                child: InkWell(
                  onTap: () async {
                    if(validateLogin(context)){
                      showLoadingIndicator(context: context);
                      ApiService().userLogin(
                          email.text,
                          password.text,
                          deviceId,
                          context
                      );
                    }

                  },
                  child: Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade900,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Text(
                        'Login',
                        style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),

              Text(
                'OR',
                style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14)),
              ),
              SizedBox(
                height: 20,
              ),

              CustomSocialElevatedButton(
                svgIcon: SvgPicture.asset(
                  'assets/google.svg',
                  height: 30,
                  width: 30,
                ),
                onPressed: () {
                  loginWithGoogle();
                },
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'A new user?',
                    style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.black, fontSize: 14)),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                     Get.to(SignUp());
                    },
                    child: Text(
                      'SignUp',
                      style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.blue.shade900, fontWeight: FontWeight.bold, fontSize: 14)),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
  bool validateLogin(BuildContext context) {

    if (email.text.isEmpty) {
      showErrorToast( "Please enter email");
      return false;
    }
    if (password.text.isEmpty) {
      showErrorToast( "Please enter password");
      return false;
    }







    return true;
  }
  Future loginWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    final log = Logger();
    late final response;
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
      debugPrint('accessToken => ' + googleAuth.accessToken!.toString());
      debugPrint('accessToken => ' + googleUser.email.toString());
      debugPrint('accessToken => ' + googleUser.displayName!.toString());

      if (googleUser.email != null) {
        final data = await ApiService().googleLogin(
          googleUser.email,
          googleUser.displayName.toString(),
        );
        print('????????????????????????????????' + data.toString());
        if (data != null) {
          if (data['customer_id'] != null) {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            HelperFunctions.saveInPreference("userId", data['customer_id'].toString());
            prefs.setInt('customer_id', int.parse(data['customer_id']));
            Provider.of<BadgesModel>(context, listen: false).email = googleUser.email;
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SelectScreen()));
          }
        }
      }
      // return response;
    } catch (e) {
      log.i('Exception @sighupWithGoogle: $e');
    }
    //return response;
  }
}
