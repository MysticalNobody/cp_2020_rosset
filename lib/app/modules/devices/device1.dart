import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/data/model/dropped_device.dart';
import 'package:rosset_client/app/modules/settings/views/settings_view.dart';
import 'package:rosset_client/app/modules/home/controllers/home_controller.dart';
import 'package:rosset_client/app/modules/workspace/controllers/workspace_controller.dart';
import 'package:rosset_client/app/modules/workspace/widgets/device_slot.dart';
import 'package:rosset_client/theme/app_colors.dart';

//2x2
class Device1 extends StatelessWidget {
  Device1(this.dm);
  final DroppedDeviceModel dm;
  RxBool get isSimple => Get.find<HomeController>().isSimpleMode;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Card(
        elevation: 1,
        child: Stack(
          children: [
            Obx(
              () => AnimatedCrossFade(
                crossFadeState: isSimple.value ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                duration: 100.milliseconds,
                firstChild: Row(children: []),
                secondChild: Row(
                  children: [
                    Expanded(
                      child: Image.asset(
                        'assets/images/left.png',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Expanded(
                      child: Image.asset(
                        'assets/images/front.png',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                color: Colors.white,
                child: Row(
                  children: [
                    SizedBox(width: 12),
                    Tooltip(
                      message:
                          'Терминал релейной защиты\n\nЕго настройка занимает в 3 раза \nменьше времени, чем обычного.\n\nУстранение неполадок не требует \nприсутствия человека и решается \nво многих случаях дистанционно',
                      child: Icon(
                        EvaIcons.questionMarkCircle,
                        color: Colors.black26,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(666),
                      child: Material(
                        color: Colors.transparent,
                        child: IconButton(
                          onPressed: Get.find<HomeController>().viewModel,
                          color: AppColors.secondary,
                          icon: Icon(Icons.preview),
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(dm.model.name),
                    Spacer(),
                    TextButton.icon(
                      icon: Icon(
                        EvaIcons.settings,
                        color: AppColors.secondary,
                      ),
                      label: Text(
                        'Настройка',
                        style: TextStyle(
                          color: AppColors.secondary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () => Get.dialog(
                        Dialog(child: SettingsView(dm)),
                      ),
                    ),
                    IconButton(
                      icon: Icon(EvaIcons.closeSquare),
                      color: Colors.redAccent,
                      onPressed: () => Get.find<WorkspaceController>().deleteDevice(dm),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Spacer(flex: 3),
                Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Spacer(flex: 5),
                      Expanded(
                        child: Row(
                          children: [
                            DeviceSlot(slot: dm.slots[0], size: 25),
                            Obx(
                              () => !isSimple.value
                                  ? SizedBox()
                                  : Padding(
                                      padding: const EdgeInsets.only(left: 12.0),
                                      child: Text('Порт 71'),
                                    ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            DeviceSlot(slot: dm.slots[1], size: 25),
                            Obx(
                              () => !isSimple.value
                                  ? SizedBox()
                                  : Padding(
                                      padding: const EdgeInsets.only(left: 12.0),
                                      child: Text('Порт 72'),
                                    ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(flex: 1),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
