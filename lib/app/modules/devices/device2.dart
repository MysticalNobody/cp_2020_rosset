import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/data/model/dropped_device.dart';
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
      child: Material(
        color: AppColors.white,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.accent),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (int i = 0; i < 5; i++) DeviceSlot(slot: dm.slots[i]),
                ],
              ),
              Flexible(
                  child: Text(dm.model.name, style: AppTextStyles.mediumLabel)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton.icon(
                      icon: Icon(
                        EvaIcons.closeSquare,
                        color: Colors.redAccent,
                      ),
                      label: Text(
                        'Удалить',
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () =>
                          Get.find<WorkspaceController>().deleteDevice(dm),
                    ),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
