import 'package:flutter/material.dart';
import 'package:rosset_client/theme/app_colors.dart';

enum CardResultType { good, normal, warning, bad }

class ResultCard extends StatelessWidget {
  const ResultCard({
    Key key,
    @required this.title,
    @required this.text,
    this.type = CardResultType.normal,
  }) : super(key: key);
  final CardResultType type;
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    Color bgColor = AppColors.white;
    Color titleColor = AppColors.text;
    Color textColor = Color(0xFF0D964D);
    if (type == CardResultType.good) {
      bgColor = Color(0xFF0D964D);
      titleColor = AppColors.white;
      textColor = AppColors.white;
    }
    if (type == CardResultType.bad) {
      bgColor = Color(0xFFE1723A);
      titleColor = AppColors.white;
      textColor = AppColors.white;
    }
    if (type == CardResultType.warning) {
      textColor = Color(0xFFf6A421);
    }
    return Card(
      color: bgColor,
      elevation: 2,
      margin: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        constraints: BoxConstraints(minWidth: 180),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: titleColor,
                fontSize: 14,
              ),
            ),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 30,
                height: 1.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
