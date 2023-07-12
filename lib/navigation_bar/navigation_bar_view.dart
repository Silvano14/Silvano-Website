import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_flutter_web/components/mobile_desktop_view_builder.dart';
import 'package:portfolio_flutter_web/constants.dart';
import 'package:portfolio_flutter_web/portfolio/portfolio_view.dart';
import 'package:provider/provider.dart';

class NavigationBarView extends StatelessWidget {
  final onPressed = () => print('click');
  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
        mobileView: NavigationBarMobileView(),
        desktopView: NavigationDesktopView());
  }
}

class NavigationDesktopView extends StatelessWidget {
  const NavigationDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationItem = context.watch<List<NavigationItem>>();
    final scrollController = context.watch<ScrollController>();
    return Container(
      height: 80,
      width: kInitWidth,
      padding: kScreenPadding,
      child: Row(
        children: [
          Container(
            child: Image.asset(
              'images/navbar_logo.png',
              height: 40,
            ),
          ),
          Spacer(flex: 3),
          for (var item in navigationItem)
            NavigationBarItem(
                onPressed: () {
                  scrollController.animateTo(
                    item.position,
                    duration: Duration(milliseconds: 700),
                    curve: Curves.easeInOut,
                  );
                },
                text: item.text),
        ],
      ),
    );
  }
}

class NavigationBarMobileView extends StatelessWidget {
  const NavigationBarMobileView({super.key});

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
    super.key,
    required this.onPressed,
    required this.text,
  });

  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    final isSmall = MediaQuery.of(context).size.width < 650;
    return Container(
      padding: const EdgeInsets.only(left: 64),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onTap: onPressed,
        mouseCursor: MaterialStateMouseCursor.clickable,
        child: Text(
          text,
          style: GoogleFonts.vollkorn(
            fontSize: isSmall ? 17 : 24,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
    );
  }
}
