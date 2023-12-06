import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final Color? color;
  final Color? textColor;
  final String btnText;
  final VoidCallback? onClick;
  const OptionButton(
      {super.key,
      this.color,
      required this.btnText,
      this.onClick,
      this.textColor});

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
              // border: Border.all(color: Colors.black),
              color: color,
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Icon(
                  Icons.circle_outlined,
                  color: Color(0xff6B7B8F),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    btnText,
                    style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
