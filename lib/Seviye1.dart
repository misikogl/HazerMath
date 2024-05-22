import 'package:flutter/material.dart';
// Rastgele problem seçmek için gerekli

class CustomMathInputScreen extends StatefulWidget {
  const CustomMathInputScreen({Key? key}) : super(key: key);

  @override
  _CustomMathInputScreenState createState() => _CustomMathInputScreenState();
}

class _CustomMathInputScreenState extends State<CustomMathInputScreen> {
  String _currentInput = '';
  bool _isOperatorAllowed = false;

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
    '/',
  ];

  final List<String> _problems = [
    'X ve Y sayılarının toplamı nedir?',
    'X sayısından Y sayısını çıkarırsak sonuç ne olur?',
    'X sayısı ile Y sayısının çarpımı kaç eder?',
    'X sayısı Y sayısına bölünürse sonuç kaç olur?'
  ];

  void _onPressed(String value) {
    setState(() {
      if (value == 'C') {
        _clearInput();
      } else if (_isOperator(value) && _isOperatorAllowed) {
        _addOperator(value);
      } else if (_isNumber(value)) {
        _addNumber(value);
      }
    });
  }

  bool _isOperator(String value) {
    return '+-*/'.contains(value);
  }

  bool _isNumber(String value) {
    return '0123456789'.contains(value);
  }

  void _clearInput() {
    _currentInput = '';
    _isOperatorAllowed = false;
  }

  void _addOperator(String operator) {
    _currentInput += operator;
    _isOperatorAllowed = false;
  }

  void _addNumber(String number) {
    _currentInput += number;
    _isOperatorAllowed = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 59, 46, 1),
      appBar: AppBar(backgroundColor: const Color.fromRGBO(0, 59, 46, 1)),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            const SizedBox(height: 70),
            _buildInputDisplay(),
            const SizedBox(height: 20),
            _buildButtonGrid(),
            const SizedBox(height: 20),
            _buildConvertButton(context),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildInputDisplay() {
    return Text(
      _currentInput,
      style: const TextStyle(
        fontSize: 40,
        color: Color.fromRGBO(254, 255, 213, 1),
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildButtonGrid() {
    return Expanded(
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
              padding: const EdgeInsets.all(4.0), // Daha küçük padding
              minimumSize: const Size(50, 50), // Daha küçük buton boyutu
              foregroundColor: const Color.fromRGBO(0, 59, 46, 1),
              backgroundColor: const Color.fromRGBO(254, 255, 213, 1),
            ),
            child: Text(
              _buttons[index],
              style:
                  const TextStyle(fontSize: 20), // Daha küçük yazı tipi boyutu
            ),
          );
        },
      ),
    );
  }

  Widget _buildConvertButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _generateRandomProblem(context);
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: const Color.fromRGBO(254, 255, 213, 1),
        backgroundColor: const Color.fromRGBO(152, 111, 26, 1),
        textStyle: const TextStyle(fontSize: 25),
      ),
      child: const Text('Probleme Dönüştür'),
    );
  }

  void _generateRandomProblem(BuildContext context) {
    if (_currentInput.contains(RegExp(r'\d+'))) {
      List<String> numbers = _currentInput
          .split(RegExp(r'\D+'))
          .where((s) => s.isNotEmpty)
          .toList();

      if (numbers.length >= 2) {
        String problemTemplate = _selectProblemBasedOnOperator();
        if (problemTemplate.isEmpty) {
          _showErrorDialog(context, 'Lütfen geçerli bir operatör kullanın.');
          return;
        }
        String problem = problemTemplate
            .replaceFirst('X', numbers[0])
            .replaceFirst('Y', numbers[1]);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              ShowProblemScreen(problem: problem, numbers: numbers),
        ));
      } else {
        _showErrorDialog(context, 'Lütfen en az iki sayı girin.');
      }
    } else {
      _showErrorDialog(context, 'Lütfen geçerli bir ifade girin.');
    }
  }

  String _selectProblemBasedOnOperator() {
    if (_currentInput.contains('+')) {
      return 'X ve Y sayılarının toplamı nedir?';
    } else if (_currentInput.contains('-')) {
      return 'X sayısından Y sayısını çıkarırsak sonuç ne olur?';
    } else if (_currentInput.contains('*')) {
      return 'X sayısı ile Y sayısının çarpımı kaç eder?';
    } else if (_currentInput.contains('/')) {
      return 'X sayısı Y sayısına bölünürse sonuç kaç olur?';
    }
    return ''; // Eğer hiçbir operatör bulunamazsa boş string döndür.
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hata'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Tamam'),
            ),
          ],
        );
      },
    );
  }
}

class ShowProblemScreen extends StatefulWidget {
  final String problem;
  final List<String> numbers;

  const ShowProblemScreen(
      {super.key, required this.problem, required this.numbers});

  @override
  _ShowProblemScreenState createState() => _ShowProblemScreenState();
}

class _ShowProblemScreenState extends State<ShowProblemScreen> {
  final TextEditingController _answerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(254, 255, 213, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(254, 255, 213, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.problem,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 24, color: Color.fromRGBO(0, 59, 46, 1)),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _answerController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Cevabınızı buraya girin',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkAnswer,
              style: ElevatedButton.styleFrom(
                foregroundColor: const Color.fromRGBO(254, 255, 213, 1),
                backgroundColor: const Color.fromRGBO(152, 111, 26, 1),
                textStyle: const TextStyle(fontSize: 25),
              ),
              child: const Text('Cevabı Gönder'),
            ),
          ],
        ),
      ),
    );
  }

  void _checkAnswer() {
    String correctAnswer = _calculateAnswer(widget.problem, widget.numbers);
    double userAnswer = double.tryParse(_answerController.text) ?? 0;
    double correctAnswerDouble = double.tryParse(correctAnswer) ?? 0;

    // Tolerans değeri olarak 0.01 kullanıyoruz
    if ((userAnswer - correctAnswerDouble).abs() < 0.01) {
      _showResultDialog(true);
    } else {
      _showResultDialog(false);
    }
  }

  String _calculateAnswer(String problem, List<String> numbers) {
    double x = double.parse(numbers[0]);
    double y = double.parse(numbers[1]);
    double result;

    if (problem.contains('toplamı')) {
      result = x + y;
    } else if (problem.contains('çıkarırsak')) {
      result = x - y;
    } else if (problem.contains('çarpımı')) {
      result = x * y;
    } else if (problem.contains('bölünürse')) {
      result = x / y;
    } else {
      result = 0;
    }

    return result.toStringAsFixed(
        2); // Cevapları iki ondalık basamakla sınırlayabilirsiniz.
  }

  void _showResultDialog(bool isCorrect) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(isCorrect ? 'Doğru Cevap!' : 'Yanlış Cevap'),
          content: Text(isCorrect
              ? 'Tebrikler, doğru cevabı buldunuz.'
              : 'Üzgünüz, yanlış cevap. Tekrar deneyin.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Tamam'),
            ),
          ],
        );
      },
    );
  }
}
