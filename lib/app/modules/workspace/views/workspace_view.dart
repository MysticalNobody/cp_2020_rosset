import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/modules/workspace/controllers/workspace_controller.dart';
import 'package:rosset_client/app/modules/workspace/widgets/device_grid.dart';

class WorkspaceView extends GetView<WorkspaceController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WorkspaceController>(
      init: controller,
      initState: (_) {},
      builder: (_) {
        return InteractiveViewer(
          minScale: 0.1,
          maxScale: 2,
          constrained: false,
          child: Stack(
            children: [
              DeviceGrid(controller: controller),
              for (final dropped in controller.dropped)
                Positioned(
                  left: 100.0 * dropped.x,
                  top: 100.0 * dropped.y,
                  width: 100.0 * dropped.model.width,
                  height: 100.0 * dropped.model.height,
                  child: dropped.widget ?? const SizedBox(),
                ),
              if (controller.hintModel != null)
                Positioned(
                  left: 100.0 * controller.hintX,
                  top: 100.0 * controller.hintY,
                  width: 100.0 * controller.hintModel.width,
                  height: 100.0 * controller.hintModel.height,
                  child: IgnorePointer(
                    child: Container(
                      color: Colors.yellow.withOpacity(0.3),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
