import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:loksewa/core/themes/app_color.dart';

class NavButton extends StatelessWidget {
  final Color? color;
  final Color? textColor;
  final String btnText;
  final VoidCallback? onClick;
  final isOther;
  const NavButton(
      {super.key,
      this.color,
      required this.btnText,
      this.onClick,
      this.textColor,
      this.isOther = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.07,
          width: MediaQuery.of(context).size.width * 0.90,
          decoration: BoxDecoration(
              border: isOther
                  ? Border.all(width: 1, color: const Color(0xffDAE0E6))
                  : null,
              // border: Border.all(color: AppColor.textColor),
              color: color,
              borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: Text(
              btnText,
              style: TextStyle(
                  color: textColor, fontWeight: FontWeight.w700, fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}
