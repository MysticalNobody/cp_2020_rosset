import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/data/model/device.dart';
import 'package:rosset_client/app/data/model/dropped_device.dart';

class WorkspaceController extends GetxController {
  int hintX, hintY;
  DeviceModel hintModel;
  List<DroppedDeviceModel> dropped = [];
  bool isDragging = false;
  GlobalKey baseKey = GlobalKey();

  void onDragStarted() {
    isDragging = true;
    update();
  }

  void onDragEnd() {
    isDragging = false;
    update();
  }

  void getBaseOffset() {
    final RenderBox rb = baseKey.currentContext.findRenderObject();
    debugPrint(rb.localToGlobal(Offset.zero).toString());
  }

  bool enterTarget(int i, int j, DeviceModel data) {
    debugPrint(['enterTarget', i, j, data.name].toString());
    hintX = i;
    hintY = j;
    hintModel = data;
    // getBaseOffset();
    update();
    return true;
  }

  void onDrop(int i, int j, DeviceModel data) {
    debugPrint(['onDrop', i, j, data.name].toString());
    final dm = DroppedDeviceModel()
      ..model = data
      ..x = i
      ..y = j;
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
}
