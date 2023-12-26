import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loksewa/core/const/assets_path.dart';
import 'package:loksewa/core/themes/app_color.dart';

class DownloadResources extends StatelessWidget {
  final List<String> downloadedtexts = [
    'Verification test IQ',
    'Series IQ',
    '1st Paper-Assistant level 4th Admin',
  ];
  DownloadResources({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "DownLoaded Resources",
                  style: TextStyle(
                      color: AppColor.credentialName,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "View All",
                  style: TextStyle(
                      color: AppColor.primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 300, // Adjust the height as needed
            child: ListView.builder(
              // scrollDirection: Axis.horizontal,
              itemCount: downloadedtexts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 56,
                    width: MediaQuery.sizeOf(context).width * 0.2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(downloadedtexts[index]),
                        ),
                        Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Row(
                            children: [
                              // ignore: unnecessary_const
                              SvgPicture.asset(AssetsPath.arrow_down),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "Download",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.primaryColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
