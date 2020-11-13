import 'package:jiffy/jiffy.dart';

DateTime convertDateFromJson(String date) => Jiffy(date)?.dateTime;

String convertDateToJson(DateTime date) => date?.toIso8601String();
