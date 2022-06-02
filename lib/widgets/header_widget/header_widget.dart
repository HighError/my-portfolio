import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:higherror_portfolio/main.dart';
import 'package:higherror_portfolio/modules/data.dart';
import 'package:higherror_portfolio/modules/header_item.dart';

import 'package:higherror_portfolio/widgets/header_widget/header_animation.dart';
import 'package:higherror_portfolio/theme.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:simple_icons/simple_icons.dart';

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: ((context, sizingInformation) {
        return ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              height: maxExtent,
              padding: const EdgeInsets.symmetric(horizontal: 75),
              child:
                  sizingInformation.deviceScreenType == DeviceScreenType.desktop
                      ? const _Desktop()
                      : const _Mobile(),
            ),
          ),
        );
      }),
    );
  }

  @override
  double get maxExtent => StaticData.headerHeight;

  @override
  double get minExtent => StaticData.headerHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

class _HeaderItemWidget extends StatelessWidget {
  final HeaderItem data;
  const _HeaderItemWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: data.onTap,
      child: Row(
        children: [
          Icon(data.icon, color: Colors.white),
          const SizedBox(width: 5),
          Text(data.title, style: AppTextStyle.headerItemText),
        ],
      ),
    );
  }
}

class _Desktop extends StatelessWidget {
  const _Desktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('HighError', style: AppTextStyle.logoText),
        Row(
          children: Data.headerItems.map((HeaderItem element) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: HeaderAnimation(builder: (isHovered) {
                return _HeaderItemWidget(data: element);
              }),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _Mobile extends StatelessWidget {
  const _Mobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('HighError', style: AppTextStyle.logoText),
        Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(double.infinity),
          child: IconButton(
            onPressed: () {
              changeDrawerState();
            },
            splashRadius: 20,
            hoverColor: AppColors.secondaryColor.withAlpha(50),
            highlightColor: AppColors.primaryColor.withAlpha(50),
            icon: const Icon(Icons.menu),
          ),
        ),
      ],
    );
  }
}
