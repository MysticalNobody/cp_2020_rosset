import 'package:flutter/material.dart';
import 'package:rosset_client/app/data/model/device_link.dart';
import 'package:rosset_client/app/data/model/dropped_device.dart';
import 'package:rosset_client/app/modules/workspace/widgets/device_slot.dart';

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
              for (int i = 0; i < 6; i++) DeviceSlot(slot: dm.slots[i]),
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
