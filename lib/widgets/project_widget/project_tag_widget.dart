import 'package:flutter/material.dart';
import 'package:higherror_portfolio/modules/project.dart';
import 'package:higherror_portfolio/theme.dart';

class ProjectTagWidget extends StatelessWidget {
  final ProjectTag data;
  const ProjectTagWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9999),
        border: Border.all(
          color: AppColors.primaryColor.withAlpha(150),
          width: 2.0,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(data.icon, size: 15),
          const SizedBox(width: 5),
          Text(data.title, style: AppTextStyle.tagTitle),
        ],
      ),
    );
  }
}
