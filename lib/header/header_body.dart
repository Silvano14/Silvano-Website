import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio_flutter_web/utils/hover_extensions.dart';

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
        SizedBox(height: 20),
        TextButton(
          onPressed: () => launch('mailto:silvano.norberti@gmail.com'),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Contact me',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
            Colors.redAccent,
          )),
        ).moveUpOnHover
      ],
    );
  }
}
