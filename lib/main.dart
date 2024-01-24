import 'package:flutter/material.dart';

void main() {
  runApp(CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String display = '';
  String currentInput = '';
  String operation = '';
  double result = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weapon276'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(16.0),
              child: Text(
                display,
                style: TextStyle(fontSize: 36.0),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildButton('7'),
              _buildButton('8'),
              _buildButton('9'),
              _buildButton('/'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildButton('4'),
              _buildButton('5'),
              _buildButton('6'),
              _buildButton('*'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildButton('1'),
              _buildButton('2'),
              _buildButton('3'),
              _buildButton('-'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildButton('%'),
              _buildButton('('),
              _buildButton(')'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildButton('0'),
              _buildButton('C'),
              _buildButton('='),
              _buildButton('+'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String buttonText) {
    return ElevatedButton(
      onPressed: () {
        _onButtonPressed(buttonText);
      },
      child: Text(
        buttonText,
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }

  void _onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        display = '';
        currentInput = '';
        result = 0.0;
        operation = '';
      } else if (buttonText == '=') {
        if (currentInput.isNotEmpty && operation.isNotEmpty) {
          double secondOperand = double.parse(currentInput);
          switch (operation) {
            case '+':
              result += secondOperand;
              break;
            case '-':
              result -= secondOperand;
              break;
            case '*':
              result *= secondOperand;
              break;
            case '%':
              result %= secondOperand;
              break;
            case '(':
              result = secondOperand;
              break;
            case '/':
              if (secondOperand != 0) {
                result /= secondOperand;
              } else {
                display = 'Error';
                return;
              }
              break;
            default:
              break;
          }
          display = result.toString();
          currentInput = '';
          operation = '';
        }
      } else if ('+-%*/()'.contains(buttonText)) {
        if (currentInput.isNotEmpty) {
          operation = buttonText;
          result = double.parse(currentInput);
          display = currentInput + buttonText;
          currentInput = '';
        }
      } else {
        currentInput += buttonText;
        display += buttonText;
      }
    });
  }
}
