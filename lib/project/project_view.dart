import 'package:flutter/material.dart';
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
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: kInitWidth,
      height: 864,
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
          )
        ],
      ),
    );
  }
}

class PorjectItemBody extends StatelessWidget {
  const PorjectItemBody({
    Key key,
    @required this.item,
  }) : super(key: key);

  final ProjectItem item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          item.image,
        ),
        SizedBox(height: 15),
        Text(item.title, style: Theme.of(context).textTheme.headline4),
        SizedBox(height: 10),
        Text(item.description, style: TextStyle(fontSize: 17)),
        SizedBox(height: 10),
        Row(
          children: [
            for (final tech in item.technologies)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Chip(label: Text(tech)),
              )
          ],
        ),
        SizedBox(height: 50)
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: kInitWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          Divider(thickness: 3),
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
