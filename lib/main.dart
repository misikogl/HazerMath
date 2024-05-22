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
                    onPressed: () =>
                        _navigateTo(context, const CustomMathInputScreen()),
                  ),
                  const SizedBox(height: 20),
                  SeviyeButonu(
                    text: 'Seviye II',
                    onPressed: () {},
                  ),
                  const SizedBox(height: 20),
                  SeviyeButonu(
                    text: 'Seviye III',
                    onPressed: () {},
                  ),
                  const SizedBox(height: 20),
                  SeviyeButonu(
                    text: 'Seviye IV',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 5,
            right: 10,
            child: IconButton(
              icon: const Icon(Icons.settings,
                  color: Color.fromRGBO(254, 255, 213, 1)),
              onPressed: () => _navigateTo(context, const SettingspageWidget()),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateTo(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
  }
}

class SeviyeButonu extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SeviyeButonu({
    super.key,
    required this.text,
    required this.onPressed,
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
        style: GoogleFonts.pacifico(
          textStyle: const TextStyle(
            fontSize: 21,
            color: Color.fromRGBO(254, 255, 213, 1),
          ),
        ),
      ),
    );
  }
}
