import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/modules/pubsub_settings/controllers/settings_controller.dart';
import 'package:rosset_client/theme/app_colors.dart';
import 'package:rosset_client/utils/unfocus_ext.dart';

class PubSubSettingsView extends StatelessWidget {
  PubSubSettingsView() : controller = PubSubSettingsController();
  final PubSubSettingsController controller;
  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = TextStyle(
      color: Color(0xFF303C74),
      fontSize: 14,
    );
    final bool isBigScreen = Get.width > 480;
    return GetBuilder<PubSubSettingsController>(
      init: controller,
      builder: (controller) {
        List<Widget> groups = [];
        int index = -1;
        int jindex = -1;
        for (final device in controller.devices) {
          index += 1;
          jindex = -1;
          List<Widget> devses = [];
          for (final another in controller.devices) {
            jindex += 1;
            if (jindex == index) continue;
            devses.add(SizedBox(height: isBigScreen ? 10 : 5));
            devses.add(
              Row(
                children: [
                  SizedBox(width: isBigScreen ? 19 : 0),
                  Expanded(
                    child: Text(
                      'Выходы IED${jindex + 1}',
                      textAlign: TextAlign.start,
                      style: textStyle,
                    ),
                  ),
                  for (int inputI = 0; inputI < 3; inputI++)
                    Expanded(
                      child: Text(
                        'Вход ${inputI + 1}',
                        textAlign: TextAlign.center,
                        style: textStyle,
                      ),
                    ),
                ],
              ),
            );
            devses.add(SizedBox(height: 5));
            for (int outJ = 0; outJ < 3; outJ++)
              devses.add(
                Row(
                  children: [
                    SizedBox(width: isBigScreen ? 19 : 0),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: isBigScreen ? 34 : 0),
                        child: Text(
                          'Выход ${outJ + 1}',
                          textAlign: TextAlign.start,
                          style: textStyle,
                        ),
                      ),
                    ),
                    for (int inputI = 0; inputI < 3; inputI++)
                      Expanded(
                        child: Checkbox(
                          value: controller.isChecked(device, another, inputI, outJ),
                          onChanged: (_) => controller.toggleCross(device, another, inputI, outJ),
                          checkColor: AppColors.white,
                          activeColor: AppColors.secondary,
                        ),
                      ),
                  ],
                ),
              );
          }
          groups.add(
            Container(
              margin: EdgeInsets.symmetric(vertical: isBigScreen ? 12 : 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (index != 0) const SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: isBigScreen ? 19 : 0),
                      Spacer(),
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Входы IED${index + 1}',
                          textAlign: TextAlign.center,
                          style: textStyle,
                        ),
                      ),
                    ],
                  ),
                  ...devses
                ],
              ),
            ),
          );
        }
        return Dialog(
          child: Container(
            width: isBigScreen ? 480 : Get.width * .9,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                top: isBigScreen ? 49 : 24,
                bottom: 23,
                left: isBigScreen ? 32 : 24,
                right: isBigScreen ? 32 : 24,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: isBigScreen ? 19 : 0,
                      bottom: isBigScreen ? 23 : 15,
                    ),
                    child: Text(
                      'Подписки GOOSE-сообщений',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: AppColors.secondary,
                      ),
                    ),
                  ),
                  ...groups,
                  SizedBox(height: isBigScreen ? 40 : 10),
                  if (isBigScreen)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        RaisedButton(
                          color: Color(0xFF6BCB81),
                          child: Text(
                            'Сохранить',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onPressed: controller.save,
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
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: RaisedButton(
                            color: Color(0xFF6BCB81),
                            child: Text(
                              'Сохранить',
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            onPressed: controller.save,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ).unfocusOnTap();
      },
    );
  }
}
