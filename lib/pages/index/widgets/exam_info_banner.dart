import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class ExamInfoBanner extends StatelessWidget {
  ExamInfoBanner({Key? key, required this.examDate, required this.examName})
      : super(key: key);

  DateTime examDate;
  String examName;
  Color bgColor = Color(0xFF5F52E6);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Duration duration = DateTime.now().difference(examDate);
    int durationDay = (duration.inHours / 24).toInt();
    int durationHours = duration.inHours % 24;

    return Container(
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(4)),
              child: Text('距离最近的一门备考科目',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white),
              child: Center(
                child: Column(
                  children: [
                    Text(examName,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text('还有${durationDay}天${durationHours}小时',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(4)),
              child: Text(
                formatDate(examDate, [yyyy, '/', mm, '/', dd]),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey[500]!)),
    );
  }
}
