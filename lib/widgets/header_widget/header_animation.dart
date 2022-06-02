import 'package:flutter/material.dart';
import 'package:higherror_portfolio/theme.dart';

class HeaderAnimation extends StatefulWidget {
  final Widget Function(bool isHovered) builder;
  const HeaderAnimation({Key? key, required this.builder}) : super(key: key);

  @override
  State<HeaderAnimation> createState() => _HeaderAnimationState();
}

class _HeaderAnimationState extends State<HeaderAnimation> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final borderAlpha = isHovered ? 255 : 0;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => onEntered(true),
      onExit: (_) => onEntered(false),
      child: AnimatedContainer(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.primaryColor.withAlpha(borderAlpha),
              width: 3,
            ),
            top: BorderSide.none,
            left: BorderSide.none,
            right: BorderSide.none,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 2),
        duration: const Duration(milliseconds: 300),
        child: widget.builder(isHovered),
      ),
    );
  }

  onEntered(bool bool) {
    setState(() {
      isHovered = bool;
    });
  }
}
