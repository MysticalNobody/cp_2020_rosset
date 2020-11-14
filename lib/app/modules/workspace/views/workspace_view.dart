import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/data/model/device.dart';
import 'package:rosset_client/app/modules/workspace/controllers/workspace_controller.dart';
import 'package:rosset_client/app/modules/workspace/widgets/device_grid.dart';
import 'package:rosset_client/theme/app_colors.dart';
import 'package:rosset_client/theme/app_text_styles.dart';

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
                  child: Draggable<DeviceModel>(
                      onDragStarted: () => controller.dropped.remove(dropped),
                      data: dropped.model,
                      feedback: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Container(
                          width: 276,
                          height: 120,
                          child: Material(
                            color: AppColors.secondary.withOpacity(0.2),
                            child: Center(
                              child: Text(
                                dropped.model.name,
                                style: AppTextStyles.mediumLabel,
                              ),
                            ),
                          ),
                        ),
                      ),
                      child: dropped.widget ?? const SizedBox()),
                ),
              if (controller.hintModel != null)
                Positioned(
                  left: 100.0 * controller.hintX,
                  top: 100.0 * controller.hintY,
                  width: 100.0 * controller.hintModel.width,
                  height: 100.0 * controller.hintModel.height,
                  child: IgnorePointer(
                    child: Container(
                      color: AppColors.accent.withOpacity(0.1),
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
