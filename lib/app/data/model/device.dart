import 'package:flutter/material.dart';

import 'dropped_device.dart';

enum SettingsFieldType { text, gcb, goose, mac, app, vlan, minTime, maxTime }

class DeviceModel {
  int width;
  int height;
  String name;
  int slotsCount;
  List<List<dynamic>> settings;
  Widget Function(DroppedDeviceModel) widgetBuilder;
}
