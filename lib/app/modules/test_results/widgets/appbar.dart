import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/theme/app_colors.dart';

class TestResultAppbar extends StatelessWidget {
  const TestResultAppbar({Key key, @required this.onBackTap}) : super(key: key);
  final void Function() onBackTap;

  @override
  Widget build(BuildContext context) {
    bool isSmallScreen = Get.width < 630;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.secondary,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: 30,
                        top: 7,
                      ),
                      child: Text(
                        'ПАВЕЛ АНАТОЛЬЕВИЧ',
                        style: TextStyle(
                          color: AppColors.text,
                          fontSize: isSmallScreen ? 14 : 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                if (isSmallScreen)
                  Container(
                    margin: EdgeInsets.only(top: 18),
                    child: Text(
                      'Результаты тестирования',
                      style: TextStyle(
                        color: AppColors.secondary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          if (!isSmallScreen)
            Container(
              margin: EdgeInsets.only(top: 18),
              child: Text(
                'Результаты тестирования',
                style: TextStyle(
                  color: AppColors.secondary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          SizedBox(
            width: isSmallScreen ? null : 255,
            child: GestureDetector(
              onTap: onBackTap,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                  ),
                ),
                height: 60,
                padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 20 : 45),
                alignment: Alignment.center,
                child: Text(
                  'Выйти',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
