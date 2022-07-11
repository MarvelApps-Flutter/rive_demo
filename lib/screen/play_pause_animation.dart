/// Demonstrates how to play and pause a looping animation

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class PlayPauseAnimation extends StatefulWidget {
  const PlayPauseAnimation({Key? key}) : super(key: key);

  @override
  _PlayPauseAnimationState createState() => _PlayPauseAnimationState();
}

class _PlayPauseAnimationState extends State<PlayPauseAnimation> {
  /// Controller for playback
  late RiveAnimationController _controller;

  /// Toggles between play and pause animation states
  void _togglePlay() =>
      setState(() => _controller.isActive = !_controller.isActive);

  /// Tracks if the animation is playing by whether controller is running
  bool get isPlaying => _controller.isActive;

  @override
  void initState() {
    super.initState();
    _controller = SimpleAnimation('idle');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Animation Example'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: RiveAnimation.network(
                'https://cdn.rive.app/animations/vehicles.riv',
                controllers: [_controller],
                // Update the play state when the widget's initialized
                onInit: (_) => setState(() {}),
              ),
            ),
            ElevatedButton(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: isPlaying
                    ? SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('Pause'),
                            SizedBox(
                              width: 15,
                            ),
                            Icon(Icons.pause)
                          ],
                        ),
                      )
                    : SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('Play'),
                            SizedBox(
                              width: 15,
                            ),
                            Icon(Icons.play_arrow)
                          ],
                        ),
                      ),
              ),
              onPressed: _togglePlay,
            ),
          ],
        ),
      ),
    );
  }
}
