import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/modules/home/controllers/home_controller.dart';
import 'package:rosset_client/theme/app_colors.dart';
import 'package:rosset_client/theme/app_text_styles.dart';
import 'package:supercharged_dart/supercharged_dart.dart';

import 'instrument_card.dart';

class DevicePanel extends StatelessWidget {
  const DevicePanel({Key key, this.opened}) : super(key: key);
  final bool opened;

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find<HomeController>();
    return Obx(
      () => AnimatedContainer(
        duration: 300.milliseconds,
        width: controller.showInstruments.value ? 300 : 0,
        child: Stack(
          fit: StackFit.loose,
          children: [
            AnimatedPositioned(
              left: controller.showInstruments.value ? 0 : -300,
              top: 0,
              duration: 300.milliseconds,
              child: Container(
                color: AppColors.primary,
                width: 300,
                height: Get.height,
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 6),
                    Row(
                      children: [
                        SizedBox(width: 56),
                        Text(
                          'Выбор инструмента',
                          style: AppTextStyles.subtitle
                              .copyWith(color: AppColors.white),
                        ),
                      ],
                    ),
                    SizedBox(height: 36),
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 6),
                        hintText: 'Поиск',
                        prefixIcon: Icon(EvaIcons.searchOutline),
                      ),
                    ),
                    SizedBox(height: 24),
                    ...controller.models
                        .map((m) => InstrumentCard(model: m))
                        .toList(),
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
