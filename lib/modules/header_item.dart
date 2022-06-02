import 'package:flutter/material.dart';

class HeaderItem {
  final String title;
  final IconData icon;
  final Function()? onTap;
  HeaderItem({required this.title, required this.icon, this.onTap});
}
