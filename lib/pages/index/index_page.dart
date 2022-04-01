import 'package:certificate_pass/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  _IndexPageState createState() {
    return _IndexPageState();
  }
}

class _IndexPageState extends State<IndexPage> {
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
        appBar: AppBar(
          title: Row(children: [
            Text('学生'),
            SearchBar(
              enablePrefixIcon: false,
              hintText: '请输入要查询的证书或官网',
            ),
          ]),
          titleSpacing: 0,
          toolbarHeight: 44,
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: const Text('IndexPage'));
  }
}
