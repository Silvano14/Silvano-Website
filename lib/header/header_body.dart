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
          Wrap(children: [
            Text(
              'Sono uno Sviluppatore Software, e amo il mio lavoro.\n' +
                  'Mi son sempre più avvicinato al Front End, il mondo dove esiste un framework per ogni cosa.\n' +
                  'Mi piace seguire ogni tipo di conferenza e discutere con i colleghi sul miglior modo per adempiere le attività.',
              style: GoogleFonts.vollkorn(
                  color: Colors.black, fontSize: isMobile ? 12 : 20),
              overflow: TextOverflow.ellipsis,
              maxLines: 11,
            ),
          ]),
          SizedBox(height: 20),
          TextButton(
            onPressed: () => launch('mailto:silvano.norberti@gmail.com'),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Contattami',
                style: GoogleFonts.vollkorn(
                  fontSize: isMobile ? 20 : 30,
                  color: Colors.black,
                ),
              ),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith(getColor)),
          ),
          SizedBox(height: 20)
        ]);
  }
}
