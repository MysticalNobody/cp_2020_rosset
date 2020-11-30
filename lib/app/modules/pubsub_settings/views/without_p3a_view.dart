import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/theme/app_colors.dart';

class WithoutP3AView extends StatelessWidget {
  const WithoutP3AView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: Get.width > 480 ? 480 : Get.width * .9,
        padding: const EdgeInsets.only(
          top: 48,
          bottom: 22,
          left: 48,
          right: 21, //TODO: make adaptive
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(
                  EvaIcons.twitterOutline,
                  color: AppColors.primary,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Flexible(
                  child: Text(
                    'Подписки GOOSE-сообщений',
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
              padding: EdgeInsets.only(right: 30),
              child: Text(
                'Для настройки подписок GOOSE-сообщений, необходимо, чтобы на рабочей области было больше одной РЗА',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            SizedBox(height: 44),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
