import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({ super.key });
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CalcApp(),

    );
  }
}

class CalcApp extends StatelessWidget
{
  const CalcApp({super.key});
  @override
  Widget build(BuildContext context) {
  return Scaffold(

      appBar: AppBar(
        title: const Text("Calculator"),
        backgroundColor: Color.fromARGB(255, 3, 126, 156),
        centerTitle: true,
      ),
      body: const Column (
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CalcDisplay(),
          CalcPad()
        ],
      )
    );
}
}

class CalcPad extends StatelessWidget
{
  const CalcPad({super.key});

  void displayPressed(String val)
  {
    debugPrint(val);
  }

  @override
  Widget build(BuildContext context) {

  return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(  onPressed: () { displayPressed("C"); },
                  child: const Text('C', style: TextStyle( fontSize: 30, )),),

                  ElevatedButton(  onPressed: () { displayPressed("AC"); },
                  child: const Text('AC', style: TextStyle( fontSize: 20, )),),

                   ElevatedButton(  onPressed: () { displayPressed(""); },
                  child: const Text('0', style: TextStyle( fontSize: 30, )),),

                   ElevatedButton(  onPressed: () { displayPressed(""); },
                  child: const Text('0', style: TextStyle( fontSize: 30, )),)

                ],
              ),



              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(  onPressed: () { displayPressed("7"); },
                  child: const Text('7', style: TextStyle( fontSize: 30, )),),

                  ElevatedButton(  onPressed: () { displayPressed("8"); },
                  child: const Text('8', style: TextStyle( fontSize: 30, )),),

                   ElevatedButton(  onPressed: () { displayPressed("9"); },
                  child: const Text('9', style: TextStyle( fontSize: 30, )),),

                   ElevatedButton(  onPressed: () { displayPressed("/"); },
                  child: const Text('/', style: TextStyle( fontSize: 30, )),)
                ],
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(  onPressed: () { displayPressed("4"); },
                  child: const Text('4', style: TextStyle( fontSize: 30, )),),

                  ElevatedButton(  onPressed: () { displayPressed("5"); },
                  child: const Text('5', style: TextStyle( fontSize: 30, )),),

                   ElevatedButton(  onPressed: () { displayPressed("6"); },
                  child: const Text('6', style: TextStyle( fontSize: 30, )),),

                   ElevatedButton(  onPressed: () { displayPressed("*"); },
                  child: const Text('*', style: TextStyle( fontSize: 30, )),)
                ],
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(  onPressed: () { displayPressed("1"); },
                  child: const Text('1', style: TextStyle( fontSize: 30, )),),

                  ElevatedButton(  onPressed: () { displayPressed("2"); },
                  child: const Text('2', style: TextStyle( fontSize: 30, )),),

                   ElevatedButton(  onPressed: () { displayPressed("3"); },
                  child: const Text('3', style: TextStyle( fontSize: 30, )),),

                   ElevatedButton(  onPressed: () { displayPressed("-"); },
                  child: const Text('-', style: TextStyle( fontSize: 30, )),)
                ],
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(  onPressed: () { displayPressed("1"); },
                  child: const Text('0', style: TextStyle( fontSize: 30, )),),

                  ElevatedButton(  onPressed: () { displayPressed("2"); },
                  child: const Text('.', style: TextStyle( fontSize: 30, )),),

                   ElevatedButton(  onPressed: () { displayPressed("3"); },
                  child: const Text('=', style: TextStyle( fontSize: 30, )),),

                   ElevatedButton(  onPressed: () { displayPressed("+"); },
                  child: const Text('+', style: TextStyle( fontSize: 30, )),)
                ],
              ),
          ],
        );

}
}




class CalcDisplay extends StatefulWidget {
  const CalcDisplay({ super.key });
  @override
  State<CalcDisplay> createState() => CalcDisplayState();
}

class CalcDisplayState extends State<CalcDisplay> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topRight,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("0",
              maxLines: 1,
              textAlign: TextAlign.right,
              style: TextStyle(
                    fontSize: 32,
                  )),
             
            Text("0",
              maxLines: 1,
              textAlign: TextAlign.right,
              style: TextStyle(
                    fontSize: 32,
                  )),
              ],
          ),
      );
  }
}


// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});
//   @override
//   MyHomePageState createState() => MyHomePageState();
// }

// class MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//       appBar: AppBar(
//         title: const Text("Calculator"),
//         backgroundColor: Color.fromARGB(255, 3, 126, 156),
//         centerTitle: true,
//       ),


//       body: const CalcDisplay(),
//     );
//   }


// }


