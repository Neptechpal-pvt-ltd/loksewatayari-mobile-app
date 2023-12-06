import 'package:flutter/material.dart';
class DotIndicator extends StatelessWidget {
  final int itemCount;
  final int currentIndex;

  // ignore: use_key_in_widget_constructors
  const DotIndicator({required this.itemCount, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(itemCount, (index) {
        return Container(
          width: 8.0,
          height: 8.0,
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == currentIndex
                ? Colors.blue  // Color for the selected dot
                : Colors.grey, // Color for unselected dots
          ),
        );
      }),
    );
  }
}
