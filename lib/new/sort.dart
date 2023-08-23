import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vkreta/controllers/theme.dart';


class SortedByDropDown extends StatelessWidget {
  final String hint;
  final String? value;
  final double fontSize;
  final double fontSize1;
  final List<String> dropdownItems;
  final ValueChanged<String?>? onChanged;
  final DropdownButtonBuilder? selectedItemBuilder;
  final Alignment? hintAlignment;
  final Alignment? valueAlignment;
  final double? buttonHeight, buttonWidth;
  final EdgeInsetsGeometry? buttonPadding;
  final BoxDecoration? buttonDecoration;
  final int? buttonElevation;
  final Widget? icon;
  final double? iconSize;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final double? itemHeight;
  final String fontFamily;
  final EdgeInsetsGeometry? itemPadding;
  final double? dropdownHeight, dropdownWidth;
  final EdgeInsetsGeometry? dropdownPadding;
  final BoxDecoration? dropdownDecoration;
  final int? dropdownElevation;
  final Radius? scrollbarRadius;
  final double? scrollbarThickness;
  final bool? scrollbarAlwaysShow;
  final Offset? offset;
  final Color hintColor;

  SortedByDropDown({
    required this.hint,
    required this.value,
    this.fontFamily  ="regular",
    required this.dropdownItems,
    required this.onChanged,
    required this.hintColor ,
    this.selectedItemBuilder,
    this.hintAlignment,
    this.fontSize  = 13,
    this.fontSize1  = 12,
    this.valueAlignment,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonPadding,
    this.buttonDecoration,
    this.buttonElevation,
    this.icon,
    this.iconSize,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.itemHeight,
    this.itemPadding,
    this.dropdownHeight,
    this.dropdownWidth,
    this.dropdownPadding,
    this.dropdownDecoration,
    this.dropdownElevation,
    this.scrollbarRadius,
    this.scrollbarThickness,
    this.scrollbarAlwaysShow,
    this.offset,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size med = MediaQuery.of(context).size;
    return DropdownButtonHideUnderline(

      child: DropdownButton2(

        isExpanded: true,
        hint: Container(
          alignment: hintAlignment,
          child: Text(
              hint,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                  color: hintColor,
                  overflow: TextOverflow.ellipsis,
                  fontFamily: fontFamily,
                  fontWeight: FontWeight.w700,
                  fontSize: fontSize1
              )

          ),
        ),
        value: value,
        items: dropdownItems
            .map((item) => DropdownMenuItem<String>(
          value: item,
          child: Container(

            alignment: valueAlignment,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                  item,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(

                    fontSize: fontSize,
                    fontWeight: FontWeight.w700,
                    color: AppColor.blackColor,

                  )
              ),
            ),
          ),
        ))
            .toList(),
        onChanged: onChanged,
        selectedItemBuilder: selectedItemBuilder,
        icon: Icon(Icons.arrow_drop_down,color: Colors.black,size: Get.height*0.023,),
        iconSize: iconSize ?? 15,
        iconEnabledColor: iconEnabledColor,
        iconDisabledColor: iconDisabledColor,
        buttonHeight: buttonHeight ?? 40,
        buttonWidth: buttonWidth ?? 140,
        buttonPadding:
        buttonPadding ?? const EdgeInsets.only(left: 6, right: 6),
        buttonDecoration: buttonDecoration ??
            BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.transparent,
                border: Border.all(    color: AppColor.blackColor
                    .withOpacity(0.8),)


            ),
        buttonElevation: buttonElevation,
        itemHeight: itemHeight ?? 40,
        itemPadding: itemPadding ?? const EdgeInsets.only(left: 14, right: 14),
        //Max height for the dropdown menu & becoming scrollable if there are more items. If you pass Null it will take max height possible for the items.
        dropdownMaxHeight: dropdownHeight ??  Get.height * 0.55,
        dropdownWidth: dropdownWidth ?? med.width * 0.3,
        dropdownPadding: dropdownPadding,
        dropdownDecoration: dropdownDecoration ??
            BoxDecoration(
              borderRadius: BorderRadius.circular(14),
            ),
        dropdownElevation: dropdownElevation ?? 8,
        scrollbarRadius: scrollbarRadius ?? const Radius.circular(40),
        scrollbarThickness: scrollbarThickness,
        scrollbarAlwaysShow: scrollbarAlwaysShow,
        //Null or Offset(0, 0) will open just under the button. You can edit as you want.
        offset: offset,
        dropdownOverButton: false, //Default is false to show menu below button
      ),
    );
  }
}