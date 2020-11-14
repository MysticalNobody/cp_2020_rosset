import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/theme/app_colors.dart';

class LeftCard extends StatelessWidget {
  const LeftCard({
    Key key,
    @required this.onTap,
    @required this.chosen,
  }) : super(key: key);

  final void Function(int pageIndex) onTap;
  final int chosen;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      elevation: 2,
      margin: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => onTap(0),
              child: Container(
                constraints: BoxConstraints(minWidth: Get.width * .22),
                height: 50,
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Container(
                      color: chosen == 0 ? AppColors.secondary : AppColors.white,
                      height: 27,
                      width: 3,
                    ),
                    SizedBox(width: 25),
                    Text(
                      'Конструктор',
                      style: TextStyle(
                        color: AppColors.text.withOpacity(chosen == 0 ? 1.0 : 0.3),
                        fontSize: 16,
                        fontWeight: chosen == 0 ? FontWeight.w500 : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => onTap(1),
              child: Container(
                height: 50,
                constraints: BoxConstraints(minWidth: Get.width * .22),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Container(
                      color: chosen == 1 ? AppColors.secondary : AppColors.white,
                      height: 27,
                      width: 3,
                    ),
                    SizedBox(width: 25),
                    Text(
                      'Тестирование',
                      style: TextStyle(
                        color: AppColors.text.withOpacity(chosen == 1 ? 1.0 : 0.3),
                        fontSize: 16,
                        fontWeight: chosen == 1 ? FontWeight.w500 : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
