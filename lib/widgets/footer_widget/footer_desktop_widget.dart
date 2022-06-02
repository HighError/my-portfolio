import 'package:flutter/material.dart';
import 'package:higherror_portfolio/modules/data.dart';
import 'package:higherror_portfolio/modules/footer_icon.dart';
import 'package:higherror_portfolio/theme.dart';
import 'package:higherror_portfolio/widgets/footer_widget/footer_item_widget.dart';

class FooterDesktopWidget extends StatelessWidget {
  const FooterDesktopWidget({Key? key}) : super(key: key);

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
