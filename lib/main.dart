import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'settings.dart';
import 'Seviye1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'HarezMath',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 59, 46, 1),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 80),
                  Text(
                    'HarezMath',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.pacifico(
                      textStyle: const TextStyle(
                        fontSize: 51,
                        color: Color.fromRGBO(254, 255, 213, 1),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/HMath.png',
                    height: 250,
                    width: 250,
                  ),
                  const SizedBox(height: 10),
                  SeviyeButonu(
                    text: 'Seviye I',
                    onPressed: () async {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CustomMathInputScreen(),
                      ));
                    },
                    textStyle: GoogleFonts.pacifico(),
                  ),
                  const SizedBox(height: 20),
                  SeviyeButonu(
                    text: 'Seviye II',
                    onPressed: () {},
                    textStyle: GoogleFonts.pacifico(),
                  ),
                  const SizedBox(height: 20),
                  SeviyeButonu(
                    text: 'Seviye III',
                    onPressed: () {},
                    textStyle: GoogleFonts.pacifico(),
                  ),
                  const SizedBox(height: 20),
                  SeviyeButonu(
                    text: 'Seviye IV',
                    onPressed: () {},
                    textStyle: GoogleFonts.pacifico(),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top +
                5, // Durum çubuğunun hemen altı
            right: 10,
            child: IconButton(
              icon: const Icon(Icons.settings,
                  color: Color.fromRGBO(254, 255, 213, 1)),
              onPressed: () async {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SettingspageWidget(),
                ));
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SeviyeButonu extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final TextStyle textStyle;

  const SeviyeButonu({
    super.key,
    required this.text,
    required this.onPressed,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: const Color.fromRGBO(152, 111, 26, 1),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: textStyle.copyWith(
            fontSize: 21, color: const Color.fromRGBO(254, 255, 213, 1)),
      ),
    );
  }
}
