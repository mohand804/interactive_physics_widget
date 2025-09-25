import 'package:flutter/material.dart';
import 'package:interactive_physics_widget/home_screen.dart';

void main() {
  runApp(InteractivePhysicsWidget());
}

class InteractivePhysicsWidget extends StatelessWidget {
  const InteractivePhysicsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeView());
  }
}
