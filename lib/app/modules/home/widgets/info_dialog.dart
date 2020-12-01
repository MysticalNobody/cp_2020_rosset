import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/theme/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: Get.width > 480 ? 480 : Get.width * .9,
        padding: EdgeInsets.only(
          top: Get.width > 480 ? 48 : 36,
          bottom: 22,
          left: Get.width > 480 ? 40 : 25,
          right: Get.width > 480 ? 40 : 25,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const SizedBox(width: 9),
                Icon(
                  EvaIcons.bookOutline,
                  color: Color(0xFF303C74),
                  size: 24,
                ),
                const SizedBox(width: 12),
                Flexible(
                  child: Text(
                    'Настройка IED на прием-передачу\nGOOSE-сообщений',
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
              padding: EdgeInsets.only(left: 9),
              child: Text(
                'Из предложенного набора элементов (два терминала релейной защиты и автоматики и промышленный коммутатор) необходимо собрать схему и выполнить необходимые настройки',
                style: TextStyle(
                  color: Color(0xFF303C74),
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            SizedBox(height: 52),
            if (Get.width > 480)
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
                    onPressed: () => launch('http://tod.itis.team/corp_prof.pdf'),
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
              )
            else
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      color: AppColors.secondary,
                      child: Text(
                        'Открыть учебник',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onPressed: () => launch('http://tod.itis.team/corp_prof.pdf'),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
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
