import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformDraggable<T> extends StatelessWidget {
  PlatformDraggable({
    this.data,
    this.feedback,
    this.child,
  });
  final T data;
  final Widget feedback;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    if (kIsWeb)
      return Draggable<T>(
        data: data,
        feedback: feedback,
        maxSimultaneousDrags: 1,
        child: child,
      );
    else
      return LongPressDraggable<T>(
        data: data,
        feedback: feedback,
        maxSimultaneousDrags: 1,
        hapticFeedbackOnStart: true,
        child: child,
      );
  }
}
