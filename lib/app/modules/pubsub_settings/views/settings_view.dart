import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/data/model/dropped_device.dart';
import 'package:rosset_client/app/modules/pubsub_settings/controllers/settings_controller.dart';
import 'package:rosset_client/theme/app_colors.dart';
import 'package:rosset_client/theme/app_text_styles.dart';
import 'package:rosset_client/utils/unfocus_ext.dart';

class PubSubSettingsView extends StatelessWidget {
  PubSubSettingsView() : controller = PubSubSettingsController();
  final PubSubSettingsController controller;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PubSubSettingsController>(
      init: controller,
      builder: (controller) {
        List<Widget> groups = [];
        int index = -1;
        int jindex = -1;
        if ((controller.devices?.length ?? 0) < 2) {
          return SizedBox(
            width: Get.width > 1000 ? 1000 : Get.width * .9,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppBar(
                  title: Text('Подписки GOOSE-сообщений'),
                  backgroundColor: AppColors.secondary,
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Center(
                    child: Text(
                      'Для настройки подписок GOOSE-сообщений, необходимо, чтобы на рабочей области было больше одной РЗА',
                      style: AppTextStyles.text,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        for (final device in controller.devices) {
          index += 1;
          jindex = -1;
          List<Widget> devses = [];

          for (final another in controller.devices) {
            jindex += 1;
            if (jindex == index) continue;
            devses.add(Divider());
            devses.add(Row(
              children: [
                Expanded(
                    child: Text('Выходы IED${jindex + 1}',
                        textAlign: TextAlign.center)),
                for (int inputI = 0; inputI < 3; inputI++)
                  Expanded(
                      child: Text('Вход ${inputI + 1}',
                          textAlign: TextAlign.center))
              ],
            ));
            for (int outJ = 0; outJ < 3; outJ++)
              devses.add(Row(
                children: [
                  Expanded(
                      child: Text('Выход IED${outJ + 1}',
                          textAlign: TextAlign.center)),
                  for (int inputI = 0; inputI < 3; inputI++)
                    Expanded(
                      child: Checkbox(
                        value:
                            controller.isChecked(device, another, inputI, outJ),
                        onChanged: (_) => controller.toggleCross(
                            device, another, inputI, outJ),
                      ),
                    )
                ],
              ));
          }
          groups.add(Container(
            margin: EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(children: [
                  Spacer(),
                  Expanded(
                      flex: 3,
                      child: Text('Входы IED${index + 1}',
                          textAlign: TextAlign.center))
                ]),
                ...devses
              ],
            ),
          ));
        }
        return SizedBox(
          width: Get.width > 1000 ? 1000 : Get.width * .9,
          child: Scaffold(
            appBar: AppBar(
              title: Text('Подписки GOOSE-сообщений'),
              backgroundColor: AppColors.secondary,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ...groups,
                    SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        color: AppColors.secondary,
                        onPressed: controller.save,
                        child: Text('Сохранить'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ).unfocusOnTap();
      },
    );
  }
}
