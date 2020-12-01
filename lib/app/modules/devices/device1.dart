import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/data/model/dropped_device.dart';
import 'package:rosset_client/app/modules/settings/views/settings_view.dart';
import 'package:rosset_client/app/modules/home/controllers/home_controller.dart';
import 'package:rosset_client/app/modules/workspace/controllers/workspace_controller.dart';
import 'package:rosset_client/app/modules/workspace/widgets/device_slot.dart';
import 'package:rosset_client/theme/app_colors.dart';
import 'package:rosset_client/theme/app_text_styles.dart';

import 'widgets/settings_button.dart';

//2x2
class Device1 extends StatelessWidget {
  Device1(this.dm);
  final DroppedDeviceModel dm;
  RxBool get isSimple => Get.find<HomeController>().isSimpleMode;
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
                Obx(
                  () => AnimatedCrossFade(
                    crossFadeState: isSimple.value ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                    duration: 100.milliseconds,
                    firstChild: Row(children: []),
                    secondChild: Container(
                      height: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Image.asset(
                              'assets/images/left.png',
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          Expanded(
                            child: Image.asset(
                              'assets/images/front.png',
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12, right: 12, left: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                          SettingsButton(dm: dm),
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
                ),
                Row(
                  children: [
                    Spacer(flex: 3),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(height: 160),
                          Expanded(
                            child: Row(
                              children: [
                                DeviceSlot(slot: dm.slots[0], size: 25),
                                Obx(
                                  () => !isSimple.value
                                      ? SizedBox()
                                      : Padding(
                                          padding: const EdgeInsets.only(left: 12.0),
                                          child: Text('Порт 71'),
                                        ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                DeviceSlot(slot: dm.slots[1], size: 25),
                                Obx(
                                  () => !isSimple.value
                                      ? SizedBox()
                                      : Padding(
                                          padding: const EdgeInsets.only(left: 12.0),
                                          child: Text('Порт 72'),
                                        ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 70,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 208,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
