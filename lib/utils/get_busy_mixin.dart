import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/theme/app_colors.dart';

mixin GetBusyMixin on GetxController {
  final _isBusy = false.obs;
  bool get isBusy => _isBusy.value;

  void setBusy(bool value) => _isBusy.value = value;
}

extension BusyStack on Widget {
  Widget withBusyStack(GetBusyMixin controller) {
    return Stack(
      children: [
        this,
        Positioned.fill(
          child: Obx(
            () => IgnorePointer(
              ignoring: !controller._isBusy.value,
              child: AnimatedOpacity(
                opacity: controller._isBusy.value ? 1 : 0,
                duration: 200.milliseconds,
                child: Container(
                  color: AppColors.grey.withOpacity(.5),
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(AppColors.general),
                    strokeWidth: 1,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
