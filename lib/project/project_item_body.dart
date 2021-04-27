import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_flutter_web/project/project_view.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectItemBody extends StatefulWidget {
  const ProjectItemBody({
    Key key,
    @required this.item,
  }) : super(key: key);

  final ProjectItem item;

  @override
  _ProjectItemBodyState createState() => _ProjectItemBodyState();
}

class _ProjectItemBodyState extends State<ProjectItemBody> {
  Color textColor = Colors.black;
  TextDecoration textDecoration = TextDecoration.none;

  void _onEnter(PointerEvent details) {
    setState(() {
      textColor = Colors.blue;
      textDecoration = TextDecoration.underline;
    });
  }

  void _onExit(PointerEvent details) {
    setState(() {
      textColor = Colors.black;
      textDecoration = TextDecoration.none;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          // Used for keeping distance between text
          border: Border.all(
        color: Colors.transparent,
        width: 2,
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            widget.item.image,
            filterQuality: FilterQuality.high,
          ),
          SizedBox(height: 10),
          MouseRegion(
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
                      ..onTap = () {
                        launch(widget.item.url);
                      })),
          ),
          SizedBox(height: 10),
          Text(widget.item.description,
              style: GoogleFonts.vollkorn(fontSize: 20)),
          SizedBox(height: 10),
          Row(
            children: [
              for (final tech in widget.item.technologies)
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Chip(label: Text(tech)),
                )
            ],
          ),
          SizedBox(height: 20)
        ],
      ),
    );
  }
}
