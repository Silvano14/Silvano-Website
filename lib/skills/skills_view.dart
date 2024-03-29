import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/components/desktop_view_builder.dart';
import 'package:portfolio_flutter_web/components/mobile_desktop_view_builder.dart';
import 'package:portfolio_flutter_web/components/mobile_view_builder.dart';
import 'package:portfolio_flutter_web/skills/outline_skills_container.dart';

class SkillsView extends StatelessWidget {
  const SkillsView({super.key});

  static const title = 'Abilità';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return MobileDesktopViewBuilder(
      showMobile: width < 810,
      mobileView: SkillsMobileView(),
      desktopView: SkillsDesktopView(),
    );
  }
}

class SkillsDesktopView extends StatelessWidget {
  const SkillsDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return DesktopViewBuilder(
      titleText: SkillsView.title,
      children: [
        SizedBox(height: 20),
        for (var rowIndex = 0; rowIndex < skills.length / 4; rowIndex++) ...[
          Row(children: [
            for (var index = 0; index < skills.length / 2; index++)
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: index != 0 ? 8.0 : 0),
                  child:
                      OutlineSkillsContainer(index: index, rowIndex: rowIndex),
                ),
              ),
          ]),
          SizedBox(height: 10)
        ],
        SizedBox(height: 70)
      ],
    );
  }
}

class SkillsMobileView extends StatelessWidget {
  const SkillsMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return MobileViewBuilder(
      titleText: SkillsView.title,
      children: [
        for (var index = 0; index < skills.length; index++) ...[
          OutlineSkillsContainer(
            index: index,
            isMobile: true,
          ),
          SizedBox(height: 10)
        ],
      ],
    );
  }
}

final skills = [
  'Flutter',
  'Agile',
  'HTML/CSS',
  'React',
  'Electron',
  'Typescript',
  'Scrum',
  'Redux',
];
