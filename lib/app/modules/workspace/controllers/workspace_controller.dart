import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/data/model/device.dart';
import 'package:rosset_client/app/data/model/device_link.dart';
import 'package:rosset_client/app/data/model/device_slot.dart';
import 'package:rosset_client/app/data/model/draggable_device.dart';
import 'package:rosset_client/app/data/model/dropped_device.dart';

Map<SettingsFieldType, Function(String)> settingsValidators = {
  SettingsFieldType.gcb: (String val) {
    if (val.isNullOrBlank) throw 'Имя GCB не должно быть пустым';
    if (val.substring(0, 1).isNum) throw 'Имя GCB не должно начинаться с цифры';
  },
  SettingsFieldType.goose: (String val) => {},
  SettingsFieldType.mac: (String val) {
    final min = int.parse('01:0C:CD:01:00:01'.replaceAll(':', ''), radix: 16);
    final max = int.parse('01:0C:CD:01:01:FF'.replaceAll(':', ''), radix: 16);
    final i = int.tryParse(val.replaceAll(':', ''), radix: 16) ?? -1;
    if (i < min || i > max) throw 'Неверный MAC-адрес';
  },
  SettingsFieldType.app: (String val) {
    final min = int.parse('8000', radix: 16);
    final max = int.parse('BFFF', radix: 16);
    final i = int.tryParse(val, radix: 16) ?? -1;
    if (i < min || i > max) throw 'Неверный AppID';
  },
  SettingsFieldType.vlan: (String val) {
    if ((int.tryParse(val) ?? -1) < 0 || (int.tryParse(val) ?? -1) > 4095) throw 'Неверный VLAN ID';
  },
  SettingsFieldType.minTime: (String val) {
    if ((int.tryParse(val) ?? -1) != 4) throw 'Неверное Минимальное время между отправками';
  },
  SettingsFieldType.maxTime: (String val) {
    if ((int.tryParse(val) ?? -1) != 1000) throw 'Неверное Максимальное время между отправками';
  },
  SettingsFieldType.ip1: (String val) {
    if (!val.isIPv4) throw 'Неверно указан IP';
  },
  SettingsFieldType.ip2: (String val) {
    if (!val.isIPv4) throw 'Неверно указан IP';
  },
  SettingsFieldType.masc1: (String val) {
    if (!val.isIPv4) throw 'Неверно указана маска подсети';
  },
  SettingsFieldType.masc2: (String val) {
    if (!val.isIPv4) throw 'Неверно указана маска подсети';
  },
};

class WorkspaceController extends GetxController {
  int hintX, hintY;
  DeviceModel hintModel;
  List<DroppedDeviceModel> dropped = [];
  GlobalKey baseKey = GlobalKey();

  Map<DroppedDeviceModel, Map<DroppedDeviceModel, Map<String, bool>>> pubSubData = {};

  DeviceSlotModel startSlot;
  TransformationController gridController;
  @override
  void onInit() {
    super.onInit();
    final v = Matrix4.identity();
    v.scale(0.8);
    v.translate(-400, -200);
    gridController = TransformationController(v);
  }

  void savePubSub(Map<DroppedDeviceModel, Map<DroppedDeviceModel, Map<String, bool>>> data) {
    pubSubData = data;
  }

  bool enterTarget(int i, int j, DraggableDevice data) {
    hintX = i;
    hintY = j;
    hintModel = data.model ?? data.device.model;
    update();
    return true;
  }

  void onDrop(int i, int j, DraggableDevice _data) {
    if (_data.device != null) {
      _data.device.x = i;
      _data.device.y = j;
      hintModel = null;
      update();
    }
    if (_data.model == null) return;
    final data = _data.model;
    final dm = DroppedDeviceModel()
      ..id = DateTime.now().millisecondsSinceEpoch
      ..model = data
      ..x = i
      ..y = j;
    dm.slots = List.generate(
        data.slotsCount,
        (index) => DeviceSlotModel()
          ..slotId = index
          ..device = dm
          ..key = GlobalKey());
    dm.widget = data.widgetBuilder(dm);
    dropped.add(dm);
    hintModel = null;
    update();
  }

