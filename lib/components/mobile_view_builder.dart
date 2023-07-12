import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/components/divider.dart';

class MobileViewBuilder extends StatelessWidget {
  final List<Widget> children;
  final String titleText;

  const MobileViewBuilder(
      {super.key, required this.titleText, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          CustomDivider(),
          SizedBox(height: 20),
          FittedBox(
            child: Text(
              titleText,
              style: Theme.of(context).textTheme.displayMedium,
              maxLines: 1,
            ),
          ),
          SizedBox(height: 20),
          ...children
        ],
      ),
    );
  }
}
