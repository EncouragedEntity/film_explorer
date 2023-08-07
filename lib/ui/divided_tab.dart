import 'package:flutter/material.dart';

class DividedTab extends StatelessWidget {
  const DividedTab(
      {super.key,
      required this.child,
      this.isLastTab,
      this.divider,
      this.alignment});
  final Widget child;
  final bool? isLastTab;
  final Divider? divider;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        divider ?? const Divider(),
        Align(
          alignment: alignment ?? Alignment.center,
          child: child,
        ),
        if (isLastTab ?? false) divider ?? const Divider(),
      ],
    );
  }
}
