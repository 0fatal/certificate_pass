import 'package:bruno/bruno.dart';
import 'package:certificate_pass/pages/exam/exam_router.dart';
import 'package:certificate_pass/resources/gaps.dart';
import 'package:certificate_pass/routes/fluro_navigator.dart';
import 'package:flutter/material.dart';

class EmptyExam extends StatelessWidget {
  EmptyExam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '暂无证书信息，快去报名吧',
            style: TextStyle(fontSize: 16),
          ),
          Gaps.vGap16,
          BrnNormalButton(
            text: '去报考',
            onTap: () =>
                NavigatorUtils.push(context, ExamRouter.memoDetailPage),
            backgroundColor: Color(0xFF4252E9),
            borderRadius: BorderRadius.circular(50),
            insertPadding: EdgeInsets.symmetric(horizontal: 50, vertical: 13),
            textColor: Colors.white,
            fontSize: 16,
          )
        ],
      ),
    );
  }
}
