import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/components/desktop_view_builder.dart';
import 'package:portfolio_flutter_web/components/mobile_desktop_view_builder.dart';
import 'package:portfolio_flutter_web/components/mobile_view_builder.dart';
import 'package:portfolio_flutter_web/project/project_item_body.dart';

class ProjectView extends StatelessWidget {
  const ProjectView({
    Key key,
  }) : super(key: key);
  static const title = 'Projects';
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
        SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final item in kProjectItems)
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
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
  final String description;
  final List<String> technologies;

  ProjectItem({
    @required this.image,
    @required this.title,
    @required this.description,
    @required this.technologies,
  });
}

final kProjectItems = [
  ProjectItem(
    image: 'images/bulb.png',
    title: 'LightManager',
    description:
        'With a microcontroller you can manage the lights if your home, by the wifi.',
    technologies: ['Arduino', 'Blynk'],
  ),
  ProjectItem(
    image: 'images/www.png',
    title: 'This website',
    description: 'This website is made by myself',
    technologies: ['Flutter', 'Dart', 'Firebase'],
  ),
  ProjectItem(
    image: 'images/www.png',
    title: 'This website',
    description: 'This website is made by myself',
    technologies: ['Flutter', 'Dart', 'Firebase'],
  )
];

class ProjectMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobileViewBuilder(
      titleText: ProjectView.title,
      children: [for (final item in kProjectItems) ProjectItemBody(item: item)],
    );
  }
}
