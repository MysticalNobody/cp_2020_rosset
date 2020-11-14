import 'package:get/get.dart';
import 'package:rosset_client/app/data/model/device.dart';
import 'package:rosset_client/app/data/model/dropped_device.dart';
import 'package:rosset_client/app/modules/devices/device1.dart';
import 'package:rosset_client/app/modules/devices/device2.dart';
import 'package:supercharged/supercharged.dart';

class HomeController extends GetxController {
  RxBool showInstruments = true.obs;
  RxBool showSimpleModeButton = true.obs;

  RxBool isSimpleMode = false.obs;

  List<DeviceModel> models = [];

  List<DeviceModel> _models = [
    DeviceModel()
      ..type = DeviceType.rza
      ..name = 'РЗА'
      ..previewImage = 'assets/images/front.png'
      ..width = 4
      ..height = 2
      ..slotsCount = 2
      ..settings = [
        ['Имя GCB', SettingsFieldType.gcb],
        ['GOOSE ID', SettingsFieldType.goose],
        ['MAC адрес', SettingsFieldType.mac],
        ['APP ID', SettingsFieldType.app],
        ['VLAN ID', SettingsFieldType.vlan],
        ['Min Time (мс)', SettingsFieldType.minTime],
        ['Max Time (мс)', SettingsFieldType.maxTime],
      ]
      ..widgetBuilder = (DroppedDeviceModel dm) => Device1(dm),
    DeviceModel()
      ..type = DeviceType.commutator
      ..name = 'Промышленный коммутатор'
      ..previewImage = 'assets/images/commut.png'
      ..width = 6
      ..height = 2
      ..slotsCount = 8
      ..settings = [
        ['test', SettingsFieldType.text]
      ]
      ..widgetBuilder = (DroppedDeviceModel dm) => Device2(dm),
  ];

  void toggleInstruments() {
    showInstruments.value = !showInstruments.value;
    showSimpleModeButton.value = !showSimpleModeButton.value;
  }

  void toggleSimpleMode() {
    isSimpleMode.value = !isSimpleMode.value;
    update();
  }

  void search(String value) {
    if (_models == null) return;
    models = _models
        .filter((element) =>
            element.name.toLowerCase().contains(value.toLowerCase()))
        .toList();
    update();
  }

  @override
  void onInit() {
    models = _models;
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}
}
