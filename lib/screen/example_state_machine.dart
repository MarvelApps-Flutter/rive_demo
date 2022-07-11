import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class ExampleStateMachine extends StatefulWidget {
  const ExampleStateMachine({Key? key}) : super(key: key);

  @override
  _ExampleStateMachineState createState() => _ExampleStateMachineState();
}

class _ExampleStateMachineState extends State<ExampleStateMachine> {
  bool get isPlaying => _controller?.isActive ?? false;

  Artboard? _riveArtboard;
  StateMachineController? _controller;
  SMIInput<bool>? _pressInput;

  @override
  void initState() {
    super.initState();
    rootBundle.load('assets/rocket.riv').then(
      (data) async {
        final file = RiveFile.import(data);

        final artboard = file.mainArtboard;
        var controller =
            StateMachineController.fromArtboard(artboard, 'Button');
        if (controller != null) {
          artboard.addController(controller);
          _pressInput = controller.findInput('Press');
        }
        setState(() => _riveArtboard = artboard);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Button State Machine'),
      ),
      body: Center(
        child: _riveArtboard == null
            ? const SizedBox()
            : GestureDetector(
                onTap: () => _pressInput?.value = true,
                // onTapDown: (_) => _pressInput?.value = true,
                onTapCancel: () => _pressInput?.value = false,
                // onTapUp: (_) => _pressInput?.value = false,
                child: SizedBox(
                  width: 250,
                  height: 250,
                  child: Rive(
                    artboard: _riveArtboard!,
                  ),
                ),
              ),
      ),
    );
  }
}
