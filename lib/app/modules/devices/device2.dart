import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/data/model/dropped_device.dart';
import 'package:rosset_client/app/modules/workspace/controllers/workspace_controller.dart';
import 'package:rosset_client/app/modules/workspace/widgets/device_slot.dart';
import 'package:rosset_client/theme/app_colors.dart';

//4x2
class Device2 extends StatelessWidget {
  Device2(this.dm);
  final DroppedDeviceModel dm;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (int i = 0; i < 5; i++) DeviceSlot(slot: dm.slots[i]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.delete),
                color: AppColors.accent,
                onPressed: () =>
                    Get.find<WorkspaceController>().deleteDevice(dm),
              ),
              Text('Коммутатор'),
              MaterialButton(
                child: Text('TROUBLE'),
                onPressed: () {},
                color: Colors.red,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
