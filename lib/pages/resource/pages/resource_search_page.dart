import 'package:certificate_pass/routes/fluro_navigator.dart';
import 'package:certificate_pass/widgets/my_app_bar.dart';
import 'package:certificate_pass/widgets/my_scroll_view.dart';
import 'package:certificate_pass/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class ResourceSearchPage extends StatefulWidget {
  ResourceSearchPage({Key? key}) : super(key: key);

  @override
  _ResourceSearchPageState createState() {
    return _ResourceSearchPageState();
  }
}

class _ResourceSearchPageState extends State<ResourceSearchPage> {
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
          ],
        ));
  }
}
