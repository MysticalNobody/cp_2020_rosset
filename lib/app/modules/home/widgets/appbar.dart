import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:rosset_client/theme/app_colors.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key key,
    @required this.onMenuTap,
    @required this.onCheckTap,
  }) : super(key: key);
  final void Function() onMenuTap;
  final void Function() onCheckTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: SafeArea(
        bottom: false,
        child: Container(
          width: double.infinity,
          height: 58,
          padding: const EdgeInsets.symmetric(
            vertical: 9,
            horizontal: 15,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border(
              bottom: BorderSide(
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(99),
                    child: Material(
                      color: AppColors.white,
                      child: SizedBox(
                        width: 38,
                        height: 38,
                        child: InkWell(
                          onTap: onMenuTap,
                          child: Icon(
                            EvaIcons.menuOutline,
                            size: 30,
                            color: AppColors.secondary,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 11),
                  Text(
                    'Тренажёр',
                    style: TextStyle(
                      color: AppColors.secondary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              RaisedButton(
                color: Color(0xFF6BCB81),
                onPressed: onCheckTap,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 1,
                    vertical: 8,
                  ),
                  child: Text(
                    'Проверить',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
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
