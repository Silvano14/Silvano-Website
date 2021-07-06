import 'package:auto_size_text/auto_size_text.dart';
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
            AutoSizeText(
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

// I didn't use multi-line because it cause a weird render of the description.
final experiences = [
  ExperienceInfo(
    company: 'Welld',
    timeLine: 'May 2019 - Now',
    descriptions: [
      "Nel tempo trascorso nell’azienda ho avuto occasioni di aumentare le mie " +
          "conoscenze in varie tecnologie. Tra le più utilizzate ci sono React, " +
          "Typescript e Java (JEE). Oltre agli sviluppi sia lato BackEnd che FrontEnd " +
          "ho avuto occasione di sviluppare immagini Docker per la distribuzione degli " +
          "applicativi, per facilitare l’utilizzo delle applicazioni esistenti a chi " +
          "non avesse un ambiente pronto da utilizzare e per attuare test di integrazione. " +
          "Intensivo uso di Electron insieme a React e Redux, tutto scritto in Typescript. " +
          "Utilizzo di TSDX per la compilazione e la distribuzione della nostra libreria agli applicativi associati. " +
          "Scritto test di integrazione tramite Cypress. " +
          "Continua scrittura di test unitari per ogni parte di codice aggiunta o già esistente. Utilizzando sia Jest sia Junit. " +
          "Quotidiano utilizzo di Git"
    ],
  ),
  ExperienceInfo(
    company: 'Edr TOOLS',
    timeLine: 'Sep 2018 - Apr 2019',
    descriptions: [
      'Estrazione dei dati da dispositivi mobili con software creati per Raspberry con l\'utilizzo di librerie in C e Python. ' +
          'Creazione di script in Python per ottimizzare l’efficienza gestionale. ' +
          'Gestione di software proprietari tramite QTCreator e CPP per l’estrazione dei dati da hard disk meccanici. ',
    ],
  ),
  ExperienceInfo(
    company: 'ITS Kennedy',
    timeLine: '2016 - 2018',
    descriptions: [
      'Attività e associazioni: Studio e praticità nel corso di studi I.O.T (Internet of Things) \n' +
          "Nel percorso di studi c’era la possibilità di seguire varie tipologie di corsi. " +
          "Il corso del IOT permetteva un approfondimento nel mondo del Networking e una maggiore" +
          "focalizzazione sulla scrittura di codice nei micro controlli con il linguaggio C. " +
          "Durante il corso abbiamo usato un PIC32, insieme ai micro controlli abbiamo lavorato" +
          "varie volte in team per poter sfruttare le conoscenze che acquisivamo nel corso del tempo," +
          "oltre ad attuare un rafforzamento in senso di lavoro in team."
    ],
  ),
];
