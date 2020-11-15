import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:rosset_client/theme/app_colors.dart';

class TextInputWidget extends StatelessWidget {
  const TextInputWidget({
    Key key,
    @required this.labelText,
    @required this.controller,
    @required this.focusNode,
  }) : super(key: key);

  final String labelText;
  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: Get.width * .4,
        maxWidth: Get.width * .8,
      ),
      width: 300,
      child: TextFormField(
        cursorColor: AppColors.secondary,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.normal,
          color: AppColors.text,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 12),
          labelText: labelText,
          labelStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: AppColors.text,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.secondary,
              width: 2,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.text,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.text,
              width: 1,
            ),
          ),
        ),
        validator: ValidationBuilder().minLength(1, 'Необходимо ввести $labelText').build(),
        controller: controller,
        focusNode: focusNode,
      ),
    );
  }
}
