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
      'Nel tempo trascorso nell\’azienda ho avuto occasioni di aumentare le mie conoscenze con varie tecnologie.' +
          'Tra le più utilizzate ci sono React, Electron, Typescript e Java (JEE). \n' +
          'Mi sono preoccupato di scrivere Unit Test sempre più precisi e completi, ho anche avuto occasione anche di scrivere test di tipo E2E. \n' +
          'Uso quotidiano di Git per la gestione del versionamento del software.',
    ],
  ),
  ExperienceInfo(
    company: 'Edr TOOLS',
    timeLine: 'Sep 2018 - Apr 2019',
    descriptions: [
      'Estrazione dei dati da dispositivi mobili con software creati per Raspberry con l\'utilizzo di librerie in C e Python.\n' +
          'Creazione di script in Python per ottimizzare l’efficienza gestionale.\n' +
          'Gestione di software proprietari tramite QTCreator e CPP per l’estrazione dei dati da hard disk meccanici.\n',
    ],
  ),
  ExperienceInfo(
    company: 'ITS Kennedy',
    timeLine: '2016 - 2018',
    descriptions: [
      'Attività e associazioni: Studio e praticità nel corso di studi I.O.T (Internet of Things)'
    ],
  ),
];
