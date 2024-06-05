import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:string_validator/string_validator.dart';

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
    String newExpr = expr;
    String newResult = result;
    Parser p = Parser();

    if (val == "AC") {
      newExpr = "0";
      newResult = "0";
    } else if (val == "C") {
      newExpr = newExpr.substring(0, newExpr.length - 1);
      if (newExpr.isEmpty) {
        newExpr = "0";
      }
    } else if (val == "F") {
      if (newExpr.endsWith('.') ||
          newExpr.endsWith('/') ||
          newExpr.endsWith('*') ||
          newExpr.endsWith('-') ||
          newExpr.endsWith('+')) {
        return;
      }
      try {
        newExpr = newExpr + "*6.55957";
        Expression exp = p.parse(newExpr);
        ContextModel cm = ContextModel();
        double eval = exp.evaluate(EvaluationType.REAL, cm);
        newExpr = "0";
        newResult = eval.toString();
      } catch (e) {
        newExpr = "0";
        newResult = "Error";
      }
    } else if (val == "€") {
      if (newExpr.endsWith('.') ||
          newExpr.endsWith('/') ||
          newExpr.endsWith('*') ||
          newExpr.endsWith('-') ||
          newExpr.endsWith('+')) {
        return;
      }

      try {
        newExpr = newExpr + "/6.55957";
        Expression exp = p.parse(newExpr);
        ContextModel cm = ContextModel();
        double eval = exp.evaluate(EvaluationType.REAL, cm);
        newExpr = "0";
        newResult = eval.toString();
      } catch (e) {
        newExpr = "0";
        newResult = "Error";
      }
    } else if (val == "=") {
      if (newExpr.endsWith('.') ||
          newExpr.endsWith('/') ||
          newExpr.endsWith('*') ||
          newExpr.endsWith('-') ||
          newExpr.endsWith('+')) {
        return;
      }
      try {
        Expression exp = p.parse(newExpr);
        ContextModel cm = ContextModel();
        double eval = exp.evaluate(EvaluationType.REAL, cm);
        newExpr = "0";
        newResult = eval.toString();
      } catch (e) {
        newExpr = "0";
        newResult = "Error";
      }
    } else if (val == "-") {
      if (newExpr.endsWith('.') || newExpr.endsWith('--')) {
        return;
      }
      if (newExpr == "0") {
        newExpr = val;
      } else {
        newExpr = newExpr + val;
      }
    } else if (val == "/" || val == "*" || val == "+") {
      if (newExpr.endsWith('.') ||
          newExpr.endsWith('/') ||
          newExpr.endsWith('*') ||
          newExpr.endsWith('-') ||
          newExpr.endsWith('+')) {
        return;
      }
      newExpr = newExpr + val;
    } else if (val == ".") {
      newExpr = newExpr + val;
      //check presence "." depuis dernier / * - +
    } else if (isNumeric(val)) {
      if (newExpr == "0") {
        newExpr = val;
      } else {
        newExpr = newExpr + val;
      }
    } else {
      debugPrint("Something went very wrong");
    }

    setState(() {
      debugPrint(newExpr);
      this.expr = newExpr;
      this.result = newResult;
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

  const CalcButton({required this.btn, required this.callback});

  void handleInput(String val) {
    callback(val);
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
            CalcButton(
              btn: "C",
              callback: callback,
            ),
            CalcButton(
              btn: "AC",
              callback: callback,
            ),
            CalcButton(
              btn: "F",
              callback: callback,
            ),
            CalcButton(
              btn: "€",
              callback: callback,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalcButton(
              btn: "7",
              callback: callback,
            ),
            CalcButton(
              btn: "8",
              callback: callback,
            ),
            CalcButton(
              btn: "9",
              callback: callback,
            ),
            CalcButton(
              btn: "/",
              callback: callback,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalcButton(
              btn: "4",
              callback: callback,
            ),
            CalcButton(
              btn: "5",
              callback: callback,
            ),
            CalcButton(
              btn: "6",
              callback: callback,
            ),
            CalcButton(
              btn: "*",
              callback: callback,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalcButton(
              btn: "1",
              callback: callback,
            ),
            CalcButton(
              btn: "2",
              callback: callback,
            ),
            CalcButton(
              btn: "3",
              callback: callback,
            ),
            CalcButton(
              btn: "-",
              callback: callback,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CalcButton(
              btn: "0",
              callback: callback,
            ),
            CalcButton(
              btn: ".",
              callback: callback,
            ),
            CalcButton(
              btn: "=",
              callback: callback,
            ),
            CalcButton(
              btn: "+",
              callback: callback,
            ),
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

  @override
  State<CalcDisplay> createState() => CalcDisplayState();
}

class CalcDisplayState extends State<CalcDisplay> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String displayExpr = widget.expr;
    int len = widget.expr.length;
    if (len > 20) {
      displayExpr = "..." + widget.expr.substring(len - 20);
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Text(displayExpr,
              maxLines: 1,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: size.height * 0.04,
              )),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Text(widget.result,
              maxLines: 1,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: size.height * 0.04,
              )),
        ]),
      ],
    );
    // );
  }
}
