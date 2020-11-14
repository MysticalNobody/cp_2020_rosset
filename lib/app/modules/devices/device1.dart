import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/data/model/dropped_device.dart';
import 'package:rosset_client/app/modules/workspace/controllers/workspace_controller.dart';
import 'package:rosset_client/app/modules/workspace/widgets/device_slot.dart';
import 'package:rosset_client/theme/app_colors.dart';

//2x2
class Device1 extends StatelessWidget {
  Device1(this.dm);
  final DroppedDeviceModel dm;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.delete),
            color: AppColors.accent,
            onPressed: () => Get.find<WorkspaceController>().deleteDevice(dm),
          ),
          Text('Прибор 2 x 2', style: TextStyle(color: Colors.white)),
          DeviceSlot(slot: dm.slots[0]),
          DeviceSlot(slot: dm.slots[1]),
        ],
      ),
    );
  }
}
