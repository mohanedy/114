import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quran_count/screens/loading_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', 'SA'),
      ],
      title: '114',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(
          0xFF0A0E21,
        ),
        cardColor: Color(0xFF1d1e33),
        scaffoldBackgroundColor: Color(
          0xFF0A0E21,
        ),
        accentColor: Color(
          0xFFEA1556,
        ),
      ),
      home: LoadingScreen(),
    );
  }
}
