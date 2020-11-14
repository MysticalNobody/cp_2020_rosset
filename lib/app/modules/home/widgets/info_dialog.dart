import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/theme/app_colors.dart';
import 'package:rosset_client/theme/app_text_styles.dart';

class InfoDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: Get.width > 600 ? 600 : Get.width * .9,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Настройка IED на прием-передачу GOOSE-сообщений',
                style: AppTextStyles.headLine4.copyWith(color: AppColors.text),
              ),
              SizedBox(height: 24),
              Text(
                'Из предложенного набора элементов (два терминала релейной защиты и автоматики и промышленный коммутатор) необходимо собрать схему и выполнить необходимые настройки',
                style: AppTextStyles.text,
              ),
              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: Get.back,
                  child: Text(
                    'Закрыть',
                    style: AppTextStyles.button
                        .copyWith(color: AppColors.secondary),
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
