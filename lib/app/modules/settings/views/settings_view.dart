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
    final bool isBigScreen = Get.width > 416;
    return GetBuilder<SettingsController>(
      init: controller,
      builder: (controller) => Dialog(
        child: SizedBox(
          width: isBigScreen ? 416 : Get.width * .9,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              top: isBigScreen ? 49 : 24,
              bottom: 23,
              left: isBigScreen ? 32 : 24,
              right: isBigScreen ? 32 : 24,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: isBigScreen ? 19 : 0,
                    bottom: isBigScreen ? 23 : 18,
                  ),
                  child: Text(
                    device.model.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: AppColors.secondary,
                    ),
                  ),
                ),
                for (int i = 0; i < device.model.settings.length; i += 1)
                  if (device.model.settings[i].length == 2)
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 9,
                        left: isBigScreen ? 19 : 0,
                        right: isBigScreen ? 23 : 0,
                      ),
                      child: TextField(
                        style: TextStyle(
                          color: Color(0xFF303C74),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                        decoration: InputDecoration(
                          labelText: device.model.settings[i][0],
                          labelStyle: TextStyle(
                            color: Color(0xFF303C74).withOpacity(0.5),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: AppColors.grey.withOpacity(0.1),
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: AppColors.grey.withOpacity(0.1),
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: AppColors.secondary,
                              width: 2,
                            ),
                          ),
                        ),
                        cursorColor: AppColors.secondary,
                        controller:
                            controller.controllers.isNotEmpty ? controller?.controllers[i] : TextEditingController(),
                      ),
                    )
                  else
                    Padding(
                      padding: EdgeInsets.only(
                        top: i == 0 ? 0 : 10,
                        bottom: 8,
                        left: isBigScreen ? 19 : 0,
                      ),
                      child: Text(
                        device.model.settings[i][0],
                        style: TextStyle(
                          color: Color(0xFF303C74),
                          fontSize: 14,
                        ),
                      ),
                    ),
                SizedBox(height: isBigScreen ? 40 : 20),
                if (isBigScreen)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 125,
                        child: RaisedButton(
                          color: AppColors.secondary,
                          child: Text(
                            'Закрыть',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onPressed: Get.back,
                        ),
                      ),
                      RaisedButton(
                        color: Color(0xFF6BCB81),
                        child: Text(
                          'Сохранить',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onPressed: controller.save,
                      ),
                    ],
                  )
                else
                  Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          color: AppColors.secondary,
                          child: Text(
                            'Закрыть',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onPressed: Get.back,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          color: Color(0xFF6BCB81),
                          child: Text(
                            'Сохранить',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onPressed: controller.save,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ).unfocusOnTap(),
    );
  }
}
