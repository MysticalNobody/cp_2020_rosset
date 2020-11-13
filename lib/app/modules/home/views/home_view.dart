import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/modules/home/controllers/home_controller.dart';
import 'package:rosset_client/app/modules/home/widgets/animated_icon.dart';
import 'package:rosset_client/app/modules/home/widgets/device_panel.dart';
import 'package:rosset_client/app/modules/workspace/views/workspace_view.dart';
import 'package:rosset_client/theme/app_colors.dart';
import 'package:rosset_client/utils/unfocus_ext.dart';
import 'package:supercharged_dart/supercharged_dart.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Row(
            children: [
              DevicePanel(),
              Expanded(child: WorkspaceView()),
            ],
          ),
          Positioned(
            top: 24,
            left: 24,
            child: Obx(
              () => AnimatedContainer(
                width: controller.showInstruments.value ? 36 : 64,
                height: controller.showInstruments.value ? 36 : 64,
                duration: 300.milliseconds,
                child: FloatingActionButton(
                  backgroundColor: controller.showInstruments.value
                      ? AppColors.primary
                      : AppColors.white,
                  onPressed: controller.toggleInstruments,
                  child: AnimatedUpDownicon(),
                ),
              ),
            ),
          )
        ],
      ),
    ).unfocusOnTap();
  }
}
