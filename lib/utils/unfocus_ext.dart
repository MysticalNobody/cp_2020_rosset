import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension UnfocusOnTap on Widget {
  Widget unfocusOnTap() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Get.focusScope.unfocus(),
      child: this,
    );
  }
}
