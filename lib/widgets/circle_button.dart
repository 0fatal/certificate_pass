import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final GestureTapCallback? onTap;
  final Icon icon;
  final Color bgColor;
  final double size;

  const CircleButton(
      {Key? key,
      this.onTap,
      required this.size,
      required this.icon,
      required this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: bgColor,
            shape: BoxShape.circle,
          ),
          child: icon),
    );
  }
}
