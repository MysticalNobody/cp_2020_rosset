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
        padding: EdgeInsets.only(
          top: Get.width > 480 ? 48 : 46,
          bottom: 22,
          left: Get.width > 480 ? 48 : 36,
          right: 21,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(
                  EvaIcons.twitterOutline,
                  color: Color(0xFF303C74),
                  size: 24,
                ),
                const SizedBox(width: 12),
                Flexible(
                  child: Text(
                    'Подписки GOOSE-сообщений',
                    style: TextStyle(
                      color: Color(0xFF303C74),
                      fontSize: 18,
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
                  color: Color(0xFF303C74),
                  fontSize: 13,
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
