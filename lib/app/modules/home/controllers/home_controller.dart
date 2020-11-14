import 'package:get/get.dart';
import 'package:rosset_client/app/data/model/device.dart';
import 'package:rosset_client/app/data/model/dropped_device.dart';
import 'package:rosset_client/app/modules/devices/device1.dart';
import 'package:rosset_client/app/modules/devices/device2.dart';

class HomeController extends GetxController {
  RxBool showInstruments = true.obs;

  List<DeviceModel> models = [
    DeviceModel()
      ..name = 'Прибор 2x2'
      ..width = 2
      ..height = 2
      ..slotsCount = 2
      ..widgetBuilder = (DroppedDeviceModel dm) => Device1(dm),
    DeviceModel()
      ..name = 'Прибор 4x2'
      ..width = 4
      ..height = 2
      ..slotsCount = 5
      ..widgetBuilder = (DroppedDeviceModel dm) => Device2(dm),
  ];

  void toggleInstruments() {
    showInstruments.value = !showInstruments.value;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}
}
