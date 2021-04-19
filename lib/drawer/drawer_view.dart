import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/components/mobile_desktop_view_builder.dart';
import 'package:portfolio_flutter_web/portfolio/portfolio_view.dart';
import 'package:provider/provider.dart';

class DrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
      mobileView: DrawerMobileView(),
      desktopView: SizedBox(),
    );
  }
}

class DrawerMobileView extends StatelessWidget {
  const DrawerMobileView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationItem = context.watch<List<NavigationItem>>();
    final scrollController = context.watch<ScrollController>();
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Silvano Norberti'),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.white, Colors.blue])),
          ),
          for (var item in navigationItem)
            ListTile(
              title: Text(item.text),
              onTap: () {
                return scrollController.animateTo(
                  item.position,
                  duration: Duration(milliseconds: 700),
                  curve: Curves.easeInOut,
                );
              },
            ),
        ],
      ),
    );
  }
}
