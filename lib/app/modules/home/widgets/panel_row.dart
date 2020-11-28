import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:rosset_client/theme/app_colors.dart';

class PanelRow extends StatelessWidget {
  const PanelRow({
    Key key,
    @required this.iconData,
    @required this.text,
    @required this.onTap,
  }) : super(key: key);
  final IconData iconData;
  final String text;

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 17,
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
                  iconData,
                  size: 23,
                  color: AppColors.secondary,
                ),
                const SizedBox(width: 16),
                Text(
                  text,
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            Icon(
              EvaIcons.arrowIosForward,
              size: 24,
              color: AppColors.secondary,
            ),
          ],
        ),
      ),
    );
  }
}
