import 'package:flutter/material.dart';
import 'dart:math';

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
      } else if (value == '⌫') {
        if (_input.isNotEmpty) {
          _input = _input.substring(0, _input.length - 1);
        }
      } else if (value == '=') {
        try {
          _calculate();
        } catch (e) {
          _result = 'Error';
        }
      } else {
        _input += value;
      }
    });
  }

  void _calculate() {
    String expression = _input.replaceAll('×', '*').replaceAll('÷', '/');
    try {
      _result = _evaluateExpression(expression).toString();
    } catch (e) {
      _result = 'Error';
    }
  }

  double _evaluateExpression(String expr) {
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

  Widget _buildButton(
    String text, {
    Color? bgColor,
    Color? textColor,
    bool isSpecial = false,
  }) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(4),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => _onButtonPressed(text),
            borderRadius: BorderRadius.circular(16),
            child: Container(
              height: 65, // Reduced height
              decoration: BoxDecoration(
                color: bgColor ?? Colors.grey[100],
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: isSpecial ? 18 : 22, // Reduced font size
                    fontWeight: FontWeight.w600,
                    color: textColor ?? Colors.black87,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          margin: const EdgeInsets.only(
            bottom: 0,
          ), // Adjust the bottom margin as needed
          child: AppBar(
            title: const Text(
              'Calculator',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            backgroundColor: Colors.blue.shade700,
            elevation: 0,
            centerTitle: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Display Section - Reduced flex
            Expanded(
              flex: 1, // Reduced from 2 to 1
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.all(5), // Add top margin here
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.blue.shade700,
                      const Color.fromARGB(255, 37, 207, 222),
                    ],
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                    topRight: Radius.circular(24),
                    topLeft: Radius.circular(24),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      child: Text(
                        _input.isEmpty ? '0' : _input,
                        style: const TextStyle(
                          fontSize: 28, // Reduced font size
                          color: Colors.white70,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8), // Reduced spacing
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      child: Text(
                        _result.isEmpty ? '0' : _result,
                        style: const TextStyle(
                          fontSize: 36, // Reduced font size
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          height: 1.2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Buttons Section - Increased flex
            Expanded(
              flex: 2, // Increased from 3 to 2
              child: Container(
                padding: const EdgeInsets.all(12), // Reduced padding
                child: Column(
                  children: [
                    // First row - Clear and Delete buttons
                    Row(
                      children: [
                        _buildButton(
                          'C',
                          bgColor: Colors.red.shade400,
                          textColor: Colors.white,
                          isSpecial: true,
                        ),
                        _buildButton(
                          '⌫',
                          bgColor: Colors.orange.shade400,
                          textColor: Colors.white,
                          isSpecial: true,
                        ),
                      ],
                    ),

                    const SizedBox(height: 4), // Reduced spacing
                    // Number pad rows
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                _buildButton('7'),
                                _buildButton('8'),
                                _buildButton('9'),
                                _buildButton(
                                  '÷',
                                  bgColor: Colors.blue.shade700,
                                  textColor: Colors.white,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                _buildButton('4'),
                                _buildButton('5'),
                                _buildButton('6'),
                                _buildButton(
                                  '×',
                                  bgColor: Colors.blue.shade700,
                                  textColor: Colors.white,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                _buildButton('1'),
                                _buildButton('2'),
                                _buildButton('3'),
                                _buildButton(
                                  '-',
                                  bgColor: Colors.blue.shade700,
                                  textColor: Colors.white,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                _buildButton('0'),
                                _buildButton('.'),
                                _buildButton(
                                  '=',
                                  bgColor: Colors.green.shade500,
                                  textColor: Colors.white,
                                ),
                                _buildButton(
                                  '+',
                                  bgColor: Colors.blue.shade700,
                                  textColor: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
