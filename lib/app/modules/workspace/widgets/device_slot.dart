import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/data/model/device_slot.dart';
import 'package:rosset_client/app/modules/workspace/controllers/workspace_controller.dart';

class DeviceSlot extends StatelessWidget {
  DeviceSlot({this.slot});
  final DeviceSlotModel slot;
  @override
  Widget build(BuildContext context) {
    return DragTarget<DeviceSlotModel>(
      key: slot.key,
      builder: (context, list, list2) {
        return Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            border: Border.all(width: 0.5, color: Colors.grey),
          ),
          alignment: Alignment.center,
          child: LongPressDraggable<DeviceSlotModel>(
            data: slot,
            feedback: Container(
              width: 50,
              height: 50,
              color: Colors.red.withOpacity(0.3),
            ),
            maxSimultaneousDrags: 1,
            hapticFeedbackOnStart: true,
            dragAnchor: DragAnchor.pointer,
            onDraggableCanceled: Get.find<WorkspaceController>().onLinkDropped(slot),
            child: Container(
              width: slot.link != null ? 25 : 40,
              height: slot.link != null ? 25 : 40,
              color: (slot.link != null ? Colors.black : Colors.grey)
                  .withOpacity(0.3),
            ),
          ),
        );
      },
      onWillAccept: (data) {
        return slot.link == null && slot.device.id != data.device.id;
      },
      onAccept: (another) =>
          Get.find<WorkspaceController>().onLinkEnd(slot, another),
    );
  }
}
