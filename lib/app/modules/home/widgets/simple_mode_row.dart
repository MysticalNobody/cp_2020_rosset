import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rosset_client/theme/app_colors.dart';

class SimpleModeRow extends StatelessWidget {
  const SimpleModeRow({
    Key key,
    this.onChanged,
    this.value,
  }) : super(key: key);

  final void Function(bool value) onChanged;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 11,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: AppColors.grey.withOpacity(0.1),
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                EvaIcons.eyeOutline,
                size: 23,
                color: AppColors.secondary,
              ),
              const SizedBox(width: 16),
              Text(
                'Подробный вид',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          CupertinoSwitch(
            activeColor: AppColors.secondary,
            onChanged: onChanged,
            value: value,
          ),
        ],
      ),
    );
  }
}
