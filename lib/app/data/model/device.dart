import 'package:flutter/material.dart';

import 'dropped_device.dart';

class DeviceModel {
  int width;
  int height;
  String name;
  int slotsCount;
  Widget Function(DroppedDeviceModel) widgetBuilder;
}
