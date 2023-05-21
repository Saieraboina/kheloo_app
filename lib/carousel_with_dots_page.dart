import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselWithStepIndicator extends StatefulWidget {
  final List<String>? imgList;
   const CarouselWithStepIndicator({Key? key, this.imgList}) : super(key: key);

  @override
  State<CarouselWithStepIndicator> createState() => _CarouselWithStepIndicatorState();
}

class _CarouselWithStepIndicatorState extends State<CarouselWithStepIndicator> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = widget.imgList!
        .map((item) => Stack(
        children: [
          Image.network(
            item,
            fit: BoxFit.cover,
            width: 1000,
            height: 400,
          ),
      ],
    ))
        .toList();
    return  Column(
      children: [
        CarouselSlider(
          items: imageSliders,
          options: CarouselOptions(
            autoPlay: true,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.imgList!.map((url) {
            int index = widget.imgList!.indexOf(url);
            return Container(
              width: 40,
              height: 3,
              margin: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 3,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: _current == index
                    ? Colors.amber
                    : Colors.grey,
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}


