import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/modules/home/controllers/home_controller.dart';
import 'package:rosset_client/app/modules/home/widgets/animated_icon.dart';
import 'package:rosset_client/app/modules/home/widgets/device_panel.dart';
import 'package:rosset_client/app/modules/home/widgets/info_dialog.dart';
import 'package:rosset_client/app/modules/workspace/views/workspace_view.dart';
import 'package:rosset_client/app/routes/app_pages.dart';
import 'package:rosset_client/theme/app_colors.dart';
import 'package:rosset_client/utils/unfocus_ext.dart';
import 'package:supercharged_dart/supercharged_dart.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // clear instructions
      // FeatureDiscovery.clearPreferences(context, <String>{
      //   'workflow',
      //   'device',
      // });

      FeatureDiscovery.discoverFeatures(
        context,
        const <String>{
          'workflow',
          'device',
        },
      );
    });
    return Scaffold(
      backgroundColor: AppColors.background,
      body: GetBuilder<HomeController>(
        // init: HomeController(),
        builder: (controller) => SafeArea(
          child: Stack(
            children: [
              Row(
                children: [
                  DevicePanel(
                    onSearchChange: controller.search,
                    devices: controller.models,
                  ),
                  Expanded(child: WorkspaceView()),
                ],
              ),
              Positioned(
                top: 300,
                left: 12,
                child: DescribedFeatureOverlay(
                  title: Text('Выбор инструмента'),
                  description: Text(
                      'Для выбора инструмента,\nперетащите его из списка\nна рабочую область'),
                  backgroundColor: AppColors.secondary,
                  enablePulsingAnimation: false,
                  featureId: 'device',
                  tapTarget: IgnorePointer(child: Icon(Icons.done)),
                  child: SizedBox(
                    width: 500,
                  ),
                ),
              ),
              Positioned(
                top: 300,
                left: 12,
                child: DescribedFeatureOverlay(
                  title: Text('Выбор инструмента'),
                  description: Text(
                      'Для выбора инструмента,\nперетащите его из списка\nна рабочую область'),
                  backgroundColor: AppColors.secondary,
                  enablePulsingAnimation: false,
                  featureId: 'device',
                  tapTarget: IgnorePointer(child: Icon(Icons.done)),
                  child: SizedBox(
                    width: 500,
                  ),
                ),
              ),
              Positioned(
                top: 300,
                right: 0,
                child: DescribedFeatureOverlay(
                  title: Text('Рабочая область'),
                  description: Text(
                      'Рабочая область представляет собой сетку,\nгде можно размещать инструменты и взаимодействовать с ними'),
                  backgroundColor: AppColors.secondary,
                  enablePulsingAnimation: false,
                  featureId: 'workflow',
                  contentLocation: ContentLocation.above,
                  tapTarget: IgnorePointer(child: Icon(Icons.done)),
                  child: SizedBox(
                    width: Get.width,
                    height: Get.height / 2,
                  ),
                ),
              ),
              Positioned(
                top: 24,
                left: 24,
                child: Obx(
                  () => AnimatedContainer(
                    width: controller.showInstruments.value ? 36 : 64,
                    height: controller.showInstruments.value ? 36 : 64,
                    duration: 300.milliseconds,
                    child: FloatingActionButton(
                      elevation: 3,
                      heroTag: 'open_close_menu',
                      backgroundColor: AppColors.white,
                      onPressed: controller.toggleInstruments,
                      child: AnimatedUpDownicon(),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 24,
                right: 24,
                child: Obx(
                  () => AnimatedOpacity(
                    opacity: controller.showInstruments.value && Get.width < 600
                        ? 0
                        : 1,
                    duration: 300.milliseconds,
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.bottomCenter,
                          margin: EdgeInsets.only(right: 12),
                          child: RaisedButton.icon(
                            color: AppColors.secondary,
                            icon: Icon(EvaIcons.questionMarkCircle),
                            label: Text(
                              'Инструкция',
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            onPressed: () => Get.toNamed(Routes.TESTS),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          margin: EdgeInsets.only(right: 12),
                          child: RaisedButton.icon(
                            color: AppColors.secondary,
                            icon: Icon(EvaIcons.info),
                            label: Text(
                              'Информация о задании',
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            onPressed: () => Get.dialog(InfoDialog()),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          child: RaisedButton.icon(
                            color: AppColors.secondary,
                            icon: Icon(EvaIcons.doneAll),
                            label: Text(
                              'Проверить',
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            onPressed: () => Get.toNamed(Routes.TESTS),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 24,
                right: 24,
                child: Obx(
                  () => AnimatedOpacity(
                    opacity:
                        controller.showSimpleModeButton.value && Get.width < 600
                            ? 0
                            : 1,
                    duration: 300.milliseconds,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: RaisedButton.icon(
                        color: AppColors.secondary,
                        icon: Icon(controller.isSimpleMode.value
                            ? EvaIcons.eye
                            : EvaIcons.eyeOff),
                        label: Text(
                          controller.isSimpleMode.value
                              ? 'Включить подробный вид'
                              : 'Выключить подробный вид',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 14,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        onPressed: controller.toggleSimpleMode,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ).unfocusOnTap();
  }
}