  void leaveTarget(int i, int j) {
    hintModel = null;
    update();
  }

  void onLinkDropped(DeviceSlotModel slot) {
    removeLink(slot);
    startSlot = null;
    update();
  }

  void onLinkEnd(DeviceSlotModel slot, DeviceSlotModel another) {
    removeLink(slot);
    removeLink(another);
    startSlot = null;
    final link = DeviceLinkModel()
      ..start = another
      ..end = slot;
    another.link = link;
    slot.link = link;
    update();
  }

  void removeLink(DeviceSlotModel slot) {
    if (slot.link == null) return;
    final start = slot.link?.start;
    final end = slot.link?.end;
    startSlot = null;
    start?.link = null;
    end?.link = null;
  }

  void onSlotTap(DeviceSlotModel slot) {
    if (startSlot == null) {
      startSlot = slot;
      update();
      return;
    }
    onLinkEnd(slot, startSlot);
  }

  void deleteDevice(DroppedDeviceModel dm) {
    for (final slot in dm.slots) removeLink(slot);
    dropped.remove(dm);
    update();
  }

  void check() {
    DroppedDeviceModel ied1, ied2, commut;
    for (final device in dropped) {
      if (device.model.type == DeviceType.commutator) {
        if (commut == null)
          commut = device;
        else
          throw 'Требуется ровно один коммутатор';
      }
      if (device.model.type == DeviceType.ied) {
        if (ied1 == null)
          ied1 = device;
        else if (ied2 == null)
          ied2 = device;
        else
          throw 'Требуется ровно два РЗА';
      }
    }
    if (ied1 == null || ied2 == null) throw 'Недостаточно РЗА';
    if (commut == null) throw 'Нет коммутатора';
    checkLinks(ied1);
    checkLinks(ied2);
    checkIEDSettings(ied1);
    checkIEDSettings(ied2);
    checkNetworkSettings(commut);
    checkPubSub(ied1, ied2);
  }

  void checkLinks(DroppedDeviceModel ied) {
    final links = ied.slots.where((e) => e.link != null);
    if (links.length != 1) throw 'Требуется ровно одна связь у каждого РЗА';
    if (links.first.link.start.device.model.type != DeviceType.commutator &&
        links.first.link.end.device.model.type != DeviceType.commutator)
      throw 'У каждого РЗА должжна быть связь с коммутатором';
  }

  void checkIEDSettings(DroppedDeviceModel ied) {
    if (ied.settings == null) throw 'Необходимо задать настройки РЗА';
    for (final entry in ied.settings.entries) {
      settingsValidators[entry.key](entry.value);
    }
  }

  void checkNetworkSettings(DroppedDeviceModel commut) {
    if (commut.settings == null) throw 'Необходимо задать настройки коммутатора';
    for (final entry in commut.settings.entries) {
      settingsValidators[entry.key](entry.value);
    }
    if (commut.settings[SettingsFieldType.masc1] != commut.settings[SettingsFieldType.masc2])
      throw 'Маска подсети должна совпадать';
  }

  void checkPubSub(DroppedDeviceModel ied1, DroppedDeviceModel ied2) {
    if (!pubSubData.containsKey(ied1) ||
        !pubSubData.containsKey(ied2) ||
        !pubSubData[ied1].containsKey(ied2) ||
        !pubSubData[ied2].containsKey(ied1)) throw 'РЗА должны быть подписаны на GOOSE сообщения друг-друга';
    final checker = ['0-0', '1-1', '2-2'].toSet();
    if (pubSubData[ied1][ied2].keys.toSet().difference(checker).isNotEmpty)
      throw 'Вход каждого РЗА должен быть подписан на соответствующий выход каждого другого РЗА';
  }
}
