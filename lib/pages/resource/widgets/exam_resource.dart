import 'package:bruno/bruno.dart';
import 'package:certificate_pass/pages/resource/resource_router.dart';
import 'package:certificate_pass/routes/fluro_navigator.dart';
import 'package:flutter/material.dart';

class ExamResource extends StatefulWidget {
  ExamResource({Key? key}) : super(key: key);

  @override
  _ExamResourceState createState() {
    return _ExamResourceState();
  }
}

class _ExamResourceState extends State<ExamResource>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabsTitle.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<String> _tabsTitle = ['题库', '笔记', '课程'];

  late TabController _tabController;

  Widget _buildTabs() {
    return BrnTabBar(controller: _tabController, tabs: [
      for (int i = 0; i < _tabsTitle.length; i++) BadgeTab(text: _tabsTitle[i])
    ]);
  }

  Map<String, List<String>> cardContent = {
    "题库": ["听力练习题", "阅读理解", "", "", "", ""],
    "笔记": ["高级句子整理", "重难点单词整理", "", "", "", ""],
    "课程": ["四级写作课程", "听力高分技巧", "", "", "", ""]
  };

  Widget _buildTabBarView() {
    return Expanded(
        child: TabBarView(controller: _tabController, children: [
      for (int i = 0; i < _tabsTitle.length; i++)
        Column(children: [
          if (i == 0)
            Padding(
                padding: EdgeInsets.only(top: 15),
                child: BrnNormalButton(
                  text: '模拟测试',
                  onTap: () {
                    NavigatorUtils.push(
                        context, ResourceRouter.imitatedTestPage);
                  },
                  backgroundColor: Color(0xFF4252E9),
                  insertPadding:
                      EdgeInsets.symmetric(horizontal: 50, vertical: 13),
                  borderRadius: BorderRadius.circular(5),
                )),
          Expanded(
              child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 30,
            mainAxisSpacing: 50,
            padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
            children: [
              for (int j = 0; j < 6; j++)
                Container(
                  decoration: BoxDecoration(border: Border.all()),
                  child: Center(child: Text(cardContent[_tabsTitle[i]]![j])),
                )
            ],
          )),
          BrnNormalButton(
              text: '错题本',
              onTap: () {
                NavigatorUtils.push(context, ResourceRouter.imitatedTestPage);
              },
              backgroundColor: Color(0xFF4252E9),
              insertPadding: EdgeInsets.symmetric(horizontal: 50, vertical: 13),
              borderRadius: BorderRadius.circular(100))
        ])
    ]));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
        child: Column(children: [_buildTabs(), _buildTabBarView()]));
  }
}
