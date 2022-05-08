import 'package:bruno/bruno.dart';
import 'package:certificate_pass/pages/login/login_router.dart';
import 'package:certificate_pass/pages/login/provider/register_form_provider.dart';
import 'package:certificate_pass/resources/gaps.dart';
import 'package:certificate_pass/routes/fluro_navigator.dart';
import 'package:certificate_pass/utils/brn_1row_delegate.dart';
import 'package:certificate_pass/widgets/my_button.dart';
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
        {'计算机': '计算机'},
      ]
    },
    {
      '电子信息': [
        {'电子信息': '电子信息'},
      ]
    },
    {
      '管理': [
        {'管理': '管理'},
      ]
    },
  ];

  List<String> certList = [
    '大学六级英语',
    '经纪人资格证',
    '初级注册会计师',
    '日本语等级考试',
    '教师资格证',
    '剑桥商务英语',
    '驾驶资格证',
    '全国计算机二级',
    '其他'
  ];

  @override
  Widget build(BuildContext context) {
    final Map args = (ModalRoute.of(context)?.settings.arguments ??
        {'type': 'student'}) as Map;
    final bool isStudent = (args['type'] as String) == 'student';

    return ChangeNotifierProvider(
        create: (_) => provider,
        child: SafeArea(
            child: Scaffold(
                backgroundColor: Colors.white,
                body: MyScrollView(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                            top: 50, left: 16, right: 16, bottom: 25),
                        child: Row(children: [
                          Text(
                            '注册账户',
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                          Gaps.hGap8,
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xFF4252E9),
                                borderRadius: BorderRadius.circular(7)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            child: Text(isStudent ? '学生版' : '社会版',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white)),
                          )
                        ])),
                    BrnNormalFormGroup(title: '基本信息', children: [
                      BrnTextInputFormItem(
                        title: "姓名",
                        hint: "请输入",
                        onChanged: (newValue) {},
                      )
                    ]),
                    if (isStudent)
                      BrnTextInputFormItem(
                        title: "学校",
                        hint: "请输入",
                        onChanged: (newValue) {},
                      ),
                    if (!isStudent)
                      BrnTextInputFormItem(
                        title: "职业",
                        hint: "请输入",
                        onChanged: (newValue) {},
                      ),
                    BrnTextSelectFormItem(
                        title: "出生年月",
                        hint: "请输入",
                        onTap: () {
                          BrnDatePicker.showDatePicker(context,
                              maxDateTime: DateTime.now(),
                              initialDateTime:
                                  DateTime.parse('2002-01-01 18:26:59'),
                              // 支持DateTimePickerMode.date、DateTimePickerMode.datetime、DateTimePickerMode.time
                              pickerMode: BrnDateTimePickerMode.date,
                              onConfirm: (dateTime, list) {});
                        }),
                    if (isStudent)
                      BrnTextInputFormItem(
                        title: "年级",
                        hint: "请输入",
                        onChanged: (newValue) {},
                      ),
                    if (isStudent)
                      BrnTextSelectFormItem(
                        title: "专业",
                        hint: "请输入",
                        onTap: () {
                          BrnMultiDataPicker(
                            context: context,
                            title: '请选择专业',
                            delegate: Brn1RowDelegate(majorList),
                            confirmClick: (list) {},
                          ).show();
                        },
                      ),
                    if (!isStudent)
                      BrnNormalFormGroup(
                        children: [
                          BrnTextSelectFormItem(
                            title: "专业1",
                            hint: "请输入",
                            onTap: () {
                              BrnMultiDataPicker(
                                context: context,
                                title: '请选择专业',
                                delegate: Brn1RowDelegate(majorList),
                                confirmClick: (list) {
                                  BrnToast.show(list.toString(), context);
                                },
                              ).show();
                            },
                          ),
                          BrnTextSelectFormItem(
                            title: "专业2",
                            hint: "请输入",
                            onTap: () {
                              BrnMultiDataPicker(
                                context: context,
                                title: '请选择专业',
                                delegate: Brn1RowDelegate(majorList),
                                confirmClick: (list) {
                                  BrnToast.show(list.toString(), context);
                                },
                              ).show();
                            },
                          )
                        ],
                        title: '曾学专业',
                      ),
                    BrnNormalFormGroup(title: '意向证书', children: [
                      Container(
                          padding: EdgeInsets.all(15),
                          child: BrnSelectTag(
                              tags: certList,
                              isSingleSelect: false,
                              fixWidthMode: false,
                              spacing: 12,
                              onSelect: (selectedIndexes) {
                                BrnToast.show(
                                    selectedIndexes.toString(), context);
                              }))
                    ]),
                    Gaps.vGap32,
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: MyButton(
                            onPressed: () {
                              NavigatorUtils.push(
                                  context, LoginRouter.registerPage,
                                  arguments: {
                                    'type': isStudent ? 'community' : 'student'
                                  });
                            },
                            text: '切换到${isStudent ? '社会版' : '学生版'}')),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: MyButton(
                          onPressed: () {
                            NavigatorUtils.push(
                                context, LoginRouter.licensePage);
                          },
                          text: '登录（进入首页）'),
                    ),
                    // Container(
                    //     padding: EdgeInsets.all(5),
                    //     margin: EdgeInsets.all(18),
                    //     decoration: BoxDecoration(
                    //         border: Border.all(color: Colors.grey)),
                    //     child: Row(
                    //         crossAxisAlignment: CrossAxisAlignment.center,
                    //         children: [
                    //           Text('意向证书:'),
                    //           Column(
                    //               crossAxisAlignment: CrossAxisAlignment.start,
                    //               children: [
                    //                 for (int i = 0; i < certList.length; i += 2)
                    //                   Row(children: [
                    //                     SizedBox(
                    //                         width: 150,
                    //                         height: 30,
                    //                         child: Row(
                    //                           children: [
                    //                             Checkbox(
                    //                               value: false,
                    //                               onChanged: (checked) {},
                    //                             ),
                    //                             Text(certList[i])
                    //                           ],
                    //                         )),
                    //                     if (i + 1 < certList.length)
                    //                       SizedBox(
                    //                           width: 150,
                    //                           height: 30,
                    //                           child: Row(
                    //                             children: [
                    //                               Checkbox(
                    //                                 value: false,
                    //                                 onChanged: (checked) {},
                    //                               ),
                    //                               Text(certList[i + 1])
                    //                             ],
                    //                           ))
                    //                   ])
                    //               ])
                    //         ]))
                  ],
                ))));
  }
}
