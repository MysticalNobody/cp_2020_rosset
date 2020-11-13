import 'package:flutter/material.dart';
import 'package:rosset_client/app/data/model/device_link.dart';
import 'package:rosset_client/app/data/model/dropped_device.dart';

//4x2
class Device2 extends StatelessWidget {
  Device2(this.dm);
  final DroppedDeviceModel dm;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (int i = 0; i < 6; i++)
                DragTarget<DeviceLinkModel>(
                  builder: (context, list, list2) {
                    return Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.5, color: Colors.grey),
                      ),
                      child: LongPressDraggable<DeviceLinkModel>(
                        data: DeviceLinkModel(),
                        feedback: Container(
                          width: 50,
                          height: 50,
                          color: Colors.red.withOpacity(0.3),
                        ),
                        maxSimultaneousDrags: 1,
                        hapticFeedbackOnStart: true,
                        child: Container(
                          width: 50,
                          height: 50,
                          color: Colors.grey.withOpacity(0.3),
                        ),
                        dragAnchor: DragAnchor.pointer,
                      ),
                    );
                  },
                  onWillAccept: (data) {
                    debugPrint(data.toString());
                    return true;
                  },
                ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Прибор 4 x 2'),
              MaterialButton(
                child: Text('Какая то кнопка'),
                onPressed: () {},
                color: Colors.red,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
