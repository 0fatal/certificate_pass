import 'package:bruno/bruno.dart';
import 'package:certificate_pass/resources/gaps.dart';
import 'package:certificate_pass/resources/resources.dart';
import 'package:certificate_pass/routes/fluro_navigator.dart';
import 'package:certificate_pass/widgets/my_scroll_view.dart';
import 'package:flutter/material.dart';

class MemoPage extends StatefulWidget {
  MemoPage({Key? key}) : super(key: key);

  @override
  _MemoPageState createState() {
    return _MemoPageState();
  }
}

class _MemoPageState extends State<MemoPage> {
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
      padding: EdgeInsets.only(bottom: 20),
      margin: EdgeInsets.only(bottom: 20, top: 84),
      child: Center(
          child: Text(
        "备忘录",
        style: TextStyles.textBold24,
      )),
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[300]!))),
    );
  }

  Widget _buildBtn() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      BrnNormalButton(
        text: '取消',
        onTap: () {
          NavigatorUtils.goBack(context);
        },
        fontSize: 14,
        backgroundColor: Color(0xFF4252E9),
        fontWeight: FontWeight.normal,
        insertPadding: EdgeInsets.symmetric(horizontal: 26, vertical: 5),
        borderRadius: BorderRadius.circular(4),
      ),
      Gaps.hGap32,
      BrnNormalButton(
        text: '保存',
        onTap: () {
          // NavigatorUtils.push(context, R);
          NavigatorUtils.goBack(context);
        },
        fontSize: 14,
        fontWeight: FontWeight.normal,
        backgroundColor: Color(0xFF4252E9),
        insertPadding: EdgeInsets.symmetric(horizontal: 26, vertical: 5),
        borderRadius: BorderRadius.circular(4),
      )
    ]);
  }

  Widget _buildForm() {
    return Container(
      margin: EdgeInsets.all(18),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey[400]!)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        // Icon(Icons.work_outline_outlined),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            alignment: Alignment.centerLeft,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.book_outlined),
                Gaps.hGap12,
                Text("准考证号："),
                Container(
                    width: 210,
                    child: Center(
                      child: TextField(
                          decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '点击这里输入准考证号',
                        suffixIcon: Icon(
                          Icons.edit,
                          color: Colors.grey,
                        ),
                      )),
                    )),
              ],
            )),
        Divider(
          color: Colors.grey[400]!,
          height: 1,
        ),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            alignment: Alignment.centerLeft,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.home),
                Gaps.hGap12,
                Text("考场："),
                Container(
                    width: 210,
                    child: Center(
                      child: TextField(
                          decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '点击这里输入考场',
                        suffixIcon: Icon(
                          Icons.location_on_outlined,
                          color: Colors.grey,
                        ),
                      )),
                    )),
              ],
            )),
        Divider(
          color: Colors.grey[400]!,
          height: 1,
        ),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Expanded(
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
                          btnsTxt: ["黑色水笔", "涂卡2B铅笔", "耳机", "(自定义)"],
                          selectBtnList: [true, false, false, false],
                        ))
                      ]),
                )
              ],
            ))),
        Divider(
          color: Colors.grey[400]!,
          height: 1,
        ),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Expanded(
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
                        Text("查成绩日期："),
                        Expanded(
                          child: BrnTextSelectFormItem(
                              hint: "请输入",
                              onTap: () {
                                BrnDatePicker.showDatePicker(context,
                                    maxDateTime: DateTime.now()
                                        .add(Duration(days: 3650)),
                                    initialDateTime: DateTime.now(),
                                    // 支持DateTimePickerMode.date、DateTimePickerMode.datetime、DateTimePickerMode.time
                                    pickerMode: BrnDateTimePickerMode.date,
                                    onConfirm: (dateTime, list) {});
                              }),
                        )
                      ]),
                )
              ],
            ))),

        Divider(
          color: Colors.grey[400]!,
          height: 1,
        ),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 13),
            child: Row(
              children: [
                Icon(Icons.access_alarms_outlined),
                Gaps.hGap12,
                Text("查成绩提醒")
              ],
            )),
        Divider(
          color: Colors.grey[400]!,
          height: 1,
        ),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Expanded(
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
                            controller: TextEditingController(),
                            hint: "",
                            minLines: 1,
                            maxLines: 3,
                          ),
                        ))
                      ]),
                )
              ],
            ))),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: MyScrollView(children: [
              _buildHeader(),
              _buildForm(),
              Gaps.vGap24,
              _buildBtn()
            ])));
  }
}
