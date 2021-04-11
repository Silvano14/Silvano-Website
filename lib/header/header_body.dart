import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class HeaderBody extends StatelessWidget {
  final bool isMobile;
  const HeaderBody({
    Key key,
    this.isMobile = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          "Hi! I'm Silvano Norberti",
          style: Theme.of(context).textTheme.headline2,
          maxLines: 2,
        ),
        AutoSizeText(
          'I\'m a software developer and i have a huge passion about my work',
          style: Theme.of(context).textTheme.headline4,
          maxLines: 2,
        ),
      ],
    );
  }
}
