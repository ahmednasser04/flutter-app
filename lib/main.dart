import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:health_care_project/modules/loginscreen/loginscreen.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return Directionality(textDirection: TextDirection.rtl, child: child!);
      },
      theme: ThemeData(fontFamily: 'SF Arabic'),
      supportedLocales: [Locale('ar', 'EG'), Locale('en', 'US')],
      locale: const Locale('ar', 'EG'),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      debugShowCheckedModeBanner: false,
      home: Loginscreen(),
    );
  }
}
