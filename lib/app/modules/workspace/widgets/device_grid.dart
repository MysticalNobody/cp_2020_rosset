import 'package:flutter/material.dart';
import 'package:rosset_client/app/data/model/draggable_device.dart';
import 'package:rosset_client/app/modules/workspace/controllers/workspace_controller.dart';
import 'package:rosset_client/theme/app_colors.dart';

class DeviceGrid extends StatelessWidget {
  const DeviceGrid({Key key, this.controller}) : super(key: key);
  final WorkspaceController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 100),
        for (int j = 0; j < 12; j++)
          Row(
            children: [
              SizedBox(width: 100),
              for (int i = 0; i < 20; i++)
                DragTarget<DraggableDevice>(
                  builder: (context, list, list2) {
                    return Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 0.25, color: AppColors.grey.withOpacity(.1)),
                      ),
                    );
                  },
                  onWillAccept: (data) => controller.enterTarget(i, j, data),
                  onAccept: (data) => controller.onDrop(i, j, data),
                  onLeave: (_) => controller.leaveTarget(i, j),
                ),
            ],
          ),
        SizedBox(height: 1000),
      ],
    );
  }
}
