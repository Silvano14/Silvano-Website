import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavigationBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, size) {
      if (size.isMobile) {
        return NavigationBarMobileView();
      }
      return Container(
        height: 100,
        width: 1507,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Image.asset(
              'images/navbar_logo.png',
              height: 30,
            ),
            Spacer(),
            for (NavigationItem item in kNavigationItem)
              NavigationBarItem(onPressed: () {}, text: item.text),
          ],
        ),
      );
    });
  }
}

class NavigationBarMobileView extends StatelessWidget {
  const NavigationBarMobileView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Image.asset(
            'images/navbar_logo.png',
            height: 24,
          ),
          Spacer(),
          IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openEndDrawer())
        ],
      ),
    );
  }
}

class NavigationItem {
  NavigationItem(this.text);
  final String text;
}

final kNavigationItem = [
  NavigationItem('About Me'),
  NavigationItem('Projects'),
  NavigationItem('Contact me'),
];

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    Key key,
    @required this.onPressed,
    @required this.text,
  }) : super(key: key);

  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    final isSmall = MediaQuery.of(context).size.width < 650;
    return Container(
      padding: const EdgeInsets.only(left: 64),
      child: InkWell(
        onTap: onPressed,
        mouseCursor: MaterialStateMouseCursor.clickable,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Text(
          text,
          style: TextStyle(fontSize: isSmall ? 17 : 24),
        ),
      ),
    );
  }
}
