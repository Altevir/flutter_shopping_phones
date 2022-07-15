import 'package:flutter/material.dart';

import 'package:flutter_shopping_phones/views/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeDefault(),
      home: const HomePage(),
    );
  }
}

ThemeData themeDefault() {
  var baseTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  return baseTheme.copyWith(
    textTheme: GoogleFonts.redHatDisplayTextTheme(baseTheme.textTheme),
  );
}
