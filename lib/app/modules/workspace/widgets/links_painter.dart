import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/data/model/device_link.dart';
import 'package:rosset_client/app/data/model/dropped_device.dart';

class LinksPainter extends CustomPainter {
  LinksPainter({
    this.devices,
    this.shouldUpdate,
  });
  final List<DroppedDeviceModel> devices;
  final bool shouldUpdate;
  @override
  void paint(Canvas canvas, Size size) {
    final links = <DeviceLinkModel>{};
    for (final device in devices) {
      for (final slot in device.slots) {
        if (slot.link == null) continue;
        links.add(slot.link);
      }
    }
    final safeOffset = Get.mediaQuery.padding.topLeft;
    for (final link in links) {
      final off1 =
          (link.start.key.currentContext.findRenderObject() as RenderBox)
              .localToGlobal(Offset.zero);
      final off2 = (link.end.key.currentContext.findRenderObject() as RenderBox)
          .localToGlobal(Offset.zero);
      canvas.drawLine(off1 - safeOffset, off2 - safeOffset, Paint());
    }
  }

  @override
  bool shouldRepaint(LinksPainter oldDelegate) =>
      oldDelegate.shouldUpdate != shouldUpdate;

  @override
  bool shouldRebuildSemantics(LinksPainter oldDelegate) => false;
}
