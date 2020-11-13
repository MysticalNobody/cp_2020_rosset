import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/modules/tests/controllers/tests_controller.dart';
import 'package:rosset_client/app/modules/tests/widgets/option.dart';
import 'package:rosset_client/theme/app_colors.dart';
import 'package:rosset_client/theme/app_text_styles.dart';
import 'package:rosset_client/utils/unfocus_ext.dart';

class TestsView extends GetView<TestsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Анатолич',
                    style: AppTextStyles.subtitle.copyWith(
                      color: AppColors.secondary,
                    ),
                  ),
                  Text(
                    'Тест на проверку освоенного материала',
                    style: AppTextStyles.subtitle.copyWith(
                      color: AppColors.secondary,
                    ),
                  ),
                  RaisedButton(
                    child: Text('Закончить тест'),
                    onPressed: controller.exitTest,
                  ),
                ],
              ),
              SizedBox(height: Get.height * .2),
              Column(
                children: [
                  Text(
                    'Вопрос 1 блаопопшоук пзо укзсщка',
                    style: AppTextStyles.headLine3,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Вопрос 1 из 20',
                    style: AppTextStyles.secondary,
                  ),
                  SizedBox(height: 30),
                  OptionButton(
                    onTap: () {},
                    text: 'Lorem Ipsum Dolores',
                    type: OptionType.normal,
                  ),
                  OptionButton(
                    onTap: () {},
                    text: 'Lorem Ipsum Dolores',
                    type: OptionType.error,
                  ),
                  OptionButton(
                    onTap: () {},
                    text: 'Lorem Ipsum Dolores',
                    type: OptionType.right,
                  ),
                  OptionButton(
                    onTap: () {},
                    text: 'Lorem Ipsum Dolores',
                    type: OptionType.normal,
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(bottom: Get.height * .1),
            alignment: Alignment.bottomCenter,
            child: RaisedButton(
              child: Text('Следующий вопрос'),
              onPressed: controller.exitTest,
            ),
          ),
        ],
      ),
    ).unfocusOnTap();
  }
}
