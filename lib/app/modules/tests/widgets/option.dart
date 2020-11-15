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
    Color color = Color(0xFFE5E8EF);
    if (type == OptionType.right) color = AppColors.greenStatus;
    if (type == OptionType.error) color = AppColors.redStatus;
    return Padding(
      padding: EdgeInsets.only(bottom: 6),
      child: FlatButton(
        padding: EdgeInsets.all(11),
        color: color,
        onPressed: onTap,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: Get.width * .8,
            minWidth: Get.width * .3,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          width: 450,
          height: 60,
          child: Row(
            children: [
              SizedBox(width: 25),
              if (type == OptionType.normal)
                Icon(
                  EvaIcons.squareOutline,
                  color: Color(0xFF495585),
                  size: 25,
                ),
              if (type == OptionType.right)
                Icon(
                  EvaIcons.checkmarkSquareOutline,
                  color: Color(0xFF495585),
                  size: 25,
                ),
              if (type == OptionType.error)
                Icon(
                  EvaIcons.closeSquareOutline,
                  color: Color(0xFF495585),
                  size: 25,
                ),
              SizedBox(width: 25),
              Flexible(
                child: Text(
                  text,
                  style: AppTextStyles.secondary.copyWith(
                    color: Color(0xFF495585),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
