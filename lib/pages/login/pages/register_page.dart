import 'package:bruno/bruno.dart';
import 'package:certificate_pass/pages/login/provider/register_form_provider.dart';
import 'package:certificate_pass/utils/brn_1row_delegate.dart';
import 'package:certificate_pass/widgets/my_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);
  @override
  _RegisterPageState createState() {
    return _RegisterPageState();
  }
}

class _RegisterPageState extends State<RegisterPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  RegisterFormProvider provider = RegisterFormProvider();

  List<Map<String, List>> majorList = [
    {
      '计算机': [
        {
          '计算机': ['8', '9']
        },
      ]
    },
    {
      '电子信息': [
        {
          '计算机': ['8', '9']
        },
      ]
    },
    {
      '管理': [
        {
          '计算机': ['8', '9']
        },
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider(
        create: (_) => provider,
        child: SafeArea(
            child: Scaffold(
                body: MyScrollView(
          children: [
            BrnTextInputFormItem(
              title: "姓名",
              hint: "请输入",
              onChanged: (newValue) {},
            ),
            BrnTextInputFormItem(
              title: "学校",
              hint: "请输入",
              onChanged: (newValue) {},
            ),
            BrnTextSelectFormItem(
                title: "出生年月",
                hint: "请输入",
                onTap: () {
                  BrnDatePicker.showDatePicker(context,
                      maxDateTime: DateTime.now(),
                      initialDateTime: DateTime.parse('2002-01-01 18:26:59'),
                      // 支持DateTimePickerMode.date、DateTimePickerMode.datetime、DateTimePickerMode.time
                      pickerMode: BrnDateTimePickerMode.date,
                      onConfirm: (dateTime, list) {
                    BrnToast.show("onConfirm:  $dateTime   $list", context);
                  });
                }),
            BrnTextInputFormItem(
              title: "年级",
              hint: "请输入",
              onChanged: (newValue) {},
            ),
            BrnTextSelectFormItem(
              title: "专业",
              hint: "请输入",
              onTap: () {
                BrnMultiDataPicker(
                  context: context,
                  title: '请选择专业',
                  delegate: Brn1RowDelegate(majorList, firstSelectedIndex: 1),
                  confirmClick: (list) {
                    BrnToast.show(list.toString(), context);
                  },
                ).show();
              },
            ),
          ],
        ))));
  }
}
