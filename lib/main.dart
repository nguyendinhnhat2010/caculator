import 'package:flutter/material.dart';

void main() {
  runApp(const Calculator());
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  dynamic text = '0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
  void calculation(btnText) {
    if (btnText == 'AC') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if (opr == '=' && btnText == '=') {
      if (preOpr == '+') {
        finalResult = add();
      } else if (preOpr == '-') {
        finalResult = sub();
      } else if (preOpr == 'x') {
        finalResult = mul();
      } else if (preOpr == '/') {
        finalResult = div();
      }
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == 'x' ||
        btnText == '/' ||
        btnText == '=') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if (opr == '+') {
        finalResult = add();
      } else if (opr == '-') {
        finalResult = sub();
      } else if (opr == 'x') {
        finalResult = mul();
      } else if (opr == '/') {
        finalResult = div();
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    } else if (btnText == '%') {
      result = numOne / 100;
      finalResult = doesContainDecimal(result);
    } else if (btnText == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalResult = result;
    } else if (btnText == '+/-') {
      result.toString().startsWith('-')
          ? result = result.toString().substring(1)
          : result = '-' + result.toString();
      finalResult = result;
    } else {
      result = result + btnText;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }
    return result;
  }

  Widget calcbtn(String textBtn, Color colorBtn, Color colorTextBtn) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ElevatedButton(
            onPressed: () {
              calculation(textBtn);
            },
            child: Text(
              textBtn,
              style: TextStyle(
                  fontSize: 20,
                  color: colorTextBtn,
                  fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(60, 60),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              primary: colorBtn,
            )),
      ),
    );
  }

  Widget calcbtn0(String textBtn, Color colorBtn, Color colorTextBtn) {
    return Expanded(
      flex: 2,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ElevatedButton(
            onPressed: () {
              calculation(textBtn);
            },
            child: Text(
              textBtn,
              style: TextStyle(
                  fontSize: 20,
                  color: colorTextBtn,
                  fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              primary: colorBtn,
              padding: const EdgeInsets.symmetric(vertical: 26),
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Center(
            child: Text("Calculator"),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10, bottom: 50),
                  child: Text(text, style: TextStyle(fontSize: 100)),
                ),
              ],
            ),
            Row(
              children: [
                calcbtn("AC", Colors.teal, Colors.white),
                calcbtn("+/-", Colors.teal, Colors.white),
                calcbtn("%", Colors.teal, Colors.white),
                calcbtn("/", Colors.orange, Colors.white)
              ],
            ),
            Row(
              children: [
                calcbtn("7", Colors.deepPurple, Colors.white),
                calcbtn("8", Colors.deepPurple, Colors.white),
                calcbtn("9", Colors.deepPurple, Colors.white),
                calcbtn("x", Colors.orange, Colors.white)
              ],
            ),
            Row(
              children: [
                calcbtn("4", Colors.deepPurple, Colors.white),
                calcbtn("5", Colors.deepPurple, Colors.white),
                calcbtn("6", Colors.deepPurple, Colors.white),
                calcbtn("-", Colors.orange, Colors.white)
              ],
            ),
            Row(
              children: [
                calcbtn("1", Colors.deepPurple, Colors.white),
                calcbtn("2", Colors.deepPurple, Colors.white),
                calcbtn("3", Colors.deepPurple, Colors.white),
                calcbtn("+", Colors.orange, Colors.white)
              ],
            ),
            Row(
              children: [
                calcbtn0("0", Colors.deepPurple, Colors.white),
                calcbtn(".", Colors.deepPurple, Colors.white),
                calcbtn("=", Colors.orange, Colors.white)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
