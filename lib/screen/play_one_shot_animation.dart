/// Demonstrates playing a one-shot animation on demand

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class PlayOneShotAnimation extends StatefulWidget {
  const PlayOneShotAnimation({Key? key}) : super(key: key);

  @override
  _PlayOneShotAnimationState createState() => _PlayOneShotAnimationState();
}

class _PlayOneShotAnimationState extends State<PlayOneShotAnimation> {
  /// Controller for playback
  late RiveAnimationController _controller;

  /// Is the animation currently playing?
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = OneShotAnimation(
      'bounce',
      autoplay: false,
      onStop: () => setState(() => _isPlaying = false),
      onStart: () => setState(() => _isPlaying = true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('One-Shot Example'),
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
                animations: const ['idle', 'curves'],
                controllers: [_controller],
              ),
            ),
            ElevatedButton(
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                child: Text('Bump Me'),
              ),
              onPressed: () => _isPlaying ? null : _controller.isActive = true,
            ),
          ],
        ),
      ),
    );
  }
}
