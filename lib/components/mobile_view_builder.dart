import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MobileViewBuilder extends StatelessWidget {
  final List<Widget> children;
  final String titleText;

  const MobileViewBuilder({Key key, this.titleText, this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Divider(thickness: 5),
          SizedBox(height: 20),
          AutoSizeText(
            titleText,
            style: Theme.of(context).textTheme.headline2,
            maxLines: 1,
          ),
          SizedBox(height: 20),
          ...children
        ],
      ),
    );
  }
}
