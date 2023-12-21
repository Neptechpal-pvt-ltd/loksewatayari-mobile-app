import 'package:flutter/material.dart';

class ButtonNavbar extends StatelessWidget {
  final Color? color;
  final Widget? icon;
  final VoidCallback? onClick;
  final int index;

  const ButtonNavbar(
      {Key? key,
      this.color,
      required this.icon,
      this.onClick,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: icon!,
    );
  }
}
