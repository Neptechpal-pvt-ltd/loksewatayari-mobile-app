import 'package:flutter/material.dart';
import 'package:loksewa/core/const/assets_path.dart';
// ignore: unused_import
import 'package:loksewa/core/themes/app_color.dart';

class CustomAppbar extends StatelessWidget {
  final String? text;

  const CustomAppbar({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Image(image: AssetImage(AssetsPath.backarrow)),
          ),
        ),
        text == null
            ? const SizedBox()
            : Text(
                text!,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff151B2B)),
              )
      ],
    );
  }
}
