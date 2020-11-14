import 'package:flutter/material.dart';

import 'dropped_device.dart';

enum DeviceType { rza, commutator }
enum SettingsFieldType { text, gcb, goose, mac, app, vlan, minTime, maxTime }

class DeviceModel {
  DeviceType type;
  int width;
  int height;
  String name;
  String previewImage;
  int slotsCount;
  List<List<dynamic>> settings;
  Widget Function(DroppedDeviceModel) widgetBuilder;
}
