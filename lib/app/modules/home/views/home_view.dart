import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/modules/home/controllers/home_controller.dart';
import 'package:rosset_client/app/modules/home/widgets/appbar.dart';
import 'package:rosset_client/app/modules/home/widgets/device_panel.dart';
import 'package:rosset_client/app/modules/workspace/views/workspace_view.dart';
import 'package:rosset_client/theme/app_colors.dart';
import 'package:rosset_client/utils/unfocus_ext.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: GetBuilder<HomeController>(
        builder: (controller) => Obx(
          () => MouseRegion(
            cursor: controller.cursor.value ?? SystemMouseCursors.basic,
            child: SafeArea(
              child: Column(
                children: [
                  HomeAppBar(
                    onCheckTap: controller.startCheck,
                    onMenuTap: controller.toggleInstruments,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        DevicePanel(devices: controller.models),
                        Expanded(child: WorkspaceView()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ).unfocusOnTap();
  }
}
