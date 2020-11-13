import 'package:flutter/material.dart';
import 'package:rosset_client/app/data/model/device.dart';
import 'package:rosset_client/app/modules/workspace/controllers/workspace_controller.dart';

class DeviceGrid extends StatelessWidget {
  const DeviceGrid({Key key, this.controller}) : super(key: key);
  final WorkspaceController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(400),
      child: Column(
        children: [
          for (int j = 0; j < 20; j++)
            Row(
              children: [
                for (int i = 0; i < 20; i++)
                  DragTarget<DeviceModel>(
                    builder: (context, list, list2) {
                      return Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.5, color: Colors.grey),
                        ),
                      );
                    },
                    onWillAccept: (data) => controller.enterTarget(i, j, data),
                    onAccept: (data) => controller.onDrop(i, j, data),
                    onLeave: (_) => controller.leaveTarget(i, j),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}