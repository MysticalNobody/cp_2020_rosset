import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/theme/app_colors.dart';
import 'package:rosset_client/theme/app_text_styles.dart';

enum OptionType { normal, right, error }

class OptionButton extends StatelessWidget {
  const OptionButton({
    Key key,
    @required this.text,
    @required this.onTap,
    this.type = OptionType.normal,
  }) : super(key: key);
  final OptionType type;
  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    Color color = AppColors.secondary.withOpacity(0.075);
    if (type == OptionType.right) color = AppColors.greenStatus;
    if (type == OptionType.error) color = AppColors.redStatus;
    return FlatButton(
      padding: EdgeInsets.all(11),
      onPressed: onTap,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: Get.width * .8,
          minWidth: Get.width * .5,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        width: 400,
        height: 60,
        child: Row(
          children: [
            SizedBox(width: 25),
            if (type == OptionType.normal) SizedBox(width: 25),
            if (type == OptionType.right)
              Icon(
                EvaIcons.checkmarkSquareOutline,
                color: AppColors.primary,
                size: 25,
              ),
            if (type == OptionType.error)
              Icon(
                EvaIcons.closeSquareOutline,
                color: AppColors.primary,
                size: 25,
              ),
            SizedBox(width: 25),
            Text(
              text,
              style: AppTextStyles.secondary,
            ),
          ],
        ),
      ),
    );
  }
}
