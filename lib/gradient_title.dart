import 'package:flutter/material.dart';

class GradientTitle extends StatelessWidget {
  final String title;

  const GradientTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return const LinearGradient(
          colors: [Colors.amber, Colors.white],
          begin: Alignment.topCenter, // Gradient starts at the top center
          end: Alignment.bottomCenter, // Gradient ends at the bottom center
        ).createShader(bounds);
      },
      child: Text(
        title,
        style: const TextStyle(
          fontFamily: "OswaldVariableFont",
          fontSize: 30,
          fontWeight: FontWeight.w300,
          color: Colors.white
        ),
      ),
    );
  }
}