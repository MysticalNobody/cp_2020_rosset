import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/modules/home/controllers/home_controller.dart';
import 'package:rosset_client/app/modules/home/widgets/animated_icon.dart';
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
        builder: (controller) => SafeArea(
          child: Column(
            children: [
              HomeAppBar(
                onCheckTap: () {},
                onMenuTap: () {},
              ),
              Expanded(
                child: Row(
                  children: [
                    DevicePanel(
                      onSearchChange: controller.search,
                      devices: controller.models,
                    ),
                    Expanded(child: WorkspaceView()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ).unfocusOnTap();
  }
}
