import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoBackground extends StatefulWidget {
  final Widget child;
  final double height;
  final double width;
  VideoBackground({
    super.key,
    required this.child,
    required this.height,
    required this.width,
  });

  @override
  State<VideoBackground> createState() => _VideoBackgroundState();
}

class _VideoBackgroundState extends State<VideoBackground> {
  late VideoPlayerController _controller;
  // init video player
  void initState() {
    _controller = VideoPlayerController.asset('assets/videos/clouds.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setLooping(true);
      });

    super.initState();
  }

  // remove controller
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return SizedBox();
    }
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Stack(
        fit: StackFit.expand,
        children: [
          FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: _controller.value.size.width,
              height: _controller.value.size.height,
              child: VideoPlayer(_controller),
            ),
          ),
          widget.child,
        ],
      ),
    );
  }
}
