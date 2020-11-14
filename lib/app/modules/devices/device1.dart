import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/data/model/dropped_device.dart';
import 'package:rosset_client/app/modules/workspace/controllers/workspace_controller.dart';
import 'package:rosset_client/app/modules/workspace/widgets/device_slot.dart';
import 'package:rosset_client/theme/app_colors.dart';
import 'package:rosset_client/theme/app_text_styles.dart';

//2x2
class Device1 extends StatelessWidget {
  Device1(this.dm);
  final DroppedDeviceModel dm;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Material(
        color: AppColors.white,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primary),
            borderRadius: BorderRadius.circular(6),
          ),
          alignment: Alignment.center,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(EvaIcons.closeSquare),
                  color: Colors.redAccent,
                  onPressed: () =>
                      Get.find<WorkspaceController>().deleteDevice(dm),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(dm.model.name, style: AppTextStyles.mediumLabel),
                  TextButton.icon(
                    icon: Icon(
                      EvaIcons.settings,
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
                    onPressed: () {},
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DeviceSlot(slot: dm.slots[0]),
                      SizedBox(width: 12),
                      DeviceSlot(slot: dm.slots[1]),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
