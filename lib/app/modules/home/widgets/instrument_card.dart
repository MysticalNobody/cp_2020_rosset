import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rosset_client/app/data/model/device.dart';
import 'package:rosset_client/app/data/model/draggable_device.dart';
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
                      Image.network(
                        'https://relematika.ru/upload/resize_cache/iblock/b3f/282_200_1/%D0%A2%D0%9E%D0%A0200_03_sm.jpg',
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
