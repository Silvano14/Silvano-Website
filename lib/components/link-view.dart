import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkProps {
  final String title;
  final String url;

  LinkProps({
    required this.title,
    required this.url,
  });
}

class LinkView extends StatefulWidget {
  const LinkView(this.item);

  final LinkProps item;

  @override
  _LinkViewState createState() => _LinkViewState();
}

class _LinkViewState extends State<LinkView> {
  Color textColor = Colors.black;
  TextDecoration textDecoration = TextDecoration.underline;

  void _onEnter(PointerEvent details) {
    setState(() {
      textColor = Colors.blue;
      textDecoration = TextDecoration.underline;
    });
  }

  void _onExit(PointerEvent details) {
    setState(() {
      textColor = Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MouseRegion(
        onEnter: _onEnter,
        onExit: _onExit,
        cursor: SystemMouseCursors.click,
        child: RichText(
            text: TextSpan(
                text: widget.item.title,
                style: GoogleFonts.vollkorn(
                  color: textColor,
                  fontSize: 30,
                  decoration: textDecoration,
                ),
                recognizer: new TapGestureRecognizer()
                  ..onTap = () => launch(widget.item.url))),
      ),
    );
  }
}
