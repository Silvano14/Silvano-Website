import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_flutter_web/components/desktop_view_builder.dart';
import 'package:portfolio_flutter_web/components/mobile_desktop_view_builder.dart';
import 'package:portfolio_flutter_web/components/mobile_view_builder.dart';
import 'package:portfolio_flutter_web/project/project_item_body.dart';

class ProjectView extends StatelessWidget {
  const ProjectView({super.key});

  static const title = 'Progetti';

  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
      mobileView: ProjectMobileView(),
      desktopView: ProjectDesktopView(),
    );
  }
}

class ProjectDesktopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DesktopViewBuilder(
      titleText: ProjectView.title,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final item in kProjectItems)
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: ProjectItemBody(item: item),
              ))
          ],
        ),
        SizedBox(height: 70)
      ],
    );
  }
}

class ProjectItem {
  final String image;
  final String title;
  final String url;
  final AutoSizeText description;
  final List<String> technologies;

  ProjectItem({
    required this.image,
    required this.title,
    required this.url,
    required this.description,
    required this.technologies,
  });
}

final relativePathImages = 'images/projects';
final github = 'https://github.com/Silvano14';

final kProjectItems = [
  ProjectItem(
    image: '$relativePathImages/bulb.png',
    title: 'LightManager',
    url: '$github/LightManager',
    description: AutoSizeText(
      'Un progetto semplice con l\'uso di Arduino e Blynk ;)\n'
      'Utilizzando il progetto sarai in grado di gestire le luci\nnella tua stanza tramite un qualsiasi smartphone',
      style: GoogleFonts.vollkorn(),
      maxLines: 5,
    ),
    technologies: ['Arduino', 'Blynk'],
  ),
  ProjectItem(
    image: '$relativePathImages/silvano-website.png',
    title: 'silvano14.github.io',
    url: '$github/Silvano-Website',
    description: AutoSizeText(
      'Questo sito è fatto da me, la voglia di imparare Flutter e Dart mi ha spinto a costruire un mio portfolio.',
      style: GoogleFonts.vollkorn(),
      maxLines: 5,
    ),
    technologies: ['Flutter', 'GitHub Pages'],
  ),
  ProjectItem(
    image: '$relativePathImages/car-composer.png',
    title: 'Car composer',
    url: '$github/CarComposer',
    description: AutoSizeText(
      'Car composer è stato tra i primi progetti che mi sono stati richiesti ai colloqui, allora ero molto appassionato di redux e typescript e '
      'li ho utilizzati in questo progetto per poter impararli al meglio. Ad oggi cambierei molte scelte fatte per questo progetto, introdurrei sicuramente React router, toglierei redux e userei il context.'
      'Si spera che verrà fatto un giorno!',
      style: GoogleFonts.vollkorn(),
      maxLines: 7,
    ),
    technologies: ['Typescript', 'React', 'Redux'],
  ),
  ProjectItem(
    image: '$relativePathImages/cubbit-vault.png',
    title: 'Cubbit Vault',
    url: '$github/Cubbit-Vault',
    description: AutoSizeText(
      "Cubbit vault è un server standalone che permette di salvare file criptandoli generando una chiave univoca che l'utente potrà utilizzare per recuperare il documento "
      "e descriptarlo. E' possibile lanciare il progetto tramite i file bat/sh presenti nella root, essi incapsulano l'intero progetto all'interno di una immagine docker.",
      style: GoogleFonts.vollkorn(),
      maxLines: 6,
    ),
    technologies: [
      'React',
      'Typescript',
      'Redux',
      'Docker',
      'MongoDB',
      'Fastify'
    ],
  ),
];

class ProjectMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobileViewBuilder(
      titleText: ProjectView.title,
      children: [
        for (final item in kProjectItems)
          ProjectItemBody(item: item, isMobile: true)
      ],
    );
  }
}
