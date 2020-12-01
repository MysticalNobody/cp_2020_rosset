import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/theme/app_colors.dart';

class InstructionDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: Get.width > 480 ? 480 : Get.width * .9,
        padding: EdgeInsets.only(
          top: Get.width > 480 ? 48 : 36,
          bottom: 22,
          left: Get.width > 480 ? 48 : 32,
          right: 21,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(
                  EvaIcons.gridOutline,
                  color: Color(0xFF303C74),
                  size: 24,
                ),
                const SizedBox(width: 12),
                Flexible(
                  child: Text(
                    'Что такое рабочая область?',
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
                'Рабочая область – это пространство, на котором вы можете выполнять задания. На неё можно перетаскивать инструменты и взаимодействовать с ними.',
                style: TextStyle(
                  color: Color(0xFF303C74),
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            SizedBox(height: 22),
            Row(
              children: [
                Icon(
                  EvaIcons.cubeOutline,
                  color: Color(0xFF303C74),
                  size: 24,
                ),
                const SizedBox(width: 12),
                Flexible(
                  child: Text(
                    'Как взаимодействовать с инструментами?',
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
                'Чтобы взаимодействовать с инструментом, его нужно перетащить  на рабочую область. Вы можете выстраивать связи между инструментами, соединяя разъёмы, выделенные зелёным цветом, а также настраивать или удалять инструменты с рабочего поля.',
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
