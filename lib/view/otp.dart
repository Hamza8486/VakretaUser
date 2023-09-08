import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:vkreta/custom_widgets/social_button.dart';
import 'package:vkreta/services/apiservice.dart';


class EnterOtp extends StatefulWidget {
  EnterOtp({Key? key,this.data,this.otp}) : super(key: key);
  var data;
  var otp;
  @override
  State<EnterOtp> createState() => _EnterOtpState();
}

class _EnterOtpState extends State<EnterOtp> {
  final formKey = GlobalKey<FormState>();
  String code = "";
  String currentText = "";
  TextEditingController verifyCode = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print("This is otp ${widget.otp.toString()}");
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 60,
                        width: 140,
                        child: Image.asset('assets/logo-white.png',fit: BoxFit.fill,color: Colors.blue.shade900),
                      ),
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height/3,
                    width: MediaQuery.of(context).size.width/1.5,
                    child: Image.asset('assets/mark.png',fit: BoxFit.cover,),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Enter the OTP sent to your',style:  GoogleFonts.poppins(
                          textStyle:TextStyle(
                              color:Colors.black,fontWeight: FontWeight.bold,fontSize: 16
                          )
                      ),),


                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('number/email',style:  GoogleFonts.poppins(
                          textStyle:TextStyle(
                              color:Colors.black,fontWeight: FontWeight.bold,fontSize: 16
                          )
                      ),),


                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${widget.data.toString()}',style:  GoogleFonts.poppins(
                          textStyle:TextStyle(
                              color:Colors.black,fontSize: 16,fontWeight: FontWeight.bold
                          )
                      ),),
                      Text("",style:  GoogleFonts.poppins(
                          textStyle:TextStyle(
                              color:Colors.black,fontWeight: FontWeight.bold,fontSize: 18
                          )
                      ),),


                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Otp: ',style:  GoogleFonts.poppins(
                          textStyle:TextStyle(
                              color:Colors.black,fontSize: 16,fontWeight: FontWeight.bold
                          )
                      ),),
                      Text(widget.otp.toString(),style:  GoogleFonts.poppins(
                          textStyle:TextStyle(
                              color:Colors.black,fontWeight: FontWeight.bold,fontSize: 18
                          )
                      ),),


                    ],
                  ),
                  SizedBox(height:20),

                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: Get.width*0.04),
                    child: PinCodeTextField(

                      autoDisposeControllers: false,
                      validator: (v) {
                        if (v!.length < 6) {
                          return "Please enter valid Otp";
                        } else {
                          return null;
                        }
                      },

                      keyboardType: TextInputType.number,
                      pinTheme:  PinTheme.defaults(
                        selectedColor: Colors.blue.shade900,
                        inactiveColor: Colors.grey,
                        activeColor:Colors.blue.shade900,
                      ),
                      appContext: context,
                      controller: verifyCode,
                      cursorColor: Colors.blue.shade900,
                      length: 6,
                      onChanged: (value) {
                        debugPrint(value);
                        setState(() {
                          currentText = value;
                          if (value.length == 6) {
                            setState(() {
                              code = value;
                            });
                          }
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 60,),


                  InkWell(
                    onTap: (){
                      setState(() {
                        if (formKey.currentState!.validate()) {
                          if(currentText!=widget.otp.toString()){
                            showErrorToast("PLease enter valid otp");
                            setState(() {
                              verifyCode.clear();
                            });
                          }
                          else{
                            showLoadingIndicator(context: context);
                            ApiService().verifyResponse(widget.data.toString());
                          }

                        }
                      });


                    },
                    child: Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade900,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Text('Continue',style: GoogleFonts.poppins(
                            textStyle:TextStyle(
                                color:Colors.white,fontWeight: FontWeight.bold,fontSize: 15
                            )
                        ),),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}