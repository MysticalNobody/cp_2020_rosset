import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/data/model/device.dart';
import 'package:rosset_client/app/data/model/draggable_device.dart';
import 'package:rosset_client/app/modules/home/controllers/home_controller.dart';
import 'package:rosset_client/app/modules/home/widgets/platform_draggable.dart';
import 'package:rosset_client/theme/app_colors.dart';
import 'package:rosset_client/theme/app_text_styles.dart';

class InstrumentCard extends StatelessWidget {
  const InstrumentCard({Key key, this.model}) : super(key: key);
  final DeviceModel model;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var child = Column(
          children: [
            Card(
              color: AppColors.white,
              elevation: 4,
              child: TextButton(
                onPressed: () {},
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset(
                        model.previewImage,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 12),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              model.name,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Color(0xFF495585).withOpacity(0.8),
              ),
            ),
            SizedBox(height: 24),
          ],
        );
        return PlatformDraggable<DraggableDevice>(
          data: DraggableDevice()..model = model,
          onDraggableStart: () => Get.width > 600 ? () {} : Get.find<HomeController>().showInstruments.value = false,
          feedback: Container(
            width: constraints.maxWidth,
            height: 125,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Material(
                color: AppColors.secondary.withOpacity(0.2),
                child: Center(
                  child: Text(
                    model.name,
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
        );
      },
    );
  }
}
