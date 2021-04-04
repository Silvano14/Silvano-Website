import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/header/header_body.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (_, size) {
        if (size.isMobile) return HeaderMobileView();
        return HeaderDesktopView();
      },
    );
  }
}

class HeaderDesktopView extends StatelessWidget {
  const HeaderDesktopView({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isSmall = width < 950;
    final imageWidth = width * 0.47;
    return Container(
      height: 600,
      width: 1507,
      child: Row(
        children: [
          Expanded(
            child: HeaderBody(),
          ),
          Image.asset(
            'images/header_logo.png',
            height: isSmall ? imageWidth : 500,
          )
        ],
      ),
    );
  }
}

class HeaderMobileView extends StatelessWidget {
  const HeaderMobileView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: height * 0.9,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        children: [
          Expanded(
              child: Image.asset(
            'images/header_logo.png',
          )),
          HeaderBody(
            isMobile: true,
          )
        ],
      ),
    );
  }
}
