import 'package:flutter/material.dart';
import 'package:rive/rive.dart' as rive;
import 'example_state_machine.dart';
import 'liquid_download.dart';
import 'play_one_shot_animation.dart';
import 'play_pause_animation.dart';
import 'simple_animation.dart';
import 'simple_state_machine.dart';
import 'state_machine_skills.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rive Module'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          const rive.RiveAnimation.asset(
            'assets/background_rocket.riv',
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: double.infinity,
            child: FractionallySizedBox(
              widthFactor: 0.7,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Text('Simple Animation'),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (context) => const SimpleAnimation(),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Text('Play/Pause Animation'),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (context) => const PlayPauseAnimation(),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Text('Play One-Shot Animation'),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (context) =>
                                  const PlayOneShotAnimation(),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Text('Button State Machine'),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (context) => const ExampleStateMachine(),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Text('Skills Machine'),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (context) => const StateMachineSkills(),
                            ),
                          );
                        },
                      ),
                    ),

                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // ElevatedButton(
                    //   child: const Text('Little Machine'),
                    //   onPressed: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute<void>(
                    //         builder: (context) => const LittleMachine(),
                    //       ),
                    //     );
                    //   },
                    // ),

                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Text('Liquid Download'),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (context) => const LiquidDownload(),
                            ),
                          );
                        },
                      ),
                    ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // ElevatedButton(
                    //   child: const Text('Custom Controller - Speed'),
                    //   onPressed: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute<void>(
                    //         builder: (context) => const SpeedyAnimation(),
                    //       ),
                    //     );
                    //   },
                    // ),

                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Text('Simple State Machine'),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (context) => const SimpleStateMachine(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
