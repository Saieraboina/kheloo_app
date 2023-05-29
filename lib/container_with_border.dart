import 'package:flutter/material.dart';

class ContainerWithBorder extends StatelessWidget {
  final Widget child;

  final double height;

   const ContainerWithBorder({
    Key? key,
     required this.child,
     required this.height

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Colors.amber,
              Colors.white,
              Colors.black,
              Colors.amber,
            ],
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        height: height,
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(15),
            ),
            child:  Center(
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
