import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/modules/home/controllers/home_controller.dart';
import 'package:rosset_client/app/modules/home/widgets/animated_icon.dart';
import 'package:rosset_client/app/modules/workspace/views/workspace_view.dart';
import 'package:rosset_client/app/modules/workspace/widgets/device_draggable.dart';
import 'package:rosset_client/app/routes/app_pages.dart';
import 'package:rosset_client/theme/app_colors.dart';
import 'package:rosset_client/utils/unfocus_ext.dart';
import 'package:supercharged_dart/supercharged_dart.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        body: Stack(
          children: [
            Positioned.fill(child: WorkspaceView()),
            Align(
              alignment: Alignment.topLeft,
              child: Obx(
                () => AnimatedContainer(
                  width: 300,
                  height: controller.showInstruments.value ? Get.height - 24 : 56,
                  margin: EdgeInsets.all(12),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.white,
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
                      InkWell(
                        child: Text('Экран тестов'),
                        onTap: () => Get.toNamed(Routes.TESTS),
                      ),
                      AnimatedOpacity(
                        opacity: controller.showInstruments.value ? 1 : 0,
                        duration: 300.milliseconds,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(EvaIcons.search),
                              hintText: 'Поиск',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(9),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            SizedBox(height: 24),
                            ...controller.models.map((m) => DeviceDraggable(m)).toList(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        )).unfocusOnTap();
  }
}
