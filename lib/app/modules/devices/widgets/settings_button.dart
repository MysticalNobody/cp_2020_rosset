import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/data/model/dropped_device.dart';
import 'package:rosset_client/app/modules/settings/views/settings_view.dart';
import 'package:rosset_client/theme/app_colors.dart';
import 'package:rosset_client/theme/app_text_styles.dart';

class SettingsButton extends StatefulWidget {
  const SettingsButton({Key key, this.dm}) : super(key: key);
  final DroppedDeviceModel dm;

  @override
  _SettingsButtonState createState() => _SettingsButtonState();
}

class _SettingsButtonState extends State<SettingsButton> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1800),
    );
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.linearToEaseOut,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: Material(
        color: AppColors.white,
        child: InkWell(
          onTap: () => Get.dialog(SettingsView(widget.dm)),
          onHover: (hover) {
            if (hover) {
              controller.animateTo(.1);
            } else {
              controller.animateTo(0);
            }
          },
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(99),
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: RotationTransition(
                    turns: animation,
                    child: Icon(
                      EvaIcons.settings2,
                      color: AppColors.secondary,
                      size: 24,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    'Настройки',
                    style: AppTextStyles.button.copyWith(color: AppColors.secondary),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
