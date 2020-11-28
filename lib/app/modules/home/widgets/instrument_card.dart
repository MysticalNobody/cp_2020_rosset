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
        Widget child = Container(
          width: 350,
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 17,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Row(
                  children: [
                    Image.asset(
                      model.previewImage,
                      width: 60,
                      fit: BoxFit.fitWidth,
                    ),
                    SizedBox(width: 12),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            model.name,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppColors.secondary,
                            ),
                          ),
                          Text(
                            model.shortInfo,
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 12),
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
        );

        return PlatformDraggable<DraggableDevice>(
          data: DraggableDevice()..model = model,
          onDraggableStart: () => Get.width > 740 ? () {} : Get.find<HomeController>().toggleInstruments(),
          feedback: Container(
            width: constraints.maxWidth,
            height: 80,
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
