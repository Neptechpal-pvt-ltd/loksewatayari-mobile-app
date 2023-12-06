import 'package:flutter/material.dart';
import 'package:loksewa/view_model.dart/dashboard_view_model.dart';
import 'package:provider/provider.dart';

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
    DashboardViewModel dashboardViewModels =
        Provider.of<DashboardViewModel>(context);
    return InkWell(
      onTap: onClick,
      child: icon!,
    );
  }
}
