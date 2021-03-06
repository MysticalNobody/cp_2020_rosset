import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/data/model/device_slot.dart';
import 'package:rosset_client/app/modules/home/widgets/platform_draggable.dart';
import 'package:rosset_client/app/modules/workspace/controllers/workspace_controller.dart';

class DeviceSlot extends StatelessWidget {
  DeviceSlot({this.slot, this.size = 50});
  final DeviceSlotModel slot;
  final double size;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WorkspaceController>(
      builder: (controller) => DragTarget<DeviceSlotModel>(
        builder: (context, list, list2) {
          return MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Center(
              child: GestureDetector(
                onTap: () => controller.onSlotTap(slot),
                child: Container(
                  height: size,
                  width: size,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(3),
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
                    onDraggableCanceled: (_, __) => controller.onLinkDropped(slot),
                    child: Container(
                      width: slot.link != null ? size / 2 : size * .7,
                      height: slot.link != null ? size / 2 : size * .7,
                      color: (slot.link != null
                              ? Colors.blue
                              : list.isNotEmpty || controller.startSlot == slot
                                  ? Colors.green
                                  : Colors.yellow)
                          .withOpacity(0.8),
                      alignment: Alignment.center,
                      child: SizedBox.shrink(key: slot.key),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        onWillAccept: (data) {
          return slot.link == null && slot.device.id != data.device.id;
        },
        onAccept: (another) => controller.onLinkEnd(slot, another),
      ),
    );
  }
}
