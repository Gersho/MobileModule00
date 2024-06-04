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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  MyHomePageState createState() => MyHomePageState();
}


class MyHomePageState extends State<MyHomePage> {
  String textDisplayed = "Simple text!";
  String textA = "Simple text!";
  String textB = "Hello World!";

  void _changeText() {
    setState(() {
      if (textDisplayed == textA) {
        textDisplayed = textB;
      } else {
        textDisplayed = textA;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(textDisplayed,
                style: const TextStyle(
                  fontSize: 32,
                )),
            ElevatedButton(
              onPressed: () {
                _changeText();
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