import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/data/model/device.dart';
import 'package:rosset_client/app/data/model/draggable_device.dart';
import 'package:rosset_client/app/modules/home/controllers/home_controller.dart';
import 'package:rosset_client/app/modules/home/widgets/platform_draggable.dart';
import 'package:rosset_client/theme/app_colors.dart';
import 'package:rosset_client/theme/app_text_styles.dart';

class InstrumentCard extends StatefulWidget {
  const InstrumentCard({Key key, this.model}) : super(key: key);
  final DeviceModel model;

  @override
  _InstrumentCardState createState() => _InstrumentCardState();
}

class _InstrumentCardState extends State<InstrumentCard> {
  var mouseCursor = SystemMouseCursors.grab;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        Widget child = Material(
          color: AppColors.white,
          child: InkWell(
            mouseCursor: mouseCursor,
            onTap: () {},
            child: Container(
              width: 350,
              padding: const EdgeInsets.only(
                left: 15,
                right: 18,
                top: 17,
                bottom: 17,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        Image.asset(
                          widget.model.previewImage,
                          width: 60,
                          fit: BoxFit.fitWidth,
                        ),
                        SizedBox(width: 12),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.model.name,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.secondary,
                                ),
                              ),
                              Text(
                                widget.model.shortInfo,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                  ),
                  Image.asset(
                    'assets/icons/menu-dots.png',
                    width: 24,
                    height: 24,
                  ),
                ],
              ),
            ),
          ),
        );

        return MouseRegion(
          cursor: mouseCursor,
          child: PlatformDraggable<DraggableDevice>(
            data: DraggableDevice()..model = widget.model,
            onDraggableStart: () {
              Get.width > 740 ? () {} : Get.find<HomeController>().toggleInstruments();
              mouseCursor = SystemMouseCursors.grabbing;
              Get.find<HomeController>().cursor.value = SystemMouseCursors.grabbing;
              setState(() {});
            },
            onDraggableCanceled: (v, o) {
              mouseCursor = SystemMouseCursors.grab;
              Get.find<HomeController>().cursor.value = SystemMouseCursors.basic;
              setState(() {});
            },
            onDragEnd: (_) {
              mouseCursor = SystemMouseCursors.grab;
              Get.find<HomeController>().cursor.value = SystemMouseCursors.basic;
              setState(() {});
            },
            feedback: Container(
              width: constraints.maxWidth,
              height: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Material(
                  color: AppColors.secondary.withOpacity(0.2),
                  child: Center(
                    child: Text(
                      widget.model.name,
                      style: AppTextStyles.mediumLabel.copyWith(
                        color: AppColors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            child: child,
          ),
        );
      },
    );
  }
}
