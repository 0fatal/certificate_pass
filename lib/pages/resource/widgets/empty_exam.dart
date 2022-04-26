import 'package:bruno/bruno.dart';
import 'package:certificate_pass/resources/gaps.dart';
import 'package:certificate_pass/resources/resources.dart';
import 'package:flutter/material.dart';

class EmptyExam extends StatelessWidget {
  EmptyExam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
        child: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('暂无证书信息，快去报名吧', style: TextStyles.textSize16),
        Gaps.vGap16,
        BrnNormalButton(
          text: '去报考',
          backgroundColor: Color(0xFF4252E9),
          insertPadding: EdgeInsets.symmetric(horizontal: 50, vertical: 13),
          borderRadius: BorderRadius.circular(50),
        )
      ],
    )));
  }
}
