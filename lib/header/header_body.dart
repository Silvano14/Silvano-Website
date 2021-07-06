import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class HeaderBody extends StatelessWidget {
  final bool isMobile;
  const HeaderBody({
    Key key,
    this.isMobile = true,
  }) : super(key: key);

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.redAccent;
    }
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Ciao! Sono Silvano Norberti",
            style: GoogleFonts.vollkorn(
                color: Colors.black, fontSize: isMobile ? 30 : 40),
            maxLines: 2,
          ),
          SizedBox(height: 20),
          AutoSizeText(
            "Sono una persona che ha una grande passione per il suo lavoro, \n" +
                "oltre agli studi fatti per identificarmi come un FrontEnd developer \n" +
                "ho anche una grande curiosità per il mondo dei microcontrollori e per l'IOT in generale, \n" +
                "nel tempo libero mi piace seguire corsi e cercare di automatizzare certi componenti presenti in casa. \n" +
                "Di solito uso Arduino e Raspberry a seconda delle esigenze che comporta il progetto.",
            style: GoogleFonts.vollkorn(color: Colors.black, fontSize: 20),
            overflow: TextOverflow.ellipsis,
            maxLines: 12,
          ),
          SizedBox(height: 20),
          TextButton(
            onPressed: () => launch('mailto:silvano.norberti@gmail.com'),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Contattami',
                style: GoogleFonts.vollkorn(
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith(getColor)),
          ),
        ]);
  }
}
