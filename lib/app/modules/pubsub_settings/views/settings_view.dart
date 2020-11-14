import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/data/model/dropped_device.dart';
import 'package:rosset_client/app/modules/pubsub_settings/controllers/settings_controller.dart';
import 'package:rosset_client/theme/app_colors.dart';
import 'package:rosset_client/utils/unfocus_ext.dart';

class PubSubSettingsView extends StatelessWidget {
  PubSubSettingsView() : controller = PubSubSettingsController();
  final PubSubSettingsController controller;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PubSubSettingsController>(
      init: controller,
      builder: (controller) => SizedBox(
        width: Get.width > 600 ? 600 : Get.width * .9,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Подписки GOOSE-сообщений'),
            backgroundColor: AppColors.secondary,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      color: AppColors.secondary,
                      onPressed: controller.save,
                      child: Text('Сохранить'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ).unfocusOnTap(),
    );
  }
}
