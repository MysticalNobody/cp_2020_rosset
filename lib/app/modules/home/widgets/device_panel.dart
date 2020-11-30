import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/data/model/device.dart';
import 'package:rosset_client/app/modules/home/controllers/home_controller.dart';
import 'package:rosset_client/app/modules/home/widgets/info_dialog.dart';
import 'package:rosset_client/app/modules/pubsub_settings/views/settings_view.dart';
import 'package:rosset_client/theme/app_colors.dart';
import 'package:supercharged_dart/supercharged_dart.dart';

import 'instruction.dart';
import 'instrument_card.dart';
import 'panel_row.dart';
import 'simple_mode_row.dart';

class DevicePanel extends StatelessWidget {
  const DevicePanel({
    Key key,
    this.devices,
  }) : super(key: key);

  final List<DeviceModel> devices;

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find<HomeController>();
    return Obx(
      () => AnimatedContainer(
        duration: 300.milliseconds,
        width: controller.showInstruments.value ? 350 : 0,
        child: Stack(
          fit: StackFit.loose,
          children: [
            AnimatedPositioned(
              left: controller.showInstruments.value ? 0 : -350,
              top: 0,
              duration: 300.milliseconds,
              child: Container(
                color: AppColors.white,
                width: 350,
                height: Get.height - 58,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 17),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                EvaIcons.cubeOutline,
                                size: 23,
                                color: AppColors.secondary,
                              ),
                              const SizedBox(width: 16),
                              Text(
                                'Устройства',
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            EvaIcons.arrowIosDownward,
                            size: 24,
                            color: AppColors.secondary,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Expanded(
                      child: ListView.builder(
                        itemCount: devices.length,
                        itemBuilder: (context, index) => InstrumentCard(
                          model: devices[index],
                        ),
                      ),
                    ),
                    PanelRow(
                      iconData: EvaIcons.twitterOutline,
                      text: 'Подписки GOOSE-сообщений',
                      onTap: controller.openGoose,
                    ),
                    PanelRow(
                      iconData: EvaIcons.bookOutline,
                      text: 'Задание',
                      onTap: () => Get.dialog(InfoDialog()),
                    ),
                    PanelRow(
                      iconData: EvaIcons.fileTextOutline,
                      text: 'Инструкция',
                      onTap: () => Get.dialog(InstructionDialog()),
                    ),
                    SimpleModeRow(
                      onChanged: controller.setSimpleMode,
                      value: !controller.isSimpleMode.value,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
