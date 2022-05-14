import 'package:bruno/bruno.dart';
import 'package:certificate_pass/pages/resource/resource_router.dart';
import 'package:certificate_pass/resources/gaps.dart';
import 'package:certificate_pass/routes/fluro_navigator.dart';
import 'package:certificate_pass/widgets/circle_button.dart';
import 'package:certificate_pass/widgets/my_app_bar.dart';
import 'package:certificate_pass/widgets/my_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuDefine {
  late Icon icon;
  String? title;

  MenuDefine({this.title, required this.icon});
}

class ProblemPage extends StatelessWidget {
  ProblemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: MyAppBar(centerTitle: "听力练习题"),
        body: MyScrollView(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildMenu([
                MenuDefine(
                    icon: Icon(Icons.people_alt,
                        color: Color(0xFFF2852C), size: 20),
                    title: "约会问题"),
                MenuDefine(
                    icon: Icon(Icons.monetization_on_outlined,
                        color: Color(0xFFF2852C), size: 20),
                    title: "价格问题"),
                MenuDefine(
                    icon: Icon(Icons.wb_sunny,
                        color: Color(0xFFF2852C), size: 20),
                    title: "天气问题"),
                MenuDefine(
                    icon: Icon(Icons.airport_shuttle,
                        color: Color(0xFFF2852C), size: 20),
                    title: "交通问题"),
                MenuDefine(
                    icon: Icon(Icons.fastfood_outlined,
                        color: Color(0xFFF2852C), size: 20),
                    title: "饮食问题"),
              ], "短对话", Color(0xFFF2852C)),
              Gaps.vGap32,
              Gaps.vGap5,
              _buildMenu([
                MenuDefine(
                    icon:
                        Icon(Icons.text_fields, color: Colors.blue, size: 20)),
                MenuDefine(icon: Icon(Icons.add, color: Colors.blue, size: 20)),
                MenuDefine(
                    icon: Icon(Icons.book_outlined,
                        color: Colors.blue, size: 20)),
                MenuDefine(
                    icon: Icon(Icons.remove_red_eye_outlined,
                        color: Colors.blue, size: 20)),
                MenuDefine(
                    icon: Icon(Icons.access_alarm_outlined,
                        color: Colors.blue, size: 20)),
              ], "长对话", Colors.blue),
              Gaps.vGap15,
              BrnNormalButton(
                  text: '错题本',
                  onTap: () {
                    NavigatorUtils.push(context, ResourceRouter.problemBook);
                  },
                  backgroundColor: Color(0xFF4252E9),
                  insertPadding:
                      EdgeInsets.symmetric(horizontal: 50, vertical: 13),
                  borderRadius: BorderRadius.circular(100))
            ]));
  }

  Widget _buildMenu(List<MenuDefine> menus, String title, Color themeColor) {
    return Column(children: [
      Container(
        child: Row(
          children: [
            Container(
              width: 4,
              height: 18,
              child: Text(""),
              margin: EdgeInsets.only(right: 7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: themeColor,
              ),
            ),
            Text(title)
          ],
        ),
        margin: EdgeInsets.symmetric(horizontal: 40),
        padding: EdgeInsets.only(bottom: 10),
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey[300]!))),
      ),
      GridView.count(
        shrinkWrap: true,
        crossAxisCount: 3,
        physics: const NeverScrollableScrollPhysics(), // 禁止滚动
        crossAxisSpacing: 30,
        mainAxisSpacing: 40,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        children: [
          for (MenuDefine menu in menus)
            Column(children: [
              CircleButton(
                  size: 56, icon: menu.icon, bgColor: Color(0xFFEEEEEE)),
              Text(menu.title ?? '')
            ])
        ],
      )
    ]);
  }
}
