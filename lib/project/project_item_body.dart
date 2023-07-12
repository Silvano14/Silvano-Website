import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/components/link-view.dart';
import 'package:portfolio_flutter_web/project/project_view.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectItemBody extends StatefulWidget {
  const ProjectItemBody({
    super.key,
    required this.item,
    this.isMobile,
  });

  final ProjectItem item;
  final bool? isMobile;
  @override
  _ProjectItemBodyState createState() => _ProjectItemBodyState();
}

class _ProjectItemBodyState extends State<ProjectItemBody> {
  Color textColor = Colors.black;
  TextDecoration textDecoration = TextDecoration.none;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          // Used to keep the distance between texts
          border: Border.all(
        color: Colors.transparent,
        width: 2,
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => launchUrl(Uri.parse(widget.item.url)),
            child: Image.asset(
              widget.item.image,
              height: 162,
            ),
          ),
          SizedBox(height: 10),
          LinkView(LinkProps(title: widget.item.title, url: widget.item.url)),
          SizedBox(height: 10),
          widget.item.description,
          SizedBox(height: 10),
          Wrap(
            children: [
              for (final tech in widget.item.technologies)
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
                  child: Chip(
                      label: Text(
                    tech,
                    overflow: TextOverflow.ellipsis,
                  )),
                )
            ],
          ),
          SizedBox(height: 20)
        ],
      ),
    );
  }
}
