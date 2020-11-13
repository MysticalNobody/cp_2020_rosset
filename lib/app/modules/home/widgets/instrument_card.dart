import 'package:flutter/material.dart';
import 'package:rosset_client/theme/app_colors.dart';

class InstrumentCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
          color: AppColors.generalWhite,
          borderRadius: BorderRadius.circular(9),
          boxShadow: [
            BoxShadow(
                color: AppColors.grey.withOpacity(.15),
                blurRadius: 3,
                spreadRadius: 1),
          ]),
      child: TextButton(
        onPressed: () {},
        child: SizedBox(),
      ),
    );
  }
}
