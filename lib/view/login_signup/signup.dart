import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vkreta/custom_widgets/social_button.dart';
import 'package:vkreta/view/login_signup/login.dart';
import 'package:vkreta/services/apiservice.dart';

class SignUp extends StatefulWidget {
  const SignUp({ Key? key }) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _firstname=TextEditingController();
  final TextEditingController _lastname=TextEditingController();
  final TextEditingController _email=TextEditingController();
  final TextEditingController _telephone=TextEditingController();
  final TextEditingController _password=TextEditingController();
  final TextEditingController _confirmpassword=TextEditingController();
  int? _value=1;
  bool isLoading=false;

  void setLoading(bool value){
    setState(() {
      isLoading=value;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width =MediaQuery.of(context).size.width;
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 70),
            child: Text('Signup',style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: Colors.blue.shade900,fontWeight: FontWeight.bold,fontSize: width * 0.05
              )
            ),),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.06),
              child: Column(
                children: [
                  SizedBox(height: width * 0.06,),
                  Row(
                    children: [
                      Text('Your Personal Details',style: GoogleFonts.poppins(
                        textStyle:TextStyle(
                          color:Colors.black,fontWeight: FontWeight.bold,fontSize: width * 0.05
                        )
                      ),)
                    ],
                  ),
                  SizedBox(height: width * 0.06,),
                  TextFormField(
                    controller: _firstname,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_outline,size: width * 0.06,),
                    hintText: 'First Name',
                    hintStyle: GoogleFonts.poppins(
                      textStyle:TextStyle(
                        color:Colors.grey.shade600,
                         fontSize: width * 0.04
              )
                    )
                  ),
                  ),
                  SizedBox(height: width * 0.04,),
                  TextFormField(
                    controller: _lastname,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_outline,size: 23,),
                    hintText: 'Last Name',
                    hintStyle: GoogleFonts.poppins(
                      textStyle:TextStyle(
                        color:Colors.grey.shade600,
                         fontSize: width * 0.04
              )
                    )
                  ),
                  ),
                  SizedBox(height: width * 0.04,),
                  TextFormField(
                    controller: _email,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail,size: width * 0.04,),
                    hintText: 'Email',
                    hintStyle: GoogleFonts.poppins(
                      textStyle:TextStyle(
                        color:Colors.grey.shade600,
                         fontSize: 14
              )
                    )
                  ),
                  ),
                  SizedBox(height: width * 0.04,),
                  TextFormField(
                    controller: _telephone,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.call,size: width * 0.04,),
                    hintText: 'Telephone',
                    hintStyle: GoogleFonts.poppins(
                      textStyle:TextStyle(
                        color:Colors.grey.shade600,
                         fontSize: width * 0.04
              )
                    )
                  ),
                  ),
                     SizedBox(height: width * 0.04,),
                  Row(
                    children: [
                      Text('Your Password',style: GoogleFonts.poppins(
                        textStyle:TextStyle(
                            color:Colors.black,fontWeight: FontWeight.bold,fontSize: width * 0.05
                        )
                      ),)
                    ],
                  ),
                  SizedBox(height: width * 0.04,),
                  TextFormField(
                    controller: _password,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.vpn_key,size: width * 0.04,),
                    hintText: 'Password',
                    hintStyle: GoogleFonts.poppins(
                      textStyle:TextStyle(
                        color:Colors.grey.shade600,
                         fontSize: width * 0.04
              )
                    )
                  ),
                  ),
                  SizedBox(height: width * 0.04,),
                  TextFormField(
                    controller: _confirmpassword,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.vpn_key,size: width * 0.04,),
                    hintText: 'Confirm Password',
                    hintStyle: GoogleFonts.poppins(
                      textStyle:TextStyle(
                        color:Colors.grey.shade600,
                         fontSize: width * 0.04
              )
                    )
                  ),
                  ),
                  SizedBox(height: Get.height*0.15),

                  InkWell(
                    onTap: (){
                      if(validateLogin(context)){
                        showLoadingIndicator(context: context);
                        ApiService().userRegister(_firstname.text, _lastname.text, _email.text, _telephone.text, _password.text, _confirmpassword.text, _value.toString());

                      }
                    },
                    child: Container(
                    height: width * 0.11,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade900,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Text('Signup',style: GoogleFonts.poppins(
                        textStyle:const TextStyle(
                          color:Colors.white,fontWeight: FontWeight.bold,fontSize: 15
                        )
                      ),),
                    ),
                              ),
                  ),
                  SizedBox(height: width * 0.04,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account?',style: GoogleFonts.poppins(
                        textStyle:TextStyle(
                          color:Colors.black,
                          fontSize: width * 0.04
                        )
                      ),),
                      SizedBox(width: width * 0.04,),
                      GestureDetector(
                        onTap: (){
                          Get.to(LoginScreen(),
                          transition: Transition.rightToLeft
                          );

                        },
                        child: Text('Login',style: GoogleFonts.poppins(
                        textStyle:TextStyle(
                          color:Colors.blue.shade900,fontWeight: FontWeight.bold,
                          fontSize: width * 0.04
                        )
                      ),),
                      )
                    ],
                  ),SizedBox(height: width * 0.04,)

                ],
              ),
            ),
          ),
          isLoading?Positioned.fill(child: Container(color: Colors.black54,child: Center(child: CircularProgressIndicator(color:  Colors.blue.shade900,),),)):Container()
        ],
      ),
    );
  }
  bool validateLogin(BuildContext context) {

    if (_firstname.text.isEmpty) {
      showErrorToast( "Please enter first name");
      return false;
    }
    if (_lastname.text.isEmpty) {
      showErrorToast( "Please enter last name");
      return false;
    }
    if (_email.text.isEmpty) {
      showErrorToast( "Please enter email");
      return false;
    }
    if (!_email.text.contains("@")) {
      showErrorToast( "Please enter valid email");
      return false;
    }
    if (!_email.text.contains(".")) {
      showErrorToast( "Please enter valid email");
      return false;
    }
    if (_telephone.text.isEmpty) {
      showErrorToast( "Please enter phone number");
      return false;
    }
    if (_password.text.isEmpty) {
      showErrorToast( "Please enter password ");
      return false;
    }
    if (_confirmpassword.text!=_password.text) {
      showErrorToast( "Please enter same password");
      return false;
    }






    return true;
  }
}