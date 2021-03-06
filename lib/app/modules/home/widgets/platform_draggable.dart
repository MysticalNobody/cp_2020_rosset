import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformDraggable<T> extends StatelessWidget {
  PlatformDraggable({
    this.data,
    this.feedback,
    this.child,
    this.onDraggableCanceled,
    this.onDraggableStart,
    this.onDragEnd,
  });
  final T data;
  final Widget feedback;
  final Widget child;
  final DraggableCanceledCallback onDraggableCanceled;
  final VoidCallback onDraggableStart;
  final Function(DraggableDetails) onDragEnd;
  @override
  Widget build(BuildContext context) {
    if (kIsWeb)
      return Draggable<T>(
        data: data,
        feedback: feedback,
        maxSimultaneousDrags: 1,
        dragAnchor: DragAnchor.pointer,
        onDraggableCanceled: onDraggableCanceled,
        onDragStarted: onDraggableStart,
        onDragEnd: onDragEnd,
        child: child,
      );
    else
      return LongPressDraggable<T>(
        data: data,
        feedback: feedback,
        maxSimultaneousDrags: 1,
        hapticFeedbackOnStart: true,
        dragAnchor: DragAnchor.pointer,
        onDraggableCanceled: onDraggableCanceled,
        onDragStarted: onDraggableStart,
        child: child,
      );
  }
}
