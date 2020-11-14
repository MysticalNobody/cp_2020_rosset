import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/data/model/device_slot.dart';
import 'package:rosset_client/app/modules/home/widgets/platform_draggable.dart';
import 'package:rosset_client/app/modules/workspace/controllers/workspace_controller.dart';

class DeviceSlot extends StatelessWidget {
  DeviceSlot({this.slot});
  final DeviceSlotModel slot;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WorkspaceController>(
      builder: (_) => DragTarget<DeviceSlotModel>(
        builder: (context, list, list2) {
          return Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              border: Border.all(width: 0.5, color: Colors.grey),
              borderRadius: BorderRadius.circular(3)
            ),
            alignment: Alignment.center,
            child: PlatformDraggable<DeviceSlotModel>(
              data: slot,
              feedback: Container(
                width: 10,
                height: 10,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      left: -10,
                      top: -10,
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withOpacity(0.3),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              onDraggableCanceled: (_, __) =>
                  Get.find<WorkspaceController>().onLinkDropped(slot),
              child: Container(
                width: slot.link != null ? 25 : 40,
                height: slot.link != null ? 25 : 40,
                color: (slot.link != null
                        ? Colors.black
                        : list.isNotEmpty
                            ? Colors.green
                            : Colors.grey)
                    .withOpacity(0.3),
                alignment: Alignment.center,
                child: SizedBox.shrink(key: slot.key),
              ),
            ),
          );
        },
        onWillAccept: (data) {
          return slot.link == null && slot.device.id != data.device.id;
        },
        onAccept: (another) =>
            Get.find<WorkspaceController>().onLinkEnd(slot, another),
      ),
    );
  }
}
