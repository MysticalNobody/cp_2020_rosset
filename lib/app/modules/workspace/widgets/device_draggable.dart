import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/data/model/device.dart';
import 'package:rosset_client/app/modules/workspace/controllers/workspace_controller.dart';

class DeviceDraggable extends StatelessWidget {
  DeviceDraggable(this.model, {this.controller});
  final DeviceModel model;
  final WorkspaceController controller;
  @override
  Widget build(BuildContext context) {
    return LongPressDraggable<DeviceModel>(
      data: model,
      feedback: Container(
        width: 50,
        height: 50,
        color: Colors.blueGrey.withOpacity(0.3),
      ),
      maxSimultaneousDrags: 1,
      hapticFeedbackOnStart: true,
      child: Text(model.name).paddingAll(10),
      dragAnchor: DragAnchor.pointer,
    );
  }
}
