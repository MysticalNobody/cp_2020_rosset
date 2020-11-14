import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/data/model/device.dart';
import 'package:rosset_client/app/data/model/device_link.dart';
import 'package:rosset_client/app/data/model/device_slot.dart';
import 'package:rosset_client/app/data/model/dropped_device.dart';

class WorkspaceController extends GetxController {
  int hintX, hintY;
  DeviceModel hintModel;
  List<DroppedDeviceModel> dropped = [];
  bool isDragging = false;
  bool linksChanged = false;

  void onDragStarted() {
    isDragging = true;
    update();
  }

  void onDragEnd() {
    isDragging = false;
    update();
  }

  bool enterTarget(int i, int j, DeviceModel data) {
    debugPrint(['enterTarget', i, j, data.name].toString());
    hintX = i;
    hintY = j;
    hintModel = data;
    update();
    return true;
  }

  void onDrop(int i, int j, DeviceModel data) {
    debugPrint(['onDrop', i, j, data.name].toString());
    final dm = DroppedDeviceModel()
      ..id = DateTime.now().millisecondsSinceEpoch
      ..model = data
      ..x = i
      ..y = j;
    dm.slots = List.generate(
        data.slotsCount,
        (index) => DeviceSlotModel()
          ..slotId = index
          ..device = dm
          ..key = GlobalKey());
    dm.widget = data.widgetBuilder(dm);
    dropped.add(dm);
    hintModel = null;
    update();
  }

  void leaveTarget(int i, int j) {
    debugPrint(['leaveTarget', i, j].toString());
    hintModel = null;
    update();
  }

  void onLinkDropped(DeviceSlotModel slot) {
    if (slot.link == null) return;
    final start = slot.link?.start;
    final end = slot.link?.end;
    start.link = null;
    end.link = null;
    linksChanged = !linksChanged;
    update();
  }

  void onLinkEnd(DeviceSlotModel slot, DeviceSlotModel another) {
    final link = DeviceLinkModel()
      ..start = another
      ..end = slot;
    another.link = link;
    slot.link = link;
    linksChanged = !linksChanged;
    update();
  }
}
