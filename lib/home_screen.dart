import 'package:flutter/material.dart';
import 'package:interactive_physics_widget/widgets/draggble_ball.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static final Map<Color, bool> matched = {
    Colors.red: false,
    Colors.blue: false,
    Colors.green: false,
  };
  Color? currentlyDragging;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Interactive Physics Playground"),
        leading: const Icon(Icons.arrow_back_ios),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DraggbleBall(color: Colors.red, matched: matched[Colors.red]!),
              DraggbleBall(color: Colors.blue, matched: matched[Colors.blue]!),
              DraggbleBall(
                color: Colors.green,
                matched: matched[Colors.green]!,
              ),
            ],
          ),
          const SizedBox(height: 300),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTarget(Colors.red),
              _buildTarget(Colors.blue),
              _buildTarget(Colors.green),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTarget(Color color) {
    return DragTarget<Color>(
      onWillAcceptWithDetails: (details) => details.data == color,
      onAcceptWithDetails: (details) {
        setState(() {
          matched[color] = true;
        });
      },
      builder: (context, candidateData, rejectedData) {
        bool isMatched = matched[color]!;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.all(12),
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: isMatched
                ? color
                : color.withValues(alpha: candidateData.isNotEmpty ? 0.4 : 0.2),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: color, width: 2),
          ),
          child: isMatched
              ? const Icon(Icons.check, color: Colors.white)
              : null,
        );
      },
    );
  }
}
