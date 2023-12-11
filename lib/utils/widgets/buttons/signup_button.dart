import 'package:flutter/material.dart';
import 'package:loksewa/core/themes/app_color.dart';

class TextButtonField extends StatelessWidget {
  String? labeltext;
  final TextEditingController controller;
  TextButtonField({super.key, this.labeltext, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                labeltext!,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 8, right: 8),
          child: TextFormField(
            cursorColor: AppColor.primaryColor,
            controller: controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.primaryColor)),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
