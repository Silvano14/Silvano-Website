import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/utils/colour_assets.dart';

class ExperienceContainer extends StatelessWidget {
  const ExperienceContainer({
    Key key,
    @required this.experience,
    @required this.index,
  }) : super(key: key);

  final ExperienceInfo experience;
  final int index;

  @override
  Widget build(BuildContext context) {
    final colors = ColoursAssets.all;
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(
            width: 3,
            color: colors.elementAt(index % colors.length),
          ),
          borderRadius: BorderRadius.circular(3)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            experience.company,
            style: textStyle(isBold: true),
          ),
          SizedBox(height: 10),
          Text(
            experience.timeLine,
            style: textStyle(isGrey: true),
          ),
          SizedBox(height: 10),
          for (final desc in experience.descriptions)
            Text(
              desc,
              style: textStyle(),
            ),
        ],
      ),
    );
  }
}

TextStyle textStyle({bool isBold, bool isGrey}) {
  return TextStyle(
      fontSize: 20,
      height: 1.3,
      fontWeight: isBold ?? false ? FontWeight.bold : FontWeight.normal,
      color: isGrey ?? false ? Colors.grey : Colors.black);
}

class ExperienceInfo {
  final String company;
  final String timeLine;
  final List<String> descriptions;

  ExperienceInfo({
    @required this.company,
    @required this.timeLine,
    @required this.descriptions,
  });
}

final experiences = [
  ExperienceInfo(
    company: 'Welld',
    timeLine: 'May 2019 - Now',
    descriptions: [
      '- Worked often with teams',
      '- Learned how working with Agile method',
      '- Studied new technologies as React or Electron',
    ],
  ),
  ExperienceInfo(
    company: 'Edr TOOLS',
    timeLine: 'May 2019 - Now',
    descriptions: [
      '- Estrazione dei dati da dispositivi mobili con software creati per Raspberry con l\'utilizzo di librerie in C e Python.',
      '- Creazione di script in Python per ottimizzare l’efficienza gestionale',
      '- Gestione di software proprietari tramite QTCreator e CPP per l’estrazione dei dati da hard disk meccanici. ',
    ],
  ),
  ExperienceInfo(
    company: 'ITS Kennedy',
    timeLine: '2016 - 2018',
    descriptions: [
      ' Attività e associazioni: Studio e praticità nel corso di studi I.O.T (Internet of Things)'
    ],
  ),
  ExperienceInfo(
    company: 'ITS Kennedy',
    timeLine: '2016 - 2018',
    descriptions: [
      ' Attività e associazioni: Studio e praticità nel corso di studi I.O.T (Internet of Things)'
    ],
  )
];
