import 'package:flutter/material.dart';
import 'package:rosset_client/app/data/model/device_link.dart';
import 'package:rosset_client/app/data/model/dropped_device.dart';

class LinksPainter extends CustomPainter {
  LinksPainter({
    this.baseKey,
    this.devices,
  });
  final GlobalKey baseKey;
  final List<DroppedDeviceModel> devices;
  @override
  void paint(Canvas canvas, Size size) {
    final links = <DeviceLinkModel>{};
    for (final device in devices) {
      for (final slot in device.slots) {
        if (slot.link == null) continue;
        links.add(slot.link);
      }
    }
    final baseOff = (baseKey.currentContext.findRenderObject() as RenderBox)
        .localToGlobal(Offset.zero);
    for (final link in links) {
      final off1 =
          (link.start.key.currentContext.findRenderObject() as RenderBox)
              .localToGlobal(Offset.zero);
      final off2 = (link.end.key.currentContext.findRenderObject() as RenderBox)
          .localToGlobal(Offset.zero);
      canvas.drawLine(
          off1 - baseOff, off2 - baseOff, Paint()..strokeWidth = 1.5);
    }
  }

  @override
  bool shouldRepaint(LinksPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(LinksPainter oldDelegate) => false;
}
