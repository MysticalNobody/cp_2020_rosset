import 'package:flutter/material.dart';

import 'dropped_device.dart';

class DeviceModel {
  int width;
  int height;
  String name;
  Widget Function(DroppedDeviceModel) widgetBuilder;
}
