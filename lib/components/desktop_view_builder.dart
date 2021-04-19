import 'package:flutter/material.dart';

import 'package:portfolio_flutter_web/constants.dart';

class DesktopViewBuilder extends StatelessWidget {
  const DesktopViewBuilder({Key key, this.titleText, this.children})
      : super(key: key);

  final String titleText;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kScreenPadding,
      width: kInitWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titleText,
            style: Theme.of(context).textTheme.headline2,
          ),
          ...children,
        ],
      ),
    );
  }
}
