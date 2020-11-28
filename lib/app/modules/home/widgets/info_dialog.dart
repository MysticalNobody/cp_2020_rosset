import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/theme/app_colors.dart';
import 'package:rosset_client/theme/app_text_styles.dart';

class InfoDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: Get.width > 480 ? 480 : Get.width * .9,
        padding: const EdgeInsets.only(
          top: 48,
          bottom: 22,
          left: 40,
          right: 40, //TODO: make adaptive
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const SizedBox(width: 9),
                Icon(
                  EvaIcons.bookOutline,
                  color: AppColors.primary,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Flexible(
                  child: Text(
                    'Настройка IED на прием-передачу\nGOOSE-сообщений',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.only(left: 9),
              child: Text(
                'Из предложенного набора элементов (два терминала релейной защиты и автоматики и промышленный коммутатор) необходимо собрать схему и выполнить необходимые настройки',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            SizedBox(height: 52),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RaisedButton(
                  color: AppColors.secondary,
                  child: Text(
                    'Открыть учебник',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onPressed: Get.back,
                ),
                SizedBox(
                  width: 125,
                  child: RaisedButton(
                    color: AppColors.secondary,
                    child: Text(
                      'Закрыть',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: Get.back,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
