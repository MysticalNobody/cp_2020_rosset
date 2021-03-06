import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/data/model/dropped_device.dart';
import 'package:rosset_client/app/modules/home/controllers/home_controller.dart';
import 'package:rosset_client/app/modules/settings/views/settings_view.dart';
import 'package:rosset_client/app/modules/workspace/controllers/workspace_controller.dart';
import 'package:rosset_client/app/modules/workspace/widgets/device_slot.dart';
import 'package:rosset_client/theme/app_colors.dart';
import 'package:rosset_client/theme/app_text_styles.dart';

import 'widgets/settings_button.dart';

//4x2
class Device2 extends StatelessWidget {
  Device2(this.dm);
  final DroppedDeviceModel dm;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => MouseRegion(
        cursor: Get.find<HomeController>().cursor?.value == SystemMouseCursors.basic
            ? SystemMouseCursors.grab
            : Get.find<HomeController>().cursor?.value,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Card(
            elevation: 1,
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Obx(
                      () => AnimatedCrossFade(
                        crossFadeState: Get.find<HomeController>().isSimpleMode.value
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        duration: 100.milliseconds,
                        firstChild: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [],
                        ),
                        secondChild: Image.asset(
                          'assets/images/commut.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 60,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(width: 328),
                      for (int i = 0; i < dm.model.slotsCount / 2; i++)
                        Expanded(
                          child: DeviceSlot(slot: dm.slots[i], size: 22),
                        ),
                      SizedBox(width: 10),
                      for (int i = dm.model.slotsCount ~/ 2; i < dm.model.slotsCount; i++)
                        Expanded(
                          child: DeviceSlot(slot: dm.slots[i], size: 22),
                        ),
                      SizedBox(width: 145),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 12, right: 12, left: 12),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(666),
                          child: Material(
                            color: Colors.white,
                            child: InkWell(
                              onTap: () => Get.find<HomeController>().viewModel(dm),
                              child: Icon(
                                EvaIcons.questionMarkCircle,
                                color: AppColors.secondary,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          dm.model.name,
                          style: AppTextStyles.button,
                        ),
                        Spacer(),
                        SettingsButton(
                          dm: dm,
                        ),
                        SizedBox(width: 12),
                        Material(
                          color: Colors.white,
                          child: InkWell(
                            child: Icon(EvaIcons.closeSquare, color: Colors.redAccent),
                            onTap: () => Get.find<WorkspaceController>().deleteDevice(dm),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
