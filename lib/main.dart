import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_flutter_web/portfolio/portfolio_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Silvano Norberti',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(
            headline2: GoogleFonts.vollkorn(
              color: Colors.black,
            ),
            headline4: GoogleFonts.vollkorn(
              fontSize: 30,
              color: Colors.black,
            ),
          )),
      home: PortfolioView(),
    );
  }
}
