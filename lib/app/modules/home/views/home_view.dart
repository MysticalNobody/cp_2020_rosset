import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/modules/home/controllers/home_controller.dart';
import 'package:rosset_client/app/modules/home/widgets/animated_icon.dart';
import 'package:rosset_client/app/modules/home/widgets/drag_panel.dart';
import 'package:rosset_client/app/modules/home/widgets/instrument_card.dart';
import 'package:rosset_client/theme/app_colors.dart';
import 'package:supercharged_dart/supercharged_dart.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.fillColor,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: DragExapmple(),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Obx(
                () => AnimatedContainer(
                  width: 300,
                  height:
                      controller.showInstruments.value ? Get.height - 24 : 56,
                  margin: EdgeInsets.all(12),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.generalWhite,
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.grey.withOpacity(.15),
                          blurRadius: 6,
                          spreadRadius: 1),
                    ],
                    borderRadius: BorderRadius.circular(6),
                  ),
                  duration: 300.milliseconds,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextButton.icon(
                        icon: AnimatedUpDownicon(),
                        onPressed: controller.toggleInstruments,
                        label: Text('Выбор устройств'),
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            SizedBox(height: 24),
                            InstrumentCard(),
                            InstrumentCard(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
