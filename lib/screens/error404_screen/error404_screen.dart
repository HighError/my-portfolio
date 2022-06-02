import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:higherror_portfolio/theme.dart';

class Error404Screen extends StatelessWidget {
  const Error404Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setApplicationSwitcherDescription(
      const ApplicationSwitcherDescription(
        label: 'HighError Portfolio - Error 404',
      ),
    );

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/404.png',
            height: MediaQuery.of(context).size.height * 0.5 < 75
                ? 75
                : MediaQuery.of(context).size.height * 0.5,
          ),
          const Text('Сторінку не знайдено', style: AppTextStyle.errorPageText),
        ],
      ),
    );
  }
}
