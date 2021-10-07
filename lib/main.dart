import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double number1 = 0;
  double number2 = 0;
  String sum = "";

  List<String> textLine1 = [];
  List<String> textLine2 = [];
  List<String> textLine3 = [];
  List<String> textLine4 = [];
  List<Color> color1 = [];
  List<Color> color2 = [];

  @override
  void initState() {
    textLine1 = ["AC", "+/-", "%", "/"];
    textLine2 = ["7", "8", "9", "x"];
    textLine3 = ["4", "5", "6", "-"];
    textLine4 = ["1", "2", "3", "+"];
    color2 = [
      Colors.deepPurple,
      Colors.deepPurple,
      Colors.deepPurple,
      Colors.orangeAccent
    ];
    color1 = [Colors.teal, Colors.teal, Colors.teal, Colors.orangeAccent];
    super.initState();
  }

  calculator() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Colors.teal[300],
          title: const Center(
            child: Text("Calculator"),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: const Text(
                      "0",
                      style: TextStyle(fontSize: 70),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  for (int i = 0; i < 4; i++)
                    Expanded(
                        child: Container(
                            margin: const EdgeInsets.only(bottom: 15),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                textLine1[i],
                                style: const TextStyle(fontSize: 18),
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(25),
                                primary: color1[i], // <-- Text color
                              ),
                            )))
                ],
              ),
              Row(
                children: [
                  for (int i = 0; i < 4; i++)
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.only(bottom: 15),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                textLine2[i],
                                style: const TextStyle(fontSize: 18),
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(25),
                                primary: color2[i], // <-- Text color
                              ),
                            )))
                ],
              ),
              Row(
                children: [
                  for (int i = 0; i < 4; i++)
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.only(bottom: 15),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                textLine3[i],
                                style: const TextStyle(fontSize: 18),
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(25),
                                primary: color2[i], // <-- Text color
                              ),
                            )))
                ],
              ),
              Row(
                children: [
                  for (int i = 0; i < 4; i++)
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.only(bottom: 15),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                textLine4[i],
                                style: const TextStyle(fontSize: 18),
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(25),
                                primary: color2[i], // <-- Text color
                              ),
                            )))
                ],
              ),
              Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        margin: EdgeInsets.only(left: 15, right: 15),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            "0",
                            style: TextStyle(fontSize: 18),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            primary: Colors.deepPurple,
                          ),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          ",",
                          style: TextStyle(fontSize: 18),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(25),
                          primary: Colors.deepPurple,
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          "=",
                          style: TextStyle(fontSize: 18),
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(25),
                            primary: Colors.orangeAccent),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
