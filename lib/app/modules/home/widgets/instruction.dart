import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/theme/app_colors.dart';
import 'package:rosset_client/theme/app_text_styles.dart';

class InstructionDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: Get.width > 600 ? 600 : Get.width * .9,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Инструкция',
                  style: AppTextStyles.headLine4.copyWith(color: AppColors.secondary),
                ),
                SizedBox(height: 24),
                Text(
                  'Что такое рабочая область?',
                  style: AppTextStyles.subtitle,
                ),
                SizedBox(height: 12),
                Text(
                  'Рабочая область это пространство, на котором вы можете выполнять задания. На неё можно перетаскивать инструенты и взаимодействовать с ними',
                  style: AppTextStyles.text,
                ),
                SizedBox(height: 24),
                Text(
                  'Как взаимодействовать с инструментами?',
                  style: AppTextStyles.subtitle,
                ),
                SizedBox(height: 12),
                if (kIsWeb)
                  Text(
                    'Для того, чтобы взаимодействовать с инструментом, вы должны перетащить его на рабочую область.\nВы можете выстраивать связи между инструментами, а также настраивать или удалять их на рабочей панели',
                    style: AppTextStyles.text,
                  )
                else
                  Text(
                    'Для того, чтобы взаимодействовать с инструментом, вы должны долгим нажатием перетащить его на рабочую область.\nВы можете выстраивать связи между инструментами, а также настраивать или удалять их на рабочей панели',
                    style: AppTextStyles.text,
                  ),
                SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: Get.back,
                    child: Text(
                      'Закрыть',
                      style: AppTextStyles.button.copyWith(color: AppColors.secondary),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
