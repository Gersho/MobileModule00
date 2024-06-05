import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CalcApp(),
    );
  }
}

class CalcApp extends StatelessWidget {
  const CalcApp({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Text("Calculator",
              maxLines: 1,
              style: TextStyle(
                fontSize: size.height * 0.05,
              )),
          backgroundColor: Color.fromARGB(255, 3, 126, 156),
          centerTitle: true,
          toolbarHeight: size.height * 0.08,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const CalcDisplay(),
            Container(

                //  color: Colors.blue,
                height: size.height * 0.60,
                width: size.width,
                child: const CalcPad())
          ],
        ));
  }
}

class CalcButton extends StatelessWidget {
  final String btn;

  const CalcButton({
    required this.btn,
  });

  void displayPressed(String val) {
    debugPrint(val);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
        width: size.width / 4,
        height: (size.height * 0.60) / 6,
        child: ElevatedButton(
          onPressed: () {
            displayPressed(btn);
          },
          child: Text(btn,
              style: TextStyle(
                fontSize: size.height * 0.04,
              )),
        ));
  }
}

class CalcPad extends StatelessWidget {
  const CalcPad({super.key});

  void displayPressed(String val) {
    debugPrint(val);
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalcButton(btn: "C"),
            CalcButton(btn: "AC"),
            CalcButton(btn: "F"),
            CalcButton(btn: "€"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalcButton(btn: "7"),
            CalcButton(btn: "8"),
            CalcButton(btn: "9"),
            CalcButton(btn: "/"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalcButton(btn: "4"),
            CalcButton(btn: "5"),
            CalcButton(btn: "6"),
            CalcButton(btn: "*"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalcButton(btn: "1"),
            CalcButton(btn: "2"),
            CalcButton(btn: "3"),
            CalcButton(btn: "-"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalcButton(btn: "0"),
            CalcButton(btn: "."),
            CalcButton(btn: "="),
            CalcButton(btn: "+"),
          ],
        ),
      ],
    );
  }
}

class CalcDisplay extends StatefulWidget {
  const CalcDisplay({super.key});
  @override
  State<CalcDisplay> createState() => CalcDisplayState();
}

class CalcDisplayState extends State<CalcDisplay> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.topRight,
      // color: Colors.yellow,
      height: size.height * 0.25,
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("0",
              maxLines: 1,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: size.height * 0.08,
              )),
          Text("0",
              maxLines: 1,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: size.height * 0.08,
              )),
        ],
      ),
    );
  }
}
