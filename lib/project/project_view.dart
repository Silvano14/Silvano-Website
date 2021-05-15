import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/components/desktop_view_builder.dart';
import 'package:portfolio_flutter_web/components/mobile_desktop_view_builder.dart';
import 'package:portfolio_flutter_web/components/mobile_view_builder.dart';
import 'package:portfolio_flutter_web/project/project_item_body.dart';

class ProjectView extends StatelessWidget {
  const ProjectView({
    Key key,
  }) : super(key: key);
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
  final String description;
  final List<String> technologies;

  ProjectItem({
    @required this.image,
    @required this.title,
    @required this.url,
    @required this.description,
    @required this.technologies,
  });
}

final kProjectItems = [
  ProjectItem(
    image: 'images/bulb.png',
    title: 'LightManager',
    url: 'https://github.com/Silvano14/LightManager',
    description: 'Un progetto semplice con l\'uso di Arduino e Blynk ;)\n' +
        'Utilizzando il progetto sarai in grado di gestire le luci\nnella tua stanza tramite un qualsiasi smartphone',
    technologies: ['Arduino', 'Blynk'],
  ),
  ProjectItem(
    image: 'images/website.png',
    title: 'Questo!',
    url: 'https://github.com/Silvano14/myWebPage',
    description:
        'Questo sito è fatto da me, la voglia di imparare Flutter e Dart mi ha spinto a costruire un mio portfolio.',
    technologies: ['Flutter', 'Dart', 'Firebase'],
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
