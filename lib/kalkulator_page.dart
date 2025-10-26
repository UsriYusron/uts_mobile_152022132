import 'package:flutter/material.dart';
import 'dart:math'; // untuk fungsi sqrt dan pow

class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({super.key});

  @override
  State<KalkulatorPage> createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  String _input = '';
  String _result = '';

  void _onButtonPressed(String value) {
    setState(() {
      if (value == 'C') {
        _input = '';
        _result = '';
      } else if (value == '=') {
        try {
          _calculate();
        } catch (e) {
          _result = 'Error';
        }
      } else if (value == 'x²') {
        if (_input.isNotEmpty) {
          final num = double.tryParse(_input);
          if (num != null) {
            _result = (pow(num, 2)).toString();
          }
        }
      } else if (value == '√x') {
        if (_input.isNotEmpty) {
          final num = double.tryParse(_input);
          if (num != null) {
            _result = sqrt(num).toString();
          }
        }
      } else {
        _input += value;
      }
    });
  }

  void _calculate() {
    String expression = _input.replaceAll('×', '*').replaceAll('÷', '/');
    try {
      // evaluasi manual sederhana menggunakan RegExp (bisa pakai parser math jika mau lebih kompleks)
      _result = _evaluateExpression(expression).toString();
    } catch (e) {
      _result = 'Error';
    }
  }

  double _evaluateExpression(String expr) {
    // ⚠️ Kalkulator sederhana: hanya mendukung satu operator
    if (expr.contains('+')) {
      var parts = expr.split('+');
      return double.parse(parts[0]) + double.parse(parts[1]);
    } else if (expr.contains('-')) {
      var parts = expr.split('-');
      return double.parse(parts[0]) - double.parse(parts[1]);
    } else if (expr.contains('*')) {
      var parts = expr.split('*');
      return double.parse(parts[0]) * double.parse(parts[1]);
    } else if (expr.contains('/')) {
      var parts = expr.split('/');
      return double.parse(parts[0]) / double.parse(parts[1]);
    } else {
      return double.parse(expr);
    }
  }

  Widget _buildButton(String text, {Color? color}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: () => _onButtonPressed(text),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 20),
            backgroundColor: color ?? Colors.blueGrey[200],
            foregroundColor: Colors.black,
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator Sederhana'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    _input,
                    style: const TextStyle(fontSize: 28, color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _result,
                    style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  _buildButton('7'),
                  _buildButton('8'),
                  _buildButton('9'),
                  _buildButton('÷'),
                ],
              ),
              Row(
                children: [
                  _buildButton('4'),
                  _buildButton('5'),
                  _buildButton('6'),
                  _buildButton('×'),
                ],
              ),
              Row(
                children: [
                  _buildButton('1'),
                  _buildButton('2'),
                  _buildButton('3'),
                  _buildButton('-'),
                ],
              ),
              Row(
                children: [
                  _buildButton('0'),
                  _buildButton('.'),
                  _buildButton('='),
                  _buildButton('+'),
                ],
              ),
              Row(
                children: [
                  _buildButton('x²', color: Colors.orange[300]),
                  _buildButton('√x', color: Colors.orange[300]),
                  _buildButton('C', color: Colors.red[300]),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
