import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({ super.key });
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({ super.key });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Simple text!",
                style: TextStyle(
                  fontSize: 32,
                )),
            ElevatedButton(
              onPressed: () {
                // Respond to button press
                debugPrint("Button pressed");
              },
              child: const Text('CLICK ME',
                  style: TextStyle(
                    fontSize: 32,
                  )),
            )
          ],
        ),
      ),
    );
  }
}