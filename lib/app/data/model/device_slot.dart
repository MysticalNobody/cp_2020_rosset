import 'package:flutter/widgets.dart';
import 'package:rosset_client/app/data/model/device_link.dart';
import 'package:rosset_client/app/data/model/dropped_device.dart';

class DeviceSlotModel {
  DroppedDeviceModel device;
  int slotId;
  DeviceLinkModel link;
  GlobalKey key;
}
