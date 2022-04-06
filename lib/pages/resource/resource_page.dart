import 'package:bruno/bruno.dart';
import 'package:certificate_pass/resources/resources.dart';
import 'package:flutter/material.dart';

class ResourcePage extends StatefulWidget {
  ResourcePage({Key? key}) : super(key: key);

  @override
  _ResourcePageState createState() {
    return _ResourcePageState();
  }
}

class _ResourcePageState extends State<ResourcePage> {
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
        child:
            Scaffold(body: Column(children: [_buildHeader(), _buildBody()])));
  }

  Widget _buildHeader() {
    return Container(
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Icon(
              Icons.search,
              size: 24,
              color: Colors.black,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('资料', style: TextStyles.textBold26),
              DropdownButton<String>(
                hint: Text('未添加'),
                items: [],
                onChanged: (obj) {},
                borderRadius: BorderRadius.circular(1),
              )
            ],
          )
        ],
      ),
      decoration: BoxDecoration(border: Border(bottom: BorderSide())),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
    );
  }

  Widget _buildBody() {
    return Expanded(
        child: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('暂无证书信息，快去报名吧', style: TextStyles.textSize16),
        Gaps.vGap16,
        BrnNormalButton(
          text: '去报考',
          backgroundColor: Color(0xFF4252E9),
          insertPadding: EdgeInsets.symmetric(horizontal: 50, vertical: 13),
          borderRadius: BorderRadius.circular(50),
        )
      ],
    )));
  }
}
