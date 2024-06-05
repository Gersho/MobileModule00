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

class CalcApp extends StatefulWidget {
  const CalcApp({super.key});
  @override
  State<CalcApp> createState() => CalcAppState();
}

class CalcAppState extends State<CalcApp> {
  String expr = "0";
  String result = "0";

  void callbacktest(String val) {
    setState(() {
      this.expr = val;
    });
  }

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
            CalcDisplay(expr: expr, result: result),
            Container(
                height: size.height * 0.60,
                width: size.width,
                child: CalcPad(callback: this.callbacktest))
          ],
        ));
  }
}

class CalcButton extends StatelessWidget {
  final String btn;
  final ValueSetter<String> callback;

  const CalcButton({
    required this.btn,
    required this.callback
  });

  // String lastInput;
  // String currentExpr;

  void handleInput(String val) {
    callback(val);
    // Parser p = Parser();
    // debugPrint(val);

    // if (val == "C") {}

    // // if (val)

    // if (val == "=") {
    //   Expression exp = p.parse(val);
    // }

    // if (val == "/" || val == "*" || val == "-" || val == "+") {}

    //   setState(() {
    //   if (textDisplayed == textA) {
    //     textDisplayed = textB;
    //   } else {
    //     textDisplayed = textA;
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
        width: size.width / 4,
        height: (size.height * 0.60) / 6,
        child: ElevatedButton(
          onPressed: () {
            handleInput(btn);
          },
          child: Text(btn,
              style: TextStyle(
                fontSize: size.height * 0.04,
              )),
        ));
  }
}

class CalcPad extends StatelessWidget {
  // ValueSetter<String>
  final ValueSetter<String> callback;

  const CalcPad({
    required this.callback,
  });


  // const CalcPad({super.key});

  // void displayPressed(String val) {
  //   debugPrint(val);
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalcButton(btn: "C", callback: callback,),
            CalcButton(btn: "AC", callback: callback,),
            CalcButton(btn: "F", callback: callback,),
            CalcButton(btn: "€", callback: callback,),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalcButton(btn: "7", callback: callback,),
            CalcButton(btn: "8", callback: callback,),
            CalcButton(btn: "9", callback: callback,),
            CalcButton(btn: "/", callback: callback,),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalcButton(btn: "4", callback: callback,),
            CalcButton(btn: "5", callback: callback,),
            CalcButton(btn: "6", callback: callback,),
            CalcButton(btn: "*", callback: callback,),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalcButton(btn: "1", callback: callback,),
            CalcButton(btn: "2", callback: callback,),
            CalcButton(btn: "3", callback: callback,),
            CalcButton(btn: "-", callback: callback,),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalcButton(btn: "0", callback: callback,),
            CalcButton(btn: ".", callback: callback,),
            CalcButton(btn: "=", callback: callback,),
            CalcButton(btn: "+", callback: callback,),
          ],
        ),
      ],
    );
  }
}

class CalcDisplay extends StatefulWidget {
  final String expr;
  final String result;

  const CalcDisplay({required this.expr, required this.result});

  // const CalcDisplay({super.key});
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
          Text(widget.expr,
              maxLines: 1,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: size.height * 0.08,
              )),
          Text(widget.result,
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
