import 'package:flutter/material.dart';
import 'package:higherror_portfolio/modules/footer_icon.dart';
import 'package:higherror_portfolio/theme.dart';
import 'dart:html' as html;

class FooterItemWidget extends StatefulWidget {
  final void Function(bool isHovered) builder;
  final FooterIcon data;
  const FooterItemWidget({Key? key, required this.builder, required this.data})
      : super(key: key);

  @override
  State<FooterItemWidget> createState() => _FooterItemWidgetState();
}

class _FooterItemWidgetState extends State<FooterItemWidget> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        isHovered ? AppColors.primaryColor : AppColors.footerIconBackground;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => onEntered(true),
      onExit: (_) => onEntered(false),
      child: GestureDetector(
        onTap: () {
          html.window.open(widget.data.url, '_blank');
        },
        child: AnimatedContainer(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          duration: const Duration(milliseconds: 300),
          child: Tooltip(
            message: widget.data.title,
            child: CircleAvatar(
              radius: 15,
              backgroundColor: backgroundColor,
              child: Icon(
                widget.data.icon,
                size: 15,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  onEntered(bool bool) {
    setState(() {
      isHovered = bool;
    });
  }
}
