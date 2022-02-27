import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/components/desktop_view_builder.dart';
import 'package:portfolio_flutter_web/components/mobile_desktop_view_builder.dart';
import 'package:portfolio_flutter_web/components/mobile_view_builder.dart';
import 'package:portfolio_flutter_web/experience/experience_container.dart';
import 'package:portfolio_flutter_web/utils/colour_assets.dart';

class ExperienceView extends StatelessWidget {
  const ExperienceView({
    Key key,
  }) : super(key: key);

  static const title = 'Esperienze';
  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
      desktopView: ExperienceDesktopView(),
      mobileView: ExperienceMobileView(),
    );
  }
}

class ExperienceDesktopView extends StatelessWidget {
  final colors = ColoursAssets.all;
  @override
  Widget build(BuildContext context) {
    return DesktopViewBuilder(
      titleText: ExperienceView.title,
      children: [
        SizedBox(height: 20),
        for (var j = 0; j < experiences.length; j++)
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8, bottom: 88),
                      child: ExperienceContainer(
                          experience: experiences.elementAt(j), index: j),
                    )
                  ],
                ),
              ),
            ],
          ),
      ],
    );
  }
}

class ExperienceMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobileViewBuilder(
      titleText: ExperienceView.title,
      children: [
        Column(children: [
          for (final experience in experiences)
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: ExperienceContainer(
                  experience: experience,
                  index: experiences.indexOf(experience)),
            )
        ])
      ],
    );
  }
}
