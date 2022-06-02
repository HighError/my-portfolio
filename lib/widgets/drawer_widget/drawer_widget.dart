import 'package:flutter/material.dart';
import 'package:higherror_portfolio/modules/data.dart';
import 'package:higherror_portfolio/theme.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  List<Widget> _getItems() {
    return Data.headerItems.map((element) {
      return ListTile(
        onTap: element.onTap,
        leading: Icon(element.icon),
        title: Text(
          element.title,
          style: AppTextStyle.headerItemText,
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.background,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                splashRadius: 20,
                hoverColor: AppColors.secondaryColor.withAlpha(50),
                highlightColor: AppColors.primaryColor.withAlpha(50),
                icon: const Icon(Icons.close),
              ),
            ),
            ..._getItems(),
          ],
        ),
      ),
    );
  }
}
