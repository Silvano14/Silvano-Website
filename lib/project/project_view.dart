import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/project/project_item_body.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:portfolio_flutter_web/constants.dart';

class ProjectView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (_, size) {
      if (size.isMobile) return ProjectMobileView();
      return ProjectDesktopView();
    });
  }
}

class ProjectDesktopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kScreenPadding,
      width: kInitWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Projects',
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final item in kProjectItems)
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PorjectItemBody(item: item),
                ))
            ],
          ),
          SizedBox(height: 70)
        ],
      ),
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
    return Container(
      padding: kScreenPadding,
      width: kInitWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(thickness: 3),
          SizedBox(height: 20),
          Text(
            'Projects',
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(height: 20),
          for (final item in kProjectItems) PorjectItemBody(item: item)
        ],
      ),
    );
  }
}
