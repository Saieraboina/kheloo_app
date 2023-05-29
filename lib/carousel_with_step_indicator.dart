import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kheloo_app/videoplayer.dart';

class CarouselWithStepIndicator extends StatefulWidget {
  final List<String>? imgList;
  const CarouselWithStepIndicator({Key? key, this.imgList}) : super(key: key);

  @override
  State<CarouselWithStepIndicator> createState() =>
      _CarouselWithStepIndicatorState();
}

class _CarouselWithStepIndicatorState extends State<CarouselWithStepIndicator> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = widget.imgList!
        .map((item) => Image.network(
              item,
              fit: BoxFit.cover,
              width: 1000,
              height: 400,
            ))
        .toList();
    return Column(
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
                color: _current == index ? Colors.amber : Colors.grey,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}

class CarouselVideosWithStepIndicator extends StatefulWidget {
  const CarouselVideosWithStepIndicator({Key? key,  required this.videoPaths}) : super(key: key);
  final List<String> videoPaths;

  @override
  State<CarouselVideosWithStepIndicator> createState() =>
      _CarouselVideosWithStepIndicatorState();
}

class _CarouselVideosWithStepIndicatorState
    extends State<CarouselVideosWithStepIndicator> {
  int _currentIndex = 0;
  bool isFirstVideo = true;

  @override
  Widget build(BuildContext context) {
    final List<Widget> videos = widget.videoPaths
        .map((videoPath) => SizedBox(
              width: double.infinity,
              child: PlayVideo(type: VideoType.fromAsset, path: videoPath),
            ))
        .toList();
    return Column(
      children: [
        CarouselSlider(
          items: videos,
          options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                  isFirstVideo = !isFirstVideo;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.videoPaths.map((url) {
            int index = widget.videoPaths.indexOf(url);
            return Container(
              width: 40,
              height: 3,
              margin: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 3,
              ),
              decoration: BoxDecoration(
                color: _currentIndex == index ? Colors.amber : Colors.grey,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
