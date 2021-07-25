import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";
  String _output = "0";
  String operand = "";
  double num1 = 0.0;
  double num2 = 0.0;

  buttonPressed(String input) {
    if (input == "clear") {
      output = "0";
      _output = "0";
      operand = "";
      num1 = 0.0;
      num2 = 0.0;
    } else if (input == "/" || input == "x" || input == "-" || input == "+") {
      num1 = double.parse(output);
      operand = input;
      _output = "0";
    } else if (input == ".") {
      if (_output.contains(".")) {
        return;
      } else {
        _output = _output + input;
      }
    } else if (input == "=") {
      num2 = double.parse(output);
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      if (operand == "x") {
        _output = (num1 * num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "+") {
        _output = (num1 + num2).toString();
      }

      operand = "";
      num1 = 0.0;
      num2 = 0.0;
    } else {
      _output = _output + input;
    }

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String label) {
    return Expanded(
        child: MaterialButton(
          child: Text(
            label,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          onPressed: () => buttonPressed(label),
          color: Colors.deepPurple,
          textColor: Colors.white,
          padding: EdgeInsets.all(24.0),
        ));
  }

  List<Widget> calcButtons(List<String> labels) {
    List<Widget> buttons = [];
    for (var i = 0; i < labels.length; i++) {
      buttons.add(buildButton(labels[i]));
    }
    return buttons;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                  alignment: Alignment.centerRight,
                  padding:
                  EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
                  child: Text(output,
                      style: TextStyle(
                          fontSize: 46.0, fontWeight: FontWeight.bold))),
              Expanded(child: Divider()),
              Column(
                children: [
                  Row(
                    children: calcButtons(["1", "2", "3", "/"]),
                  ),
                  Row(
                    children: calcButtons(["4", "5", "6", "x"]),
                  ),
                  Row(
                    children: calcButtons(["7", "8", "9", "-"]),
                  ),
                  Row(
                    children: calcButtons([".", "0", "00", "+"]),
                  ),
                  Row(
                    children: calcButtons(["clear", "="]),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
