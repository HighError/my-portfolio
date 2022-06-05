import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:higherror_portfolio/modules/data.dart';
import 'package:higherror_portfolio/modules/project.dart';
import 'package:higherror_portfolio/theme.dart';
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

class _ProjectScreen extends StatefulWidget {
  final int column;
  const _ProjectScreen({Key? key, required this.column}) : super(key: key);

  @override
  State<_ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<_ProjectScreen> {
  List<Project> filteredProject = Data.projects;
  void filter(String value) {
    if (value == "") {
      setState(() {
        filteredProject = Data.projects;
      });
      return;
    }

    setState(() {
      filteredProject = Data.projects
          .where((element) =>
              element.title.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleWidget(title: 'My Projects'),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 350),
            child: TextField(
              onChanged: (value) => filter(value),
              cursorColor: AppColors.primaryColor,
              decoration: const InputDecoration(
                hintText: 'Пошук...',
                icon: Icon(
                  Icons.search,
                  color: AppColors.primaryColor,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryColor),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: AlignedGridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: widget.column,
            itemCount: filteredProject.length,
            mainAxisSpacing: 25,
            crossAxisSpacing: 25,
            itemBuilder: (context, index) {
              return ProjectWidget(data: filteredProject[index]);
            },
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
