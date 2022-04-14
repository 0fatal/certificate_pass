import 'package:certificate_pass/pages/login/login_router.dart';
import 'package:certificate_pass/pages/login/widgets/page_header.dart';
import 'package:certificate_pass/resources/gaps.dart';
import 'package:certificate_pass/routes/fluro_navigator.dart';
import 'package:certificate_pass/widgets/my_button.dart';
import 'package:certificate_pass/widgets/my_scroll_view.dart';
import 'package:certificate_pass/widgets/select_box.dart';
import 'package:flutter/material.dart';

class IdentitySelectPage extends StatefulWidget {
  IdentitySelectPage({Key? key}) : super(key: key);

  @override
  _IdentitySelectPageState createState() {
    return _IdentitySelectPageState();
  }
}

class _IdentitySelectPageState extends State<IdentitySelectPage> {
  String identity = '在读学生';
  String ageRange = '18~25岁';
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
    return SafeArea(
        child: Scaffold(
            body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: MyScrollView(children: [
                  Gaps.vGap32,
                  PageHeader(title: '请选择身份', subtitle: '请选择身份，以便精准推荐证书与资料'),
                  SelectBox(
                      options: ['在读学生', '社会人士'],
                      onChanged: (val) {
                        setState(() {
                          identity = val;
                        });
                      },
                      value: identity),
                  SizedBox(height: 118),
                  PageHeader(
                    title: '请选择年龄',
                    subtitle: '请选择年龄，以便精准推荐证书与资料',
                  ),
                  SelectBox(
                      options: ['18~25岁', '26~35岁', '36~40岁', '40岁以上', '50岁以上'],
                      onChanged: (val) => setState(() {
                            ageRange = val;
                          }),
                      value: ageRange),
                  Gaps.vGap32,
                  MyButton(
                    onPressed: () {
                      NavigatorUtils.push(context, LoginRouter.registerPage);
                    },
                    text: '注册账户',
                  ),
                  Gaps.vGap12,
                  MyButton(
                    onPressed: () {
                      NavigatorUtils.push(context, LoginRouter.licensePage);
                    },
                    text: '进入首页',
                  )
                ]))));
  }
}
