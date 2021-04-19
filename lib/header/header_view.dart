import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/components/mobile_desktop_view_builder.dart';
import 'package:portfolio_flutter_web/constants.dart';
import 'package:portfolio_flutter_web/header/header_body.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
      mobileView: HeaderMobileView(),
      desktopView: HeaderDesktopView(),
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
      padding: kScreenPadding,
      height: 600,
      width: kInitWidth,
      child: Row(
        children: [
          Expanded(
            child: HeaderBody(),
          ),
          Container(
            child: Image(
              image: AssetImage('images/header_logo.png'),
              height: isSmall ? imageWidth : 500,
            ),
          ),
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
