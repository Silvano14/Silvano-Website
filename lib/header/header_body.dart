import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HeaderBody extends StatelessWidget {
  final bool isMobile;
  const HeaderBody({
    super.key,
    this.isMobile = true,
  });

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
          SizedBox(height: 40),
          Container(
            width: MediaQuery.of(context).size.width * (isMobile ? 1 : 0.5),
            child: AutoSizeText(
              "Benvenuta/o nel portfolio di Silvano Norberti",
              style: GoogleFonts.vollkorn(
                  color: Colors.black, fontSize: isMobile ? 30 : 40),
              maxLines: isMobile ? 3 : 1,
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width * (isMobile ? 1 : 0.6),
            height: isMobile ? 350 : 270,
            child: AutoSizeText(
              'Se hai raggiunto questo sito, vuol dire che sei davvero interessata/o a conoscere che tipo di persona sono, e per questo già ti ringrazio!\n'
              'Bando ai convenevoli, io sono una persona con una infinita passione per il proprio lavoro.\n'
              'Io sono un FrontEnd developer, colui che deve rendere l\'applicazione una esperienza di piacere e, soprattutto, semplicità per l\'utente finale, utilizzando tantissimo design e '
              'una immensa quantità di problem solving.\n'
              'L\'utente finale, in questo mestiere in particolare, è molto propenso a fare richieste al limite dell\'assurdo, ma si deve essere pronti anche a dare il giusto compromesso e non farsi abbattere.',
              style: GoogleFonts.vollkorn(color: Colors.black, fontSize: 22),
              overflow: TextOverflow.ellipsis,
              maxLines: 15,
            ),
          ),
          SizedBox(height: 40),
          TextButton(
            onPressed: () =>
                launchUrlString('mailto:silvano.norberti@gmail.com'),
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
          SizedBox(height: 40),
        ]);
  }
}
