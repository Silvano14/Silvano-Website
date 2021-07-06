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
      width: kInitWidth,
      child: Row(
        children: [
          HeaderBody(
            isMobile: false,
          ),
          Spacer(),
          Container(
            child: Image(
              image: AssetImage('images/header_logo.png'),
              height: isSmall ? imageWidth : 400,
              filterQuality: FilterQuality.high,
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
    return Container(
      width: width,
      child: Column(
        children: [
          Image.asset(
            'images/header_logo.png',
            width: 200,
          ),
          HeaderBody(
            isMobile: true,
          )
        ],
      ),
    );
  }
}
