import 'package:certificate_pass/resources/gaps.dart';
import 'package:certificate_pass/widgets/my_app_bar.dart';
import 'package:certificate_pass/widgets/my_scroll_view.dart';
import 'package:flutter/material.dart';

class ProblemBookPage extends StatefulWidget {
  @override
  _ProblemBookPageState createState() {
    return _ProblemBookPageState();
  }
}

class _ProblemBookPageState extends State<ProblemBookPage> {
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
          centerTitle: "错题本",
          right: Row(
            children: [
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
                        child: Row(children: [
                          Icon(
                            Icons.delete_outline,
                            size: 24,
                          ),
                          Text("移除", style: TextStyle(fontSize: 18)),
                        ]),
                        width: 150),
                    Icon(Icons.wysiwyg, color: Color(0xFF1890FF), size: 30),
                    SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("✅ 0",
                                style: TextStyle(
                                    color: Color(0xFF1890FF), fontSize: 18)),
                            Gaps.hGap8,
                            Text("❌️ 0",
                                style: TextStyle(
                                    color: Color(0xFF1890FF), fontSize: 18)),
                          ],
                        ),
                        width: 150)
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
