import 'device_slot.dart';

class DeviceLinkModel {
  DeviceSlotModel start;
  DeviceSlotModel end;

  bool operator ==(o) =>
      o is DeviceLinkModel &&
          (start.device.id == o.end.device.id &&
              end.device.id == o.start.device.id &&
              start.slotId == o.end.slotId &&
              end.slotId == o.start.slotId) ||
      (start.device.id == o.start.device.id &&
          end.device.id == o.end.device.id &&
          start.slotId == o.start.slotId &&
          end.slotId == o.end.slotId);
  int get hashCode => start.hashCode + end.hashCode;
}
