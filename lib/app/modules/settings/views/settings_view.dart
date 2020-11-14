import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/data/model/dropped_device.dart';
import 'package:rosset_client/app/modules/settings/controllers/settings_controller.dart';
import 'package:rosset_client/theme/app_colors.dart';
import 'package:rosset_client/utils/unfocus_ext.dart';

class SettingsView extends StatelessWidget {
  SettingsView(this.device) : controller = SettingsController(device);
  final DroppedDeviceModel device;
  final SettingsController controller;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      init: controller,
      builder: (controller) => SizedBox(
        width: Get.width > 600 ? 600 : Get.width * .9,
        child: Scaffold(
          appBar: AppBar(
            title: Text(device.model.name),
            backgroundColor: AppColors.secondary,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < device.model.settings.length; i += 1)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: device.model.settings[i][0]),
                        controller: controller.controllers.length > 0
                            ? controller?.controllers[i]
                            : TextEditingController(),
                      ),
                    ),
                  SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      color: AppColors.secondary,
                      onPressed: controller.save,
                      child: Text('Сохранить'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ).unfocusOnTap(),
    );
  }
}
