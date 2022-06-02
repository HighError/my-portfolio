import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:higherror_portfolio/theme.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const _HomeTextWidget(),
            Image.asset(
              'assets/images/developer.png',
              width: 450,
            ),
          ],
        );
      }
      return Center(
        child: Wrap(
          spacing: 15.0,
          runSpacing: 25.0,
          children: [
            const _HomeTextWidget(),
            Image.asset(
              'assets/images/developer.png',
              width: 450,
            ),
          ],
        ),
      );
    });
  }
}

class _HomeTextWidget extends StatelessWidget {
  const _HomeTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Hi There!', style: AppTextStyle.mainPageFirstLine),
        const SizedBox(height: 5),
        RichText(
          text: TextSpan(
            text: 'I\'M ',
            style: AppTextStyle.mainPageSecondLine,
            children: [
              TextSpan(
                text: 'VITALIY HORDIYK',
                style: AppTextStyle.mainPageSecondLine
                    .copyWith(color: AppColors.primaryColor),
              )
            ],
          ),
        ),
        const SizedBox(height: 25),
        //const Text('Software Developer', style: AppTextStyle.mainPageThirdLine),
        DefaultTextStyle(
          style: AppTextStyle.mainPageThirdLine,
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'Software Developer',
                speed: const Duration(milliseconds: 300),
              ),
              TypewriterAnimatedText(
                'Indie Game Developer',
                speed: const Duration(milliseconds: 300),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
