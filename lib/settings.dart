import 'package:flutter/material.dart';
import 'package:math_project/main.dart';

class SettingspageWidget extends StatefulWidget {
  const SettingspageWidget({super.key});

  @override
  SettingspageWidgetState createState() => SettingspageWidgetState();
}

class SettingspageWidgetState extends State<SettingspageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color.fromARGB(56, 152, 4, 4),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Opacity(
                opacity: 0.3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/HMath.png',
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 1,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(-1.00, -1.00),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(7, 7, 0, 15),
                        child: IconButton(
                          icon: const Icon(
                            Icons.chevron_left_outlined,
                            color: Color.fromRGBO(254, 255, 213,
                                1), // Change to your desired color
                            size: 40,
                          ),
                          onPressed: () async {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ));
                          },
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: 0.5,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16, 42, 16, 10),
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(254, 255, 213,
                                1), // Change to your desired color
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.account_circle_outlined,
                                  color: Colors
                                      .black, // Change to your desired color
                                  size: 25,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 0, 0),
                                  child: Text(
                                    "Profil'i Düzenle", // Replace with your text
                                    style: TextStyle(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 16,
                                      color: Colors
                                          .black, // Change to your desired color
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(0.90, 0.00),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors
                                          .black, // Change to your desired color
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: 0.5,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16, 12, 16, 10),
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(254, 255, 213,
                                1), // Change to your desired color
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.notifications_none,
                                  color: Colors
                                      .black, // Change to your desired color
                                  size: 24,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 0, 0),
                                  child: Text(
                                    'Bildirimler', // Replace with your text
                                    style: TextStyle(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 16,
                                      color: Colors
                                          .black, // Change to your desired color
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(0.90, 0.00),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors
                                          .black, // Change to your desired color
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: 0.5,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16, 20, 16, 10),
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(254, 255, 213,
                                1), // Change to your desired color
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.help_outline_rounded,
                                  color: Colors
                                      .black, // Change to your desired color
                                  size: 24,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 0, 0),
                                  child: Text(
                                    'Yardım & Destek', // Replace with your text
                                    style: TextStyle(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 16,
                                      color: Colors
                                          .black, // Change to your desired color
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(0.90, 0.00),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors
                                          .black, // Change to your desired color
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: Opacity(
                        opacity: 0.5,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16, 12, 16, 0),
                          child: Container(
                            width: double.infinity,
                            height: 60,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(254, 255, 213,
                                  1), // Change to your desired color
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12, 12, 12, 12),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.logout,
                                    color: Colors
                                        .black, // Change to your desired color
                                    size: 24,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 0, 0, 0),
                                    child: Text(
                                      'Çıkış Yap', // Replace with your text
                                      style: TextStyle(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 16,
                                        color: Colors
                                            .black, // Change to your desired color
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(0.90, 0.00),
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors
                                            .black, // Change to your desired color
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
