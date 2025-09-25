import 'package:flutter/material.dart';
import 'package:interactive_physics_widget/widgets/ball_shape.dart';

class DraggbleBall extends StatefulWidget {
  final Color color;
  final bool matched;
  const DraggbleBall({super.key, required this.color, required this.matched});

  @override
  State<DraggbleBall> createState() => _DraggbleBallState();
}

class _DraggbleBallState extends State<DraggbleBall> {
  Color? currentlyDragging;
  @override
  Widget build(BuildContext context) {
    return Draggable<Color>(
      data: widget.color,
      onDragStarted: () {
        setState(() => currentlyDragging = widget.color);
      },
      onDraggableCanceled: (_, __) {
        setState(() => currentlyDragging = null);
      },
      onDragCompleted: () {
        setState(() => currentlyDragging = null);
      },
      feedback: BallShape(color: widget.color, size: 40),
      childWhenDragging: Opacity(
        opacity: 0.3,
        child: BallShape(color: widget.color, size: 40),
      ),
      child: widget.matched
          ? const SizedBox(width: 40)
          : BallShape(color: widget.color, size: 40),
    );
  }
}
