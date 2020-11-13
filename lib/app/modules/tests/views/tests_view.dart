import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/modules/tests/controllers/tests_controller.dart';
import 'package:rosset_client/theme/app_colors.dart';
import 'package:rosset_client/utils/unfocus_ext.dart';

class TestsView extends GetView<TestsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [],
      ),
    ).unfocusOnTap();
  }
}
