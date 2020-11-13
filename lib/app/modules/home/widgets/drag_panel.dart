import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DragExapmple extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: InteractiveViewer(
            minScale: 1,
            maxScale: 8,
            constrained: false,
            child: SizedBox(
              height: Get.height / 2,
              width: Get.width / 2,
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 12.5,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                ),
                itemCount: 20,
                itemBuilder: (c, i) {
                  return DragTarget<String>(
                    builder: (context, list, list2) {
                      return Container(
                        height: 200,
                        width: 200,
                        color: Colors.blueGrey,
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
