import 'package:flutter/material.dart';
import 'package:higherror_portfolio/modules/data.dart';
import 'package:higherror_portfolio/modules/footer_icon.dart';
import 'package:higherror_portfolio/widgets/footer_widget/footer_item_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../theme.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return SizedBox(
        height: StaticData.headerHeight,
        child: sizingInformation.deviceScreenType == DeviceScreenType.mobile
            ? const _Mobile()
            : const _Desktop(),
      );
    });
  }
}

class _Mobile extends StatelessWidget {
  const _Mobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Designed and Developed by HighError',
                style: AppTextStyle.footerText(true)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: Data.footerItems.map((FooterIcon element) {
                return FooterItemWidget(
                  builder: ((isHovered) {}),
                  data: element,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _Desktop extends StatelessWidget {
  const _Desktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Designed and Developed by HighError',
                style: AppTextStyle.footerText(false)),
            Row(
              children: Data.footerItems.map((FooterIcon element) {
                return FooterItemWidget(
                  builder: ((isHovered) {}),
                  data: element,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
