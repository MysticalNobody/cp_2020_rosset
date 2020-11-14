import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/data/model/dropped_device.dart';
import 'package:rosset_client/utils/logger.dart';
import 'package:rosset_client/utils/utils.dart';

class SettingsController extends GetxController {
  SettingsController(this.device);
  final DroppedDeviceModel device;
  List<TextEditingController> controllers = [];

  void save() {
    if (device.settings == null) {
      device.settings = {};
    }
    for (int i = 0; i < device.model.settings.length; i += 1) {
      device.settings[device.model.settings[i][1]] = controllers[i]?.text ?? '';
    }
    Get.back();
    Utils.showSnackbar('Настройки сохранены', 'Устройство ${device.model.name}',
        type: SnackbarType.success);
  }

  @override
  void onInit() {
    for (int i = 0; i < device.model.settings.length; i += 1) {
      String text;
      if (device.settings?.isNotEmpty ?? false) {
        text = device.settings[device.model.settings[i][1]];
      }
      controllers.add(TextEditingController(text: text));
    }
    super.onInit();
    update();
  }

}
