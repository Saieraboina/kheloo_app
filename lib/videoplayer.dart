import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayVideo extends StatefulWidget {
  final VideoType type;
  final String path;
  const PlayVideo({ required this.type, required this.path});

  @override
  State<PlayVideo> createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> {
  late final VideoPlayerController _videoPlayerController;

  bool isFinished = false;

  @override
  void initState() {
    super.initState();
    if (widget.type == VideoType.fromAsset) {
      _videoPlayerController = VideoPlayerController.asset(widget.path)
        ..addListener(() => setState(() {
              isFinished = _videoPlayerController.value.duration ==
                  _videoPlayerController.value.position;
            }))
        ..setLooping(false)
        ..initialize().then((_) => _videoPlayerController.play());
    } else if (widget.type == VideoType.fromInternet) {
      _videoPlayerController = VideoPlayerController.network(widget.path)
        ..addListener(() => setState(() {}))
        ..setLooping(false)
        ..initialize().then((_) => _videoPlayerController.play());
    }
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_videoPlayerController.value.isInitialized) {
      if (widget.type == VideoType.fromAsset) {
        return AspectRatio(
          aspectRatio: 16 / 9,
          child: Video(
            videoPlayerController: _videoPlayerController,
            isFinished: isFinished,
          ),
        );
      } else {
        // internet videosu
        return const AspectRatio(aspectRatio: 16 / 9);
      }
    } else {
      // load
      return const AspectRatio(
        aspectRatio: 16 / 9,
        child: Center(
          child: CircularProgressIndicator(color: Colors.amber),
        ),
      );
    }
  }
}

class Video extends StatefulWidget {
  Video(
      {
      required this.videoPlayerController,
      required this.isFinished});
  final VideoPlayerController videoPlayerController;
  bool isFinished;

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  bool isPaused = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
            onTap: () => setState(() {
                  if (widget.isFinished) {
                    widget.videoPlayerController.play();
                    isPaused = false;
                  } else {
                    if (!isPaused) {
                      widget.videoPlayerController.pause();
                    }

                    if (isPaused) {
                      widget.videoPlayerController.play();
                    }

                    isPaused = !isPaused;
                  }
                }),
            child: VideoPlayer(widget.videoPlayerController)),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: VideoProgressIndicator(
              widget.videoPlayerController,
              allowScrubbing: true,
              colors: const VideoProgressColors(
                playedColor: Colors.blue,
              ),
            )),

        // replay
        Visibility(
            visible: widget.isFinished,
            child: Align(
              alignment: Alignment.center,
              child: IconButton(
                  onPressed: () => setState(() {
                        widget.videoPlayerController.play();
                      }),
                  icon: const Icon(
                    Icons.replay,
                    size: 45,
                    color: Colors.white,
                  )),
            )),

        // play or pause
        Visibility(
          visible: isPaused,
          child: Align(
            alignment: Alignment.center,
            child: IconButton(
                onPressed: () => setState(() {
                      widget.videoPlayerController.play();
                      isPaused = false;
                    }),
                icon: const Icon(
                  Icons.play_arrow,
                  size: 45,
                  color: Colors.white,
                )),
          ),
        ),
      ],
    );
  }
}

enum VideoType {
  fromAsset,
  fromInternet,
}
