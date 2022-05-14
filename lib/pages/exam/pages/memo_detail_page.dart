import 'package:bruno/bruno.dart';
import 'package:certificate_pass/pages/exam/exam_router.dart';
import 'package:certificate_pass/resources/gaps.dart';
import 'package:certificate_pass/resources/resources.dart';
import 'package:certificate_pass/routes/fluro_navigator.dart';
import 'package:certificate_pass/widgets/my_app_bar.dart';
import 'package:certificate_pass/widgets/my_scroll_view.dart';
import 'package:flutter/material.dart';

class MemoDetailPage extends StatefulWidget {
  MemoDetailPage({Key? key}) : super(key: key);

  @override
  _MemoDetailPageState createState() {
    return _MemoDetailPageState();
  }
}

class _MemoDetailPageState extends State<MemoDetailPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _buildHeader() {
    return Container(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  child: Icon(Icons.calendar_today_outlined,
                      color: Colors.grey[600]!),
                  onTap: () =>
                      NavigatorUtils.push(context, ExamRouter.calendarPage),
                ),
                Gaps.hGap8,
                GestureDetector(
                  child: Icon(Icons.add, color: Colors.grey[600]!),
                  onTap: () =>
                      NavigatorUtils.push(context, ExamRouter.countdownPage),
                )
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 14, bottom: 20),
              child: Align(
                  child: Text('我的备考', style: TextStyles.textBold26),
                  alignment: Alignment.topLeft)),
          Padding(
              padding: EdgeInsets.only(right: 14, bottom: 8),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    child: Icon(Icons.sticky_note_2_outlined),
                    onTap: () => NavigatorUtils.goBack(context),
                  )))
        ]),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey[300]!))));
  }

  Widget _buildForm() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey[400]!)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 13),
            child: Row(
              children: [
                Icon(Icons.calculate_outlined),
                Gaps.hGap12,
                Text("距离考试还有 218 天")
              ],
            )),
        Divider(
          color: Colors.grey[400]!,
          height: 1,
        ),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 13),
            alignment: Alignment.centerLeft,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.book_outlined),
                Gaps.hGap12,
                Text("准考证号：31020159382"),
              ],
            )),
        Divider(
          color: Colors.grey[400]!,
          height: 1,
        ),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 13),
            alignment: Alignment.centerLeft,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.home),
                Gaps.hGap12,
                Text("考场：杭州电子科技大学7教112"),
              ],
            )),
        Divider(
          color: Colors.grey[400]!,
          height: 1,
        ),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.calendar_today_outlined),
                Gaps.hGap12,
                Expanded(
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("工具："),
                        Expanded(
                            child: BrnTextQuickSelectFormItem(
                          isBtnsScroll: true,
                          hint: '',
                          btnsTxt: ["黑色水笔", "涂卡2B铅笔", "耳机", "(自定义)"],
                          selectBtnList: [true, false, false, false],
                        ))
                      ]),
                )
              ],
            )),
        Divider(
          color: Colors.grey[400]!,
          height: 1,
        ),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.receipt_long_outlined),
                Gaps.hGap12,
                Expanded(
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("其他："),
                        Expanded(
                            child: Container(
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(border: Border.all()),
                          child: BrnTextBlockInputFormItem(
                            controller: TextEditingController()
                              ..text = "考场中手机要关机",
                            hint: "",
                            minLines: 1,
                            maxLines: 3,
                            isEdit: false,
                          ),
                        ))
                      ]),
                )
              ],
            )),
      ]),
    );
  }

  Widget _buildExamHeader() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.arrow_left_outlined,
              color: Colors.white,
              size: 32,
            ),
            Text(
              "大学英语六级",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            Icon(
              Icons.arrow_right_outlined,
              color: Colors.white,
              size: 32,
            ),
          ],
        ),
        decoration: BoxDecoration(color: Color(0xFF4252E9)));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: MyAppBar(
              centerTitle: "我的备考",
            ),
            body: MyScrollView(children: [
              _buildHeader(),
              Column(
                children: [
                  _buildExamHeader(),
                  _buildForm(),
                ],
              ),
            ])));
  }
}
