import 'package:certificate_pass/pages/login/login_router.dart';
import 'package:certificate_pass/pages/login/widgets/page_header.dart';
import 'package:certificate_pass/resources/gaps.dart';
import 'package:certificate_pass/routes/fluro_navigator.dart';
import 'package:certificate_pass/widgets/my_button.dart';
import 'package:certificate_pass/widgets/my_scroll_view.dart';
import 'package:certificate_pass/widgets/select_box.dart';
import 'package:flutter/material.dart';

class AreaSelectPage extends StatefulWidget {
  AreaSelectPage({Key? key}) : super(key: key);

  @override
  _AreaSelectPageState createState() {
    return _AreaSelectPageState();
  }
}

class _AreaSelectPageState extends State<AreaSelectPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<String> areaOptions = ['北京', '上海', '广州', '深圳', '重庆', '成都', '西安', '安徽'];
  String currentArea = '北京';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
            body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: MyScrollView(children: [
                  Gaps.vGap32,
                  PageHeader(title: '请选择地区', subtitle: '请选择所在地区，以便精准推荐证书与资料'),
                  SelectBox(
                      options: areaOptions,
                      onChanged: (val) {
                        setState(() {
                          currentArea = val;
                        });
                      },
                      value: currentArea),
                  SizedBox(height: 60),
                  MyButton(
                    onPressed: () {
                      NavigatorUtils.push(
                          context, LoginRouter.identitySelectPage);
                    },
                    text: '进入下一页',
                  ),
                ]))));
  }
}
