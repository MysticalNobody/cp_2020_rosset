import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
import 'dart:ui' as ui;

class HomeController extends GetxController {
  RxBool showInstruments = true.obs;
  RxBool showSimpleModeButton = true.obs;
  RxBool showGooseButton = true.obs;
  final IFrameElement _iframeElement1 = IFrameElement()..src = 'https://tod.itis.team/models/bmrz.html';
  final IFrameElement _iframeElement2 = IFrameElement()..src = 'https://tod.itis.team/models/comm.html';

  RxBool isSimpleMode = false.obs;
  Rx<SystemMouseCursor> cursor = Rx<SystemMouseCursor>();

  List<DeviceModel> models = [];

  QuestAttempt attempt;

  List<DeviceModel> _models = [
    DeviceModel()
      ..type = DeviceType.ied
      ..name = 'РЗА'
      ..shortInfo = 'Терминал релейной защиты'
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
      ..shortInfo = 'Объединяет узлы компьютерной сети'
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

  void viewModel(DroppedDeviceModel dm) {
    Get.dialog(Dialog(
      child: SizedBox(
        width: Get.width > 700 ? 700 : Get.width * .9,
        height: Get.width > 700 ? 700 : Get.height * .9,
        child: HtmlElementView(
          viewType: dm.model.type == DeviceType.ied ? 'viewer3d1' : 'viewer3d2',
        ),
      ),
    ));
  }

  void toggleInstruments() {
    showInstruments.value = !showInstruments.value;
    showSimpleModeButton.value = !showSimpleModeButton.value;
    showGooseButton.value = !showGooseButton.value;
  }

  void setSimpleMode(bool oldValue) {
    isSimpleMode.value = !oldValue;
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
    ui.platformViewRegistry.registerViewFactory('viewer3d1', (_) => _iframeElement1);
    ui.platformViewRegistry.registerViewFactory('viewer3d2', (_) => _iframeElement2);
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
