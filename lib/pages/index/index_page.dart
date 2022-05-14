import 'package:bruno/bruno.dart';
import 'package:certificate_pass/pages/index/index_router.dart';
import 'package:certificate_pass/pages/index/widgets/certificate_card.dart';
import 'package:certificate_pass/pages/index/widgets/exam_info_banner.dart';
import 'package:certificate_pass/pages/index/widgets/recommend_card.dart';
import 'package:certificate_pass/resources/gaps.dart';
import 'package:certificate_pass/routes/fluro_navigator.dart';
import 'package:certificate_pass/widgets/my_scroll_view.dart';
import 'package:certificate_pass/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  _IndexPageState createState() {
    return _IndexPageState();
  }
}

class _IndexPageState extends State<IndexPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabBar.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<String> _tabBar = ['热门推广'];
  late TabController _tabController;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
            body: MyScrollView(children: [
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BrnTagCustom.buildBorderTag(
                      tagText: '学生',
                      textColor: Colors.red,
                      borderColor: Colors.orangeAccent,
                      borderWidth: 2,
                      fontSize: 14,
                      textPadding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                    ),
                    Expanded(
                        child: GestureDetector(
                            child: SearchBar(
                              enablePrefixIcon: true,
                              disabled: true,
                              hintText: '请输入要查询的证书或官网',
                            ),
                            onTap: () => NavigatorUtils.push(
                                context, IndexRouter.certificateDetail)))
                  ]),
            ),
            ExamInfoBanner(
              examDate: DateTime.parse("2022-12-18 15:00:00"),
              examName: '2022年下半年CET6',
            ),
            BrnTabBar(
                backgroundcolor: Colors.grey[50]!,
                controller: _tabController,
                tabs: [
                  for (int i = 0; i < _tabBar.length; i++)
                    BadgeTab(
                      text: _tabBar[i],
                    )
                ],
                onTap: (state, index) {}),
            Gaps.vGap8,
            SizedBox(
              width: double.infinity,
              height: 100,
              child: TabBarView(controller: _tabController, children: [
                RecommendCardList(cards: [
                  RecommendCard(
                      title: '名师授课',
                      subTitle: '咨询了解',
                      icon: Icon(Icons.tv, color: Colors.blue, size: 24)),
                  RecommendCard(
                      title: '备考好物',
                      subTitle: '学习福利',
                      icon: Icon(Icons.file_download,
                          color: Colors.blue, size: 24)),
                  RecommendCard(
                      title: '报考咨询',
                      subTitle: '在线答疑',
                      icon: Icon(Icons.message_outlined,
                          color: Colors.blue, size: 24))
                ])
              ]),
            ),
            SizedBox(
              width: double.infinity,
              child: Text(
                '根据您的信息为您推荐：',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),
            Gaps.vGap8,
            CertificateCard(
                title: '初级注册会计师',
                bgColor: Color(0xFFCECDEE),
                titleBgColor: Color(0xFF5f52e6)),
            Gaps.vGap12,
            CertificateCard(
                title: '全国计算机二级',
                bgColor: Color(0xFFE1E0EE),
                titleBgColor: Color(0xFF2587E5)),
            Gaps.vGap12,
            CertificateCard(
                title: '中小学生教室资格证',
                bgColor: Color(0xFFCECDEE),
                titleBgColor: Color(0xFF52CAE6)),
            Gaps.vGap12,
          ]))
    ])));
  }
}
