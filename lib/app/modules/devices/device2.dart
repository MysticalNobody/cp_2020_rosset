import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/data/model/dropped_device.dart';
import 'package:rosset_client/app/modules/home/controllers/home_controller.dart';
import 'package:rosset_client/app/modules/settings/views/settings_view.dart';
import 'package:rosset_client/app/modules/workspace/controllers/workspace_controller.dart';
import 'package:rosset_client/app/modules/workspace/widgets/device_slot.dart';
import 'package:rosset_client/theme/app_colors.dart';
import 'package:rosset_client/theme/app_text_styles.dart';

//4x2
class Device2 extends StatelessWidget {
  Device2(this.dm);
  final DroppedDeviceModel dm;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
                      children: [
                        Text(dm.model.name),
                      ],
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
              top: 75,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Spacer(flex: 3),
                  for (int i = 0; i < 8; i++)
                    Expanded(
                      child: DeviceSlot(slot: dm.slots[i], size: 37),
                    ),
                  Spacer(flex: 2),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Row(
                children: [
                  SizedBox(width: 12),
                  IconButton(
                    onPressed: () => Get.find<HomeController>().viewModel(dm),
                    color: AppColors.secondary,
                    icon: Icon(EvaIcons.questionMarkCircle),
                    splashRadius: 18,
                  ),
                  Text(
                    dm.model.name,
                    style: AppTextStyles.button,
                  ),
                  Spacer(),
                  TextButton.icon(
                    icon: Icon(
                      EvaIcons.settings2Outline,
                      color: AppColors.secondary,
                    ),
                    label: Text(
                      'Настройка',
                      style: TextStyle(
                        color: AppColors.secondary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () => Get.dialog(SettingsView(dm)),
                  ),
                  IconButton(
                    icon: Icon(EvaIcons.closeSquare),
                    color: Colors.redAccent,
                    onPressed: () => Get.find<WorkspaceController>().deleteDevice(dm),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
