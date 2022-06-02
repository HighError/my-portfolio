import 'package:flutter/material.dart';
import 'package:higherror_portfolio/modules/project.dart';
import 'package:higherror_portfolio/theme.dart';
import 'package:higherror_portfolio/widgets/project_widget/project_link_button_widget.dart';
import 'package:higherror_portfolio/widgets/project_widget/project_tag_widget.dart';

class ProjectWidget extends StatelessWidget {
  final Project data;
  const ProjectWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppColors.primaryColor.withAlpha(150),
          width: 2.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _Content(data: data),
          ],
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  final Project data;
  const _Content({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _image = data.image == null
        ? Container()
        : Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Center(child: data.image!),
          );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _image,
        Center(
          child: Text(data.title, style: AppTextStyle.projectTitle),
        ),
        Center(
          child: Padding(
            padding:
                EdgeInsets.symmetric(vertical: data.tags.isNotEmpty ? 10 : 0),
            child: Wrap(
              spacing: 5.0,
              runSpacing: 5.0,
              children: data.tags.map((tag) {
                return ProjectTagWidget(data: tag);
              }).toList(),
            ),
          ),
        ),
        Text(data.description),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          child: Wrap(
            alignment: WrapAlignment.end,
            spacing: 5,
            runSpacing: 5,
            children: data.links
                .map((e) => ProjectLinkButtonWidget(link: e))
                .toList(),
          ),
        ),
      ],
    );
  }
}
