import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rosset_client/app/modules/home/controllers/home_controller.dart';
import 'package:supercharged/supercharged.dart';

class AnimatedUpDownicon extends StatefulWidget {
  @override
  _AnimatedUpDowniconState createState() => _AnimatedUpDowniconState();
}

class _AnimatedUpDowniconState extends State<AnimatedUpDownicon>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(duration: 300.milliseconds, vsync: this);
    Get.find<HomeController>().showInstruments.listen((_) {
      if (_) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 0.0, end: .5).animate(_controller),
      child: Icon(EvaIcons.arrowIosUpward),
    );
  }
}
