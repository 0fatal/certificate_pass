import 'package:certificate_pass/pages/index/index_router.dart';
import 'package:certificate_pass/resources/resources.dart';
import 'package:certificate_pass/routes/fluro_navigator.dart';
import 'package:certificate_pass/widgets/my_app_bar.dart';
import 'package:certificate_pass/widgets/my_scroll_view.dart';
import 'package:certificate_pass/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() {
    return _SearchPageState();
  }
}

class _SearchPageState extends State<SearchPage> {
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
    return Scaffold(
        appBar: MyAppBar(
          onPressed: () {
            NavigatorUtils.goBack(context);
          },
          centerTitle: '搜索',
        ),
        body: MyScrollView(
          children: [
            SearchBar(),
            Gaps.vGap24,
            _buildHotSearch(),
            Gaps.vGap50,
            Gaps.vGap24,
            _buildSearchHistory()
          ],
        ));
  }

  Widget _buildSearchTags(String title, List<String> tags) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                    padding: EdgeInsets.only(left: 14),
                    child: Text(title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.grey[700])))),
            Gaps.vGap16,
            Wrap(
                spacing: 8,
                runSpacing: 14,
                children: tags
                    .map((tag) => Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                            color: Colors.grey[300]!,
                            borderRadius: BorderRadius.circular(4)),
                        child: GestureDetector(
                            child: Text(tag),
                            onTap: () => NavigatorUtils.push(
                                context, IndexRouter.searchPage))))
                    .toList())
          ],
        ));
  }

  Widget _buildHotSearch() {
    return _buildSearchTags('热门搜索', [
      'XXXX证书',
      'XXXX证书',
      'XXXXX官网',
      'XXXX证书',
      'XXXX证书',
      'XXXXX官网',
      'XXXX证书',
      'XXXX证书',
      'XXXXX官网'
    ]);
  }

  Widget _buildSearchHistory() {
    return _buildSearchTags('搜索历史', [
      'XXXX证书',
      'XXXX证书',
      'XXXXX官网',
      'XXXX证书',
      'XXXX证书',
      'XXXXX官网',
      'XXXX证书',
      'XXXX证书',
      'XXXXX官网'
    ]);
  }
}
