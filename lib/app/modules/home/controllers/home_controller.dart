import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/data/model/device.dart';
import 'package:rosset_client/app/data/model/dropped_device.dart';
import 'package:rosset_client/app/data/model/quest_attempt.dart';
import 'package:rosset_client/app/data/model/quest_mistake.dart';
import 'package:rosset_client/app/data/repository/quest_repository.dart';
import 'package:rosset_client/app/modules/devices/device1.dart';
import 'package:rosset_client/app/modules/devices/device2.dart';
import 'package:rosset_client/app/modules/workspace/controllers/workspace_controller.dart';
import 'package:rosset_client/app/routes/app_pages.dart';
import 'package:rosset_client/utils/utils.dart';
import 'package:supercharged/supercharged.dart';
import 'package:js/js.dart' as js;
import 'dart:ui' as ui;

import 'model_controller.dart';

class HomeController extends GetxController {
  RxBool showInstruments = true.obs;
  RxBool showSimpleModeButton = true.obs;
  RxBool showGooseButton = true.obs;
  final IFrameElement _iframeElement = IFrameElement();

  RxBool isSimpleMode = false.obs;

  List<DeviceModel> models = [];

  QuestAttempt attempt;

  List<DeviceModel> _models = [
    DeviceModel()
      ..type = DeviceType.ied
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
        ['IED 1'],
        ['IP адрес', SettingsFieldType.ip1],
        ['Маска подсети', SettingsFieldType.masc1],
        ['IED 2'],
        ['IP адрес', SettingsFieldType.ip2],
        ['Маска подсети', SettingsFieldType.masc2],
      ]
      ..widgetBuilder = (DroppedDeviceModel dm) => Device2(dm),
  ];

  void viewModel() {
    Get.dialog(Dialog(
      child: HtmlElementView(
        viewType: 'viewer',
      ),
    ));
    view3dModel();
  }

  void toggleInstruments() {
    showInstruments.value = !showInstruments.value;
    showSimpleModeButton.value = !showSimpleModeButton.value;
    showGooseButton.value = !showGooseButton.value;
  }

  void toggleSimpleMode() {
    isSimpleMode.value = !isSimpleMode.value;
    update();
  }

  void search(String value) {
    if (_models == null) return;
    models = _models.filter((element) => element.name.toLowerCase().contains(value.toLowerCase())).toList();
    update();
  }

  @override
  void onInit() {
    models = _models;
    attempt = QuestAttempt()
      ..start = DateTime.now()
      ..mistakes = [];
    ui.platformViewRegistry.registerViewFactory('viewer', (_) => _iframeElement);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void startCheck() {
    final controller = Get.find<WorkspaceController>();
    try {
      controller.check();
      attempt.end = DateTime.now();
      Get.find<QuestRepository>().updateAttempt(attempt);
      Get.toNamed(Routes.TESTS);
    } on String catch (err) {
      Utils.showSnackbar('Ошибка', err, type: SnackbarType.error);
      attempt.mistakes.add(QuestMistake()
        ..time = DateTime.now()
        ..mistake = err);
      Get.find<QuestRepository>().updateAttempt(attempt);
    }
  }
}
