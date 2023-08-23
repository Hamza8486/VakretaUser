import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CustomSocialElevatedButton extends StatelessWidget {
  const CustomSocialElevatedButton(
      {Key? key, required this.svgIcon, this.onPressed})
      : super(key: key);

  final Widget svgIcon;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: svgIcon,
    );
  }
}


void showLoadingIndicator({required BuildContext context}) {
  showDialog(
    barrierDismissible: false,
    useRootNavigator: false,
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: Container(
          height: 65,width: 65,

          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),     color: Colors.white,),
          child: Container(

            height: 25,width: 25,color: Colors.transparent,child:   Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.black26,
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.blue.shade900, //<-- SEE HERE

              ),
              // strokeWidth: 5,
            ),
          ),),
        ),
      );
    },
  );
}
void showErrorToast(String message,) {
  HapticFeedback.lightImpact();
  Get.isSnackbarOpen?Get.back():
  Get.showSnackbar(GetSnackBar(
    backgroundColor:  Colors.red ,
    messageText: Text(
      message,style: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: Get.height*0.015,
      color:Colors.white,
    ),
    ),

    duration: const Duration(seconds: 3),
    snackStyle: SnackStyle.FLOATING,
    margin: const EdgeInsets.all(10),
    snackPosition: SnackPosition.TOP,
    borderRadius: 10,
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
  ));
}

void successToast(String message) {
  HapticFeedback.lightImpact();
  Get.isSnackbarOpen?Get.back():
  Get.showSnackbar(GetSnackBar(
    backgroundColor: Colors.green,
    messageText: Text(
      message,style: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: Get.height*0.015,
      color:Colors.white,
    ),
    ),
    duration: const Duration(seconds: 3),
    snackStyle: SnackStyle.FLOATING,
    snackPosition: SnackPosition.TOP,
    margin: const EdgeInsets.all(10),
    borderRadius: 10,
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
  ));
}