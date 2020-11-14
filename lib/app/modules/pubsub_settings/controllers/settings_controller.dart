import 'package:get/get.dart';
import 'package:rosset_client/app/data/model/device.dart';
import 'package:rosset_client/app/data/model/dropped_device.dart';
import 'package:rosset_client/app/modules/workspace/controllers/workspace_controller.dart';

class PubSubSettingsController extends GetxController {
  PubSubSettingsController();

  Map<DroppedDeviceModel, Map<DroppedDeviceModel, Map<String, bool>>> data = {};

  WorkspaceController workspace;
  Iterable<DroppedDeviceModel> get devices =>
      workspace.dropped.where((element) => element.model.type == DeviceType.ied);
  @override
  void onInit() {
    super.onInit();
    workspace = Get.find<WorkspaceController>();
    data = workspace.pubSubData ?? {};
  }

  void save() {
    workspace.savePubSub(data);
    Get.back();
  }

  void toggleCross(DroppedDeviceModel device, DroppedDeviceModel another, int i, int j) {
    if (!data.containsKey(device)) data[device] = {};
    if (!data[device].containsKey(another)) data[device][another] = {};
    final key = '$i-$j';
    if (data[device][another].remove(key) != true) data[device][another][key] = true;
    update();
  }

  bool isChecked(DroppedDeviceModel device, DroppedDeviceModel another, int i, int j) {
    if (!data.containsKey(device)) return false;
    if (!data[device].containsKey(another)) return false;
    final key = '$i-$j';
    return data[device][another].containsKey(key);
  }
}
