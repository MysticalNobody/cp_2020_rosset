import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/data/model/device.dart';
import 'package:rosset_client/app/modules/home/controllers/home_controller.dart';
import 'package:rosset_client/theme/app_colors.dart';
import 'package:rosset_client/theme/app_text_styles.dart';
import 'package:supercharged_dart/supercharged_dart.dart';

import 'instrument_card.dart';

class DevicePanel extends StatelessWidget {
  const DevicePanel({
    Key key,
    this.opened,
    this.onSearchChange,
    this.devices,
  }) : super(key: key);
  final bool opened;
  final Function(String) onSearchChange;
  final List<DeviceModel> devices;

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
                color: AppColors.white,
                width: 300,
                height: Get.height,
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 28),
                      Row(
                        children: [
                          SizedBox(width: 56),
                          Text('Инструменты', style: TextStyle(fontSize: 20, color: Color(0xFF303C74))),
                        ],
                      ),
                      SizedBox(height: 24),
                      TextFormField(
                        onChanged: onSearchChange,
                        decoration: InputDecoration(
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(
                              color: AppColors.secondary,
                              width: .5,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 6),
                          hintText: 'Поиск',
                          hintStyle: AppTextStyles.text.copyWith(
                            fontSize: 16,
                            color: AppColors.text.withOpacity(.5),
                          ),
                          prefixIcon: Icon(
                            EvaIcons.searchOutline,
                            color: AppColors.secondary,
                          ),
                        ),
                        style: AppTextStyles.text.copyWith(fontSize: 16),
                      ),
                      SizedBox(height: 30),
                      ...devices.map((m) => InstrumentCard(model: m)).toList(),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
