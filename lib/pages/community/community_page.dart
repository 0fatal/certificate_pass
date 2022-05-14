import 'package:bruno/bruno.dart';
import 'package:certificate_pass/pages/community/widgets/post_card.dart';
import 'package:certificate_pass/resources/resources.dart';
import 'package:certificate_pass/resources/styles.dart';
import 'package:certificate_pass/utils/image_utils.dart';
import 'package:certificate_pass/widgets/my_scroll_view.dart';
import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
  CommunityPage({Key? key}) : super(key: key);

  @override
  _CommunityPageState createState() {
    return _CommunityPageState();
  }
}

class _CommunityPageState extends State<CommunityPage>
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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      body: MyScrollView(
        children: [_buildHeader(), _buildTabs(), _buildTabBarView()],
      ),
    ));
  }

  List<String> _tabsTitle = ['推荐', '大学英语四级', '全国计算机二级'];

  late TabController _tabController;

  Widget _buildTabs() {
    return BrnTabBar(controller: _tabController, tabs: [
      for (int i = 0; i < _tabsTitle.length; i++) BadgeTab(text: _tabsTitle[i])
    ]);
  }

  Widget _buildTabBarView() {
    return SizedBox(
        height: 700,
        child: TabBarView(controller: _tabController, children: [
          for (int i = 0; i < _tabsTitle.length; i++)
            _buildPostGallery(_tabsTitle[i])
        ]));
  }

  Widget _buildPostGallery(String tabTitle) {
    return Column(children: [
      PostCard(
        avatar: 'avatar',
        format: ImageFormat.jpeg,
        nickname: '小陈老师',
        summary: '英语听力考试的时候一定要提前看题目，画出关键词',
        starCount: 1632,
        commentCount: 236,
        postTime: DateTime(2022, 4, 5),
        tabTitle: tabTitle,
      ),
      PostCard(
        avatar: 'avatar',
        format: ImageFormat.jpeg,
        nickname: '小明',
        summary: '用了这个APP，考证轻松了不少，要安利给其他朋友',
        starCount: 66,
        commentCount: 32,
        postTime: DateTime(2022, 4, 6),
        tabTitle: tabTitle,
      ),
      PostCard(
        avatar: 'avatar',
        format: ImageFormat.jpeg,
        nickname: '赵大宝',
        summary: '我终于过了',
        starCount: 0,
        commentCount: 0,
        postTime: DateTime(2022, 4, 1),
        tabTitle: tabTitle,
      ),
    ]);
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('社区', style: TextStyles.textBold26),
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Icon(Icons.person, size: 24, color: Colors.deepPurpleAccent),
            Gaps.hGap8,
            Icon(Icons.message_rounded,
                size: 24, color: Colors.deepPurpleAccent)
          ])
        ],
      ),
    );
  }
}
