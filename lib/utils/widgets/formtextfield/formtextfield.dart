import 'package:flutter/material.dart';
import 'package:loksewa/core/themes/app_color.dart';

// ignore: must_be_immutable
class FormTextField extends StatelessWidget {
  String? title;
  String? hinttxt;

  FormTextField({super.key, this.title, this.hinttxt});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                title!,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff151B28)),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 48,
              width: 358,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xffEAEBF0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextFormField(
                  cursorColor: AppColor.primaryColor,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hinttxt!,
                      hintStyle: const TextStyle(
                          color: Color(0xff5F6D7E),
                          fontWeight: FontWeight.w400,
                          fontSize: 16)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
