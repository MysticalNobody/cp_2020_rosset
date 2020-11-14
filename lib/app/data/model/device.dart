import 'package:flutter/material.dart';

import 'dropped_device.dart';

class DeviceModel {
  int width;
  int height;
  String name;
  int slotsCount;
  Map<String, String> settings;
  Widget Function(DroppedDeviceModel) widgetBuilder;
}
