import 'dart:async';

import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key, }) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  ValueNotifier<int> number = ValueNotifier(8000000);

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      number.value++;
      if (number.value == 9999999) {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Box(child: "₹"),
        // seventhPlace
        ValueListenableBuilder(
          valueListenable: number,
          builder: (context, value, child) {
            return Box(
              child: value.toString()[0],
            );
          },
        ),

        // sixthPlace
        ValueListenableBuilder(
          valueListenable: number,
          builder: (context, value, child) {
            return Box(
              child: value.toString()[1],
            );
          },
        ),

        // fifthPlace
        ValueListenableBuilder(
          valueListenable: number,
          builder: (context, value, child) {
            return Box(
              child: value.toString()[2],
            );
          },
        ),

        // fourthPlace
        ValueListenableBuilder(
          valueListenable: number,
          builder: (context, value, child) {
            return Box(
              child: value.toString()[3],
            );
          },
        ),

        // thirdPlace
        ValueListenableBuilder(
          valueListenable: number,
          builder: (context, value, child) {
            return Box(
              child: value.toString()[4],
            );
          },
        ),

        // secondPlace
        ValueListenableBuilder(
          valueListenable: number,
          builder: (context, value, child) {
            return Box(
              child: value.toString()[5],
            );
          },
        ),

        // firstPlace value
        ValueListenableBuilder(
          valueListenable: number,
          builder: (context, value, child) {
            return Box(
              child: value.toString()[6],
            );
          },
        ),
      ],
    );
  }
}

class Box extends StatelessWidget {
  final String child;
  const Box({Key? key,

    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.amber,
          border: Border.all(
            color: Colors.amber,
            width: 4,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 20,
        ),
        child: Text(
          child,
          style: const TextStyle(
              color: Colors.red, fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
    );
  }
}
