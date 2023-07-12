import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  const DrawerMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationItem = context.watch<List<NavigationItem>>();
    final scrollController = context.watch<ScrollController>();
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Silvano Norberti',
              style: GoogleFonts.vollkorn(),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                    colors: [Colors.redAccent, Colors.yellowAccent])),
          ),
          for (var item in navigationItem)
            ListTile(
              title: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: SizedBox(
                      height: 15.0,
                      width: 15.0,
                      child: item.icon,
                    ),
                  ),
                  Text(item.text, style: GoogleFonts.vollkorn())
                ],
              ),
              onTap: () {
                Navigator.pop(context);
                scrollController.animateTo(
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
