import 'package:flutter/material.dart';
import 'package:rosset_client/theme/app_colors.dart';
import 'package:rosset_client/theme/app_text_styles.dart';

class InstrumentCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(3),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withOpacity(.15),
            blurRadius: 3,
            spreadRadius: 1,
          ),
        ],
      ),
      child: TextButton(
        onPressed: () {},
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Image.network(
                    'https://relematika.ru/upload/resize_cache/iblock/b3f/282_200_1/%D0%A2%D0%9E%D0%A0200_03_sm.jpg',
                    height: 60,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(width: 12),
                  Flexible(
                    child: Text(
                      'Терминал релейной защиты ',
                      style: AppTextStyles.subtitle,
                    ),
                  )
                ],
              ),
              SizedBox(height: 6),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Подробнее',
                    style: AppTextStyles.subtitle,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
