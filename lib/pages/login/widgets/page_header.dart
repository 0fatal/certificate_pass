import 'package:certificate_pass/resources/gaps.dart';
import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget {
  PageHeader({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  String title;
  String subtitle;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Align(
        alignment: Alignment.centerLeft,
        child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    )),
                Gaps.vGap4,
                Text(subtitle,
                    style: TextStyle(fontSize: 14, color: Color(0xFF7C7C7C)))
              ],
            ),
            padding: EdgeInsets.symmetric(vertical: 20)));
  }
}
