import 'package:flutter/material.dart';

import 'dropped_device.dart';

enum DeviceType { ied, commutator }
enum SettingsFieldType {
  gcb,
  goose,
  mac,
  app,
  vlan,
  minTime,
  maxTime,
  ip1,
  ip2,
  masc1,
  masc2,
}

class DeviceModel {
  DeviceType type;
  int width;
  int height;
  String name;
  String shortInfo;
  String previewImage;
  int slotsCount;
  List<List<dynamic>> settings;
  Widget Function(DroppedDeviceModel) widgetBuilder;
}
