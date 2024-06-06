import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart';
import 'settings.dart';
import 'Seviye1.dart'; // seviye1.dart dosyasını import edin

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HarezMath',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthScreen(),
      routes: {
        '/home': (context) => const HomePage(),
        '/seviye1': (context) => CustomMathInputScreen(),
      },
    );
  }
}

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLogin = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    // Eğer kullanıcı zaten giriş yapmışsa, doğrudan HomePage'e yönlendir
    if (_auth.currentUser != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushReplacementNamed('/home');
      });
    }
  }

  void _toggleForm() {
    setState(() {
      _isLogin = !_isLogin;
      _errorMessage = '';
    });
  }

  Future<void> _register() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      setState(() {
        _errorMessage = '';
      });
      _navigateToHome();
    } catch (e) {
      setState(() {
        _errorMessage = 'Registration Error: ${e.toString()}';
      });
    }
  }

  Future<void> _login() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      setState(() {
        _errorMessage = '';
      });
      _navigateToHome();
    } catch (e) {
      setState(() {
        _errorMessage = 'Login Error: ${e.toString()}';
      });
    }
  }

  Future<void> _logout() async {
    await _auth.signOut();
    setState(() {});
  }

  void _navigateToHome() {
    Navigator.of(context).pushReplacementNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HarezMath'),
        actions: [
          if (_auth.currentUser != null)
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: _logout,
            )
        ],
      ),
      body: _buildAuthForm(),
    );
  }

  Widget _buildAuthForm() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: _passwordController,
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _isLogin ? _login : _register,
            child: Text(_isLogin ? 'Login' : 'Register'),
          ),
          TextButton(
            onPressed: _toggleForm,
            child: Text(
                _isLogin ? 'Create an account' : 'Already have an account?'),
          ),
          if (_errorMessage.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                _errorMessage,
                style: TextStyle(color: Colors.red),
              ),
            ),
        ],
      ),
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
