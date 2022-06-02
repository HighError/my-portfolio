import 'package:flutter/material.dart';
import 'package:higherror_portfolio/modules/project.dart';
import 'dart:html' as html;

class ProjectLinkButtonWidget extends StatelessWidget {
  final ProjectLink link;
  const ProjectLinkButtonWidget({Key? key, required this.link})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        html.window.open(link.url, '_blank');
      },
      icon: Icon(link.icon, size: 15),
      label: Text(link.title),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
      ),
    );
  }
}
