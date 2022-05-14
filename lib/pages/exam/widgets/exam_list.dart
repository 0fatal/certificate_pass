import 'package:certificate_pass/pages/exam/exam_router.dart';
import 'package:certificate_pass/resources/gaps.dart';
import 'package:certificate_pass/routes/fluro_navigator.dart';
import 'package:flutter/material.dart';

class ExamList extends StatefulWidget {
  ExamList({Key? key}) : super(key: key);

  @override
  _ExamListState createState() {
    return _ExamListState();
  }
}

class _ExamListState extends State<ExamList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget countDownWidget(String name, int days, Color color1, Color color2) {
    return GestureDetector(
        child: Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.grey[100],
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[300]!,
                    offset: Offset(0, 1),
                    blurStyle: BlurStyle.outer,
                    spreadRadius: 1)
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 14),
                  child: Text(
                    name,
                    style: TextStyle(fontSize: 16),
                  )),
              Row(
                children: [
                  Container(
                    width: 60,
                    alignment: Alignment.center,
                    child: Text(
                      days.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    decoration: BoxDecoration(color: color1),
                  ),
                  Container(
                    width: 40,
                    alignment: Alignment.center,
                    child: Text(
                      "天",
                      style: TextStyle(color: Colors.white, fontSize: 19),
                    ),
                    decoration: BoxDecoration(color: color2),
                  )
                ],
              )
            ],
          ),
        ),
        onTap: () => NavigatorUtils.push(context, ExamRouter.memoDetailPage));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(32),
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("New Year还有"),
                    Text(
                      "目标日：2023-1-1 Sunday",
                      style: TextStyle(color: Colors.grey[600]),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("232",
                        style: TextStyle(
                            fontSize: 56, fontWeight: FontWeight.bold)),
                    Gaps.hGap4,
                    Container(
                      margin: EdgeInsets.only(top: 18),
                      padding: EdgeInsets.all(3),
                      child: Text(
                        "Days",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(2)),
                    )
                  ],
                )
              ],
            ),
          ),
          Gaps.vGap32,
          countDownWidget(
              "大学英语六级", 218, Colors.lightBlue[300]!, Colors.blue[600]!),
          Gaps.vGap12,
          countDownWidget(
              "New Year", 232, Colors.orange[300]!, Colors.orange[600]!),
        ],
      ),
    );
  }
}
