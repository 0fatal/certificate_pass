import 'package:bruno/bruno.dart';
import 'package:certificate_pass/pages/profile/profile_router.dart';
import 'package:certificate_pass/resources/gaps.dart';
import 'package:certificate_pass/routes/fluro_navigator.dart';
import 'package:certificate_pass/routes/routes.dart';
import 'package:certificate_pass/widgets/my_app_bar.dart';
import 'package:certificate_pass/widgets/my_button.dart';
import 'package:certificate_pass/widgets/my_scroll_view.dart';
import 'package:flutter/material.dart';

class ProfileInfoPage extends StatefulWidget {
  ProfileInfoPage({Key? key}) : super(key: key);

  @override
  _ProfileInfoPageState createState() {
    return _ProfileInfoPageState();
  }
}

class _ProfileInfoPageState extends State<ProfileInfoPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
    final bool isStudent = ((ModalRoute.of(context)!.settings.arguments
            as Map)['type'] as String) ==
        'student';

    // TODO: implement build
    return SafeArea(
        child: Scaffold(
            appBar: MyAppBar(
              backgroundColor: Colors.white,
            ),
            backgroundColor: Colors.white,
            body: MyScrollView(
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 16, right: 16, bottom: 25),
                    child: Row(children: [
                      Text(
                        '个人信息',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      Gaps.hGap8,
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xFF4252E9),
                            borderRadius: BorderRadius.circular(7)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        child: Text(isStudent ? '学生版' : '社会版',
                            style:
                                TextStyle(fontSize: 14, color: Colors.white)),
                      )
                    ])),
                BrnNormalFormGroup(title: '基本信息', children: [
                  BrnTextInputFormItem(
                    title: "姓名",
                    hint: "",
                    onChanged: (newValue) {},
                  )
                ]),
                if (!isStudent)
                  BrnTextInputFormItem(
                    title: "职业",
                    hint: "",
                    onChanged: (newValue) {},
                  ),
                if (isStudent)
                  BrnTextInputFormItem(
                    title: "学校",
                    hint: "",
                    onChanged: (newValue) {},
                  ),
                if (isStudent)
                  BrnTextInputFormItem(
                      title: "年级", hint: "2001-7-9", onChanged: (newValue) {}),
                BrnTextInputFormItem(
                  title: "出生年月",
                  hint: "1995-5-9",
                  onChanged: (newValue) {},
                ),
                if (isStudent)
                  BrnTextInputFormItem(
                    title: "专业",
                    hint: "计算机",
                    onChanged: (newValue) {},
                  ),
                if (!isStudent)
                  BrnNormalFormGroup(children: [
                    BrnTextInputFormItem(
                      title: "专业1",
                      hint: "计算机",
                      onChanged: (newValue) {},
                    ),
                    BrnTextInputFormItem(
                      title: "专业2",
                      hint: "无",
                      onChanged: (newValue) {},
                    )
                  ], title: '曾学专业'),
                BrnNormalFormGroup(title: '意向证书', children: [
                  Container(
                      padding: EdgeInsets.all(15),
                      child: BrnSelectTag(
                          tags: certList,
                          isSingleSelect: false,
                          fixWidthMode: false,
                          spacing: 12,
                          onSelect: (selectedIndexes) {
                            BrnToast.show(selectedIndexes.toString(), context);
                          }))
                ]),
                Gaps.vGap32,
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: MyButton(
                        onPressed: () {
                          NavigatorUtils.push(
                              context, ProfileRouter.profileInfo, arguments: {
                            'type': isStudent ? 'teacher' : 'student'
                          });
                        },
                        text: '切换到${isStudent ? '学生版' : '社会版'}')),
              ],
            )));
  }
}
