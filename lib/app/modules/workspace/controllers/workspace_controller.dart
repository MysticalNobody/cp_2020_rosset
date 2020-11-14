import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/data/model/device.dart';
import 'package:rosset_client/app/data/model/device_link.dart';
import 'package:rosset_client/app/data/model/device_slot.dart';
import 'package:rosset_client/app/data/model/draggable_device.dart';
import 'package:rosset_client/app/data/model/dropped_device.dart';

class WorkspaceController extends GetxController {
  int hintX, hintY;
  DeviceModel hintModel;
  List<DroppedDeviceModel> dropped = [];
  GlobalKey baseKey = GlobalKey();

  TransformationController gridController;
  @override
  void onInit() {
    super.onInit();
    final v = Matrix4.identity();
    v.scale(0.8);
    gridController = TransformationController(v);
  }

  bool enterTarget(int i, int j, DraggableDevice data) {
    hintX = i;
    hintY = j;
    hintModel = data.model ?? data.device.model;
    update();
    return true;
  }

  void onDrop(int i, int j, DraggableDevice _data) {
    if (_data.device != null) {
      _data.device.x = i;
      _data.device.y = j;
      hintModel = null;
      update();
    }
    if (_data.model == null) return;
    final data = _data.model;
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
    hintModel = null;
    update();
  }

  void onLinkDropped(DeviceSlotModel slot) {
    removeLink(slot);
    update();
  }

  void onLinkEnd(DeviceSlotModel slot, DeviceSlotModel another) {
    removeLink(slot);
    removeLink(another);
    final link = DeviceLinkModel()
      ..start = another
      ..end = slot;
    another.link = link;
    slot.link = link;
    update();
  }

  void removeLink(DeviceSlotModel slot) {
    if (slot.link == null) return;
    final start = slot.link?.start;
    final end = slot.link?.end;
    start?.link = null;
    end?.link = null;
  }

  void deleteDevice(DroppedDeviceModel dm) {
    for (final slot in dm.slots) removeLink(slot);
    dropped.remove(dm);
    update();
  }
}
