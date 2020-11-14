import 'package:flutter/material.dart';
import 'package:rosset_client/app/data/model/device.dart';

import 'device_slot.dart';

class DroppedDeviceModel {
  int id;
  DeviceModel model;
  int x;
  int y;
  Widget widget;
  List<DeviceSlotModel> slots;
}
