import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavigationBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, size) {
      if (size.isMobile) return NavigationBarMobileView();
      return NavigationDesktopView();
    });
  }
}

class NavigationDesktopView extends StatelessWidget {
  const NavigationDesktopView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
          color: Colors.black,
          borderRadius: new BorderRadius.only(
            bottomLeft: const Radius.circular(40.0),
            bottomRight: const Radius.circular(40.0),
          )),
      height: 100,
      width: 1507,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white), color: Colors.white),
            child: Image.asset(
              'images/navbar_logo.png',
              height: 40,
            ),
          ),
          Spacer(flex: 3),
          for (NavigationItem item in kNavigationItem)
            // Expanded(
            NavigationBarItem(onPressed: () {}, text: item.text),
          // ),
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
  NavigationItem('| About me'),
  NavigationItem('| Projects'),
  NavigationItem('| Contact me'),
];

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
        borderRadius: BorderRadius.circular(20),
        onTap: onPressed,
        mouseCursor: MaterialStateMouseCursor.clickable,
        child: AutoSizeText(
          text,
          style: TextStyle(
            fontSize: isSmall ? 17 : 24,
            color: Colors.white,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
