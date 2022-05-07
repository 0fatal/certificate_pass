import 'package:certificate_pass/resources/gaps.dart';
import 'package:certificate_pass/widgets/my_app_bar.dart';
import 'package:certificate_pass/widgets/my_scroll_view.dart';
import 'package:flutter/material.dart';

class ImitatedTestPage extends StatefulWidget {
  ImitatedTestPage({Key? key}) : super(key: key);

  @override
  _ImitatedTestPageState createState() {
    return _ImitatedTestPageState();
  }
}

class _ImitatedTestPageState extends State<ImitatedTestPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: MyAppBar(
          centerTitle: "模拟测试",
          right: Row(
            children: [
              Text(
                "交卷",
                style: TextStyle(color: Colors.blue, fontSize: 16),
              ),
              Gaps.hGap4,
              Icon(Icons.settings, color: Colors.blue),
              Gaps.hGap16,
            ],
          )),
      body: Stack(
        fit: StackFit.expand,
        children: [
          MyScrollView(
            children: [
              Gaps.vGap12,
              Row(
                children: [
                  Gaps.hGap12,
                  Container(
                      decoration: BoxDecoration(color: Colors.blueAccent),
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      child: Text(
                        "单选",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )),
                  Gaps.hGap8,
                  Text(
                    "What day is it today?",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
              Gaps.vGap16,
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "A. Sunday",
                    "B. Monday",
                    "C. Tuesday",
                    "D. Friday"
                  ]
                      .map((e) => InkWell(
                          onTap: () {},
                          highlightColor: Colors.blue[100],
                          splashColor: Colors.blue[100],
                          child: Container(
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              decoration: BoxDecoration(border: Border.all()),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 16),
                              child: Text(e, style: TextStyle(fontSize: 16)))))
                      .toList()),
            ],
          ),
          Positioned(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    border: Border(top: BorderSide(color: Colors.grey))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        child: Text(
                          "倒计时 50:30",
                          style: TextStyle(fontSize: 18),
                        ),
                        width: 120),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.wysiwyg,
                              color: Color(0xFF1890FF), size: 24),
                          Text("1/20",
                              style: TextStyle(
                                  color: Color(0xFF1890FF), fontSize: 18))
                        ]),
                    SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("下一题",
                                style: TextStyle(
                                    color: Color(0xFF1890FF), fontSize: 18)),
                            Icon(Icons.keyboard_arrow_right_outlined,
                                color: Color(0xFF1890FF), size: 24)
                          ],
                        ),
                        width: 120)
                  ],
                ),
              ),
              left: 0,
              right: 0,
              bottom: 0)
        ],
      ),
    );
  }
}
