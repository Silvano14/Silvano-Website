import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_flutter_web/constants.dart';
import 'package:portfolio_flutter_web/drawer/drawer_view.dart';
import 'package:portfolio_flutter_web/experience/experience_view.dart';
import 'package:portfolio_flutter_web/footer/footer_view.dart';
import 'package:portfolio_flutter_web/header/header_view.dart';
import 'package:portfolio_flutter_web/navigation_bar/navigation_bar_view.dart';
import 'package:portfolio_flutter_web/portfolio/backToTopButton.dart';
import 'package:portfolio_flutter_web/project/project_view.dart';
import 'package:portfolio_flutter_web/skills/skills_view.dart';
import 'package:provider/provider.dart';

class PortfolioView extends StatefulWidget {
  const PortfolioView({super.key});

  @override
  _PortfolioViewState createState() => _PortfolioViewState();
}

class _PortfolioViewState extends State<PortfolioView> with AfterLayoutMixin {
  final projectKey = GlobalKey();
  final skillsKey = GlobalKey();
  final experienceKey = GlobalKey();
  List<NavigationItem> navigationItems = [];

  final ScrollController scrollController = ScrollController(
    initialScrollOffset: 0,
  );
  @override
  void afterFirstLayout(BuildContext context) {
    setState(() {
      navigationItems = [
        NavigationItem(
          'Progetti',
          FaIcon(FontAwesomeIcons.projectDiagram),
          key: projectKey,
        ),
        NavigationItem(
          'Abilità',
          FaIcon(FontAwesomeIcons.running),
          key: skillsKey,
        ),
        NavigationItem(
          'Esperienza',
          FaIcon(FontAwesomeIcons.gitlab),
          key: experienceKey,
        ),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return MultiProvider(
      providers: [
        ProxyProvider0<List<NavigationItem>>(
            update: (_, __) => navigationItems),
        ChangeNotifierProvider<ScrollController>(
            create: (_) => scrollController)
      ],
      child: Scaffold(
        endDrawer: DrawerView(),
        body: SizedBox(
          width: width,
          child: SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: kScreenPadding,
              child: Column(
                children: [
                  NavigationBarView(),
                  HeaderView(),
                  ProjectView(key: projectKey),
                  SkillsView(key: skillsKey),
                  ExperienceView(key: experienceKey),
                  FooterView(),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: BackToTopButton(),
      ),
    );
  }
}

class NavigationItem {
  NavigationItem(this.text, this.icon, {required this.key});
  final String text;
  final GlobalKey key;
  final FaIcon icon;

  double get position => _getPosition(key);
}

_getPosition(GlobalKey key) {
  // final RenderBox renderBox = key.currentContext.findRenderObject();
  // final position = renderBox.localToGlobal(Offset.zero);
  // final scrollOffset = position.dy;
  // return scrollOffset;
}
