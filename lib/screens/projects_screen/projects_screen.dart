import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:higherror_portfolio/modules/data.dart';
import 'package:higherror_portfolio/modules/project.dart';
import 'package:higherror_portfolio/widgets/project_widget/project_widget.dart';
import 'package:higherror_portfolio/widgets/title_widget/title_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: ((context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
          return const _ProjectScreen(column: 2);
        }
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return const _ProjectScreen(column: 1);
        }
        return const _ProjectScreen(column: 3);
      }),
    );
  }
}

class _ProjectScreen extends StatelessWidget {
  final int column;
  const _ProjectScreen({Key? key, required this.column}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleWidget(title: 'My Projects'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: AlignedGridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: column,
            itemCount: Data.projects.length,
            mainAxisSpacing: 25,
            crossAxisSpacing: 25,
            itemBuilder: (context, index) {
              return ProjectWidget(data: Data.projects[index]);
            },
          ),
        )
      ],
    );
  }
}
