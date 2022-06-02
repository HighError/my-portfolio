import 'package:flutter/material.dart';
import 'package:simple_icons/simple_icons.dart';

class Project {
  final String title;
  final String description;
  final List<ProjectTag> tags;
  final List<ProjectLink> links;
  final Image? image;
  Project({
    required this.title,
    required this.description,
    required this.tags,
    this.links = const [],
    this.image,
  });
}

class ProjectLink {
  final String title;
  final String url;
  final IconData icon;
  ProjectLink({
    required this.title,
    required this.url,
    required this.icon,
  });
}

class ProjectTag {
  final String title;
  final IconData icon;
  ProjectTag({
    required this.title,
    required this.icon,
  });

  factory ProjectTag.flutter() {
    return ProjectTag(title: 'Flutter', icon: SimpleIcons.flutter);
  }

  factory ProjectTag.unity() {
    return ProjectTag(title: 'Unity 3D', icon: SimpleIcons.unity);
  }

  factory ProjectTag.gamejam() {
    return ProjectTag(title: 'GameJam', icon: SimpleIcons.iconjar);
  }

  factory ProjectTag.python() {
    return ProjectTag(title: 'Python', icon: SimpleIcons.python);
  }
}
