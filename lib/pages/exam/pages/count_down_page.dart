import 'package:bruno/bruno.dart';
import 'package:certificate_pass/pages/exam/exam_router.dart';
import 'package:certificate_pass/resources/gaps.dart';
import 'package:certificate_pass/resources/resources.dart';
import 'package:certificate_pass/routes/fluro_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class CountDownPage extends StatefulWidget {
  CountDownPage({Key? key}) : super(key: key);

  @override
  _CountDownPageState createState() {
    return _CountDownPageState();
  }
}

class _CountDownPageState extends State<CountDownPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  int _selectedSettingImproved = 0;
  bool _upTop = false;

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      margin: EdgeInsets.only(bottom: 20, top: 84),
      child: Center(
          child: Text(
        "添加倒数日",
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
          NavigatorUtils.push(context, ExamRouter.countdownPage);
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
        Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            alignment: Alignment.centerLeft,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.work_outline),
                Gaps.hGap12,
                Container(
                    width: 210,
                    child: Center(
                      child: TextField(
                          decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '点击这里输入报考项目',
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
                        Text("考试日"),
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
                Icon(Icons.arrow_upward),
                Gaps.hGap12,
                Text("置顶"),
                Spacer(),
                // BrnCheckbox(
                //     isSelected: _upTop,
                //     child: Text(_upTop ? "开启" : "关闭"),
                //     radioIndex: 0,
                //     onValueChangedAtIndex: (_, upTop) {
                //       this.setState(() {
                //         _upTop = upTop;
                //       });
                //     }),
                FlutterSwitch(
                    value: _upTop,
                    width: 50.0,
                    height: 22.0,
                    onToggle: (upTop) {
                      this.setState(() {
                        _upTop = upTop;
                      });
                    }),
                Gaps.hGap4,
              ],
            )),
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
                Text("定期提醒")
              ],
            )),
        Divider(
          color: Colors.grey[400]!,
          height: 1,
        ),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 13),
            child: Row(
              children: [
                Icon(Icons.settings_rounded),
                Gaps.hGap12,
                Text("优化设置"),
                Spacer(),
                Row(
                  children: [
                    BrnRadioButton(
                      radioIndex: 0,
                      isSelected: _selectedSettingImproved == 0,
                      child: Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          "默认",
                        ),
                      ),
                      onValueChangedAtIndex: (index, value) {
                        setState(() {
                          _selectedSettingImproved = index;
                        });
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    BrnRadioButton(
                      radioIndex: 1,
                      isSelected: _selectedSettingImproved == 1,
                      child: Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          "自定义",
                        ),
                      ),
                      onValueChangedAtIndex: (index, value) {
                        setState(() {
                          _selectedSettingImproved = index;
                        });
                      },
                    ),
                    Gaps.hGap4,
                  ],
                )
              ],
            )),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(children: [
              _buildHeader(),
              _buildForm(),
              Gaps.vGap24,
              _buildBtn()
            ])));
  }
}
