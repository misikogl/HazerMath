import 'package:flutter/material.dart';
import 'package:math_project/questions.dart'; // Gerekli import'ları eklediğinizden emin olun

class CustomMathInputScreen extends StatefulWidget {
  const CustomMathInputScreen({Key? key}) : super(key: key);

  @override
  _CustomMathInputScreenState createState() => _CustomMathInputScreenState();
}

class _CustomMathInputScreenState extends State<CustomMathInputScreen> {
  String _currentInput = '';
  bool _isOperatorAllowed = false;
  bool _isNumberAllowed = true;

  final List<String> _buttons = [
    '1',
    '2',
    '3',
    '+',
    '4',
    '5',
    '6',
    '-',
    '7',
    '8',
    '9',
    '*',
    'C',
    '0',
    'SİL',
    '/',
  ];

  void _onPressed(String value) {
    setState(() {
      if (value == 'C') {
        _currentInput = '';
        _isNumberAllowed = true;
        _isOperatorAllowed = false;
      } else if ('+-*/'.contains(value) && _isOperatorAllowed) {
        _currentInput += value;
        _isOperatorAllowed = false;
        _isNumberAllowed = true;
      } else if (value != '=' && _isNumberAllowed) {
        _currentInput += value;
        _isOperatorAllowed = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 59, 46, 1),
      appBar: AppBar(backgroundColor: const Color.fromRGBO(0, 59, 46, 1)),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 100),
            Text(
              _currentInput,
              style: const TextStyle(
                fontSize: 35, // Yazı tipi boyutunu ayarla
                color: Color.fromRGBO(254, 255, 213, 1), // Yazı rengini ayarla
                fontWeight: FontWeight.bold, // Yazı kalınlığını ayarla
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: _buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return ElevatedButton(
                    onPressed: () => _onPressed(_buttons[index]),
                    style: ElevatedButton.styleFrom(
                        foregroundColor: const Color.fromRGBO(0, 59, 46, 1),
                        backgroundColor: const Color.fromRGBO(
                            254, 255, 213, 1) // Butonun üzerindeki yazı rengi
                        ),
                    child: Text(
                      _buttons[index],
                      style: const TextStyle(fontSize: 26),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      ShowProblemScreen(problem: _currentInput),
                ));
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: const Color.fromRGBO(254, 255, 213, 1),
                backgroundColor: const Color.fromRGBO(152, 111, 26, 1),
                textStyle: const TextStyle(
                  fontSize: 25, // Buton metninin boyutu
                ),
              ),
              child: const Text('Probleme Dönüştür'),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
