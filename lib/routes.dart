import 'package:flutter/material.dart';
import 'package:higherror_portfolio/main.dart';
import 'package:higherror_portfolio/screens/error404_screen/error404_screen.dart';
import 'package:higherror_portfolio/screens/home_screen/home_screen.dart';
import 'package:higherror_portfolio/screens/projects_screen/projects_screen.dart';
import 'package:page_transition/page_transition.dart';

abstract class Routes {
  static const homeRoute = "/";
  static const projectsRoute = "/projects";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    const pageTransitionType = PageTransitionType.fade;
    switch (settings.name) {
      case Routes.homeRoute:
        return PageTransition(
            child: const MainScreen(child: HomeScreen()),
            type: pageTransitionType,
            settings: settings);
      case Routes.projectsRoute:
        return PageTransition(
            child: const MainScreen(child: ProjectsScreen()),
            type: pageTransitionType,
            settings: settings);
      default:
        return PageTransition(
            child: const MainScreen(child: Error404Screen()),
            type: pageTransitionType,
            settings: settings);
    }
  }
}
