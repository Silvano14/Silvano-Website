import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio_flutter_web/utils/hover_extensions.dart';

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
        AutoSizeText(
          "Benvenuto! Sono Silvano Norberti",
          style: Theme.of(context).textTheme.headline2,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 20),
        AutoSizeText(
          'Sono uno Sviluppatore Software, e amo il mio lavoro.\n' +
              'Mi son sempre più avvicinato al Front End, il mondo dove esiste un framework per ogni cosa.\n' +
              'Mi piace seguire ogni tipo di conferenza e discutere con i colleghi sul miglior modo per adempiere le attività.',
          style: Theme.of(context).textTheme.headline4,
          overflow: TextOverflow.ellipsis,
          maxLines: isMobile ?? false ? 8 : 5,
        ),
        SizedBox(height: 20),
        TextButton(
          onPressed: () => launch('mailto:silvano.norberti@gmail.com'),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Contattami',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith(getColor)),
        ).moveUpOnHover
      ],
    );
  }
}
