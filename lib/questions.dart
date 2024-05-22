import 'package:flutter/material.dart';
import 'package:math_project/Seviye1.dart';

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
