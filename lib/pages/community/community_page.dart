import 'package:bruno/bruno.dart';
import 'package:certificate_pass/pages/community/widgets/post_card.dart';
import 'package:certificate_pass/resources/resources.dart';
import 'package:certificate_pass/resources/styles.dart';
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
      body: Column(
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
    return Expanded(
        child: TabBarView(controller: _tabController, children: [
      _buildPostGallery(),
      _buildPostGallery(),
      _buildPostGallery()
    ]));
  }

  Widget _buildPostGallery() {
    return Column(children: [
      PostCard(),
      PostCard(),
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
