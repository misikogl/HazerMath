import 'package:flutter/material.dart';

class ShowProblemScreen extends StatefulWidget {
  final String problem;
  const ShowProblemScreen({super.key, required this.problem});

  @override
  _ShowProblemScreenState createState() => _ShowProblemScreenState();
}

class _ShowProblemScreenState extends State<ShowProblemScreen> {
  final TextEditingController _answerController = TextEditingController();
  final int _correctAnswer = 41; // Örnek bir doğru cevap

  void _checkAnswer() {
    if (_answerController.text == _correctAnswer.toString()) {
      // Doğru cevap
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Doğru Cevap!'),
            content: const Text('Tebrikler, doğru cevabı buldunuz.'),
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
    } else {
      // Yanlış cevap
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Yanlış Cevap'),
            content: const Text('Üzgünüz, yanlış cevap. Tekrar deneyin.'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(254, 255, 213, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(254, 255, 213, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(
                    // Bu stil tüm TextSpan'lar için varsayılan stil olacak
                    fontSize: 18,
                    fontFamily: 'Comic Neue',
                    color: Colors.blueGrey,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Bilgi: ',
                      style: TextStyle(
                        fontWeight: FontWeight
                            .bold, // Sadece 'Bilgi:' kısmını kalın yapar
                      ),
                    ),
                    TextSpan(
                      text:
                          'NaCl, Kimyasal formülüne sahip olan sodyum klorürdür. Günlük kullanımda ise tuz olarak bilinir. Sakkaroz, Kimyasal formülü C12H22O11 olan, genellikle sofra şekeri olarak kullanılan bir karbonhidrattır.',
                      style: TextStyle(
                        fontStyle:
                            FontStyle.italic, // Geri kalan metni eğik yapar
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              const Text(
                'Bir deney için 13 gram tuz (NaCl) ve 28 gram şeker (sakkaroz) kullanılacak. Bu maddeler birleştirilerek toplam kaç gram karışım elde edilecektir?',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 23,
                    fontFamily: 'Comic Neue',
                    color: Color.fromRGBO(0, 59, 46, 1)),
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
                  foregroundColor: Color.fromRGBO(254, 255, 213, 1),
                  backgroundColor: const Color.fromRGBO(0, 59, 46, 1),
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 24.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  textStyle:
                      const TextStyle(fontSize: 18, fontFamily: 'Comic Neue'),
                ),
                child: const Text('Cevabı Gönder'),
              ),
              const SizedBox(height: 110),
            ],
          ),
        ),
      ),
    );
  }
}
