import 'package:flutter/material.dart';
import 'package:loksewa/core/const/assets_path.dart';
import 'package:loksewa/utils/widgets/appbar/custom_appbar.dart';

class LOksewaVideo extends StatelessWidget {
  const LOksewaVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const CustomAppbar(
              text: "Introduction of Loksewa Exam",
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.20,
            ),
            Image.asset(AssetsPath.loksewavideo)
          ],
        ),
      ),
    );
  }
}
