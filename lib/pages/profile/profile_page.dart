import 'package:bruno/bruno.dart';
import 'package:certificate_pass/resources/gaps.dart';
import 'package:certificate_pass/widgets/load_image.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
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
        child: Scaffold(
            body: Column(
      children: [
        Container(
          child: _buildProfileInfo(),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        ),
        _buildOptions()
      ],
    )));
  }

  Widget _buildProfileInfo() {
    return Expanded(
        child: Row(children: [
      Expanded(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            ClipOval(
              child: LoadImage(
                'https://avatars.githubusercontent.com/u/72899968?s=40&v=4',
                width: 80,
              ),
            ),
            Gaps.hGap16,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '学生国栋',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Gaps.vGap4,
                Text('大二', style: TextStyle(fontSize: 13, color: Colors.grey)),
                Gaps.vGap4,
                Row(
                  children: [
                    BrnTagCustom.buildBorderTag(
                      tagText: 'VIP',
                      textColor: Color(0xFFFF89C2),
                      borderColor: Color(0xFFFF89C2),
                      borderWidth: 1,
                      fontSize: 14,
                      tagBorderRadius: BorderRadius.circular(6),
                      textPadding:
                          EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    ),
                    Gaps.hGap15,
                    Text('通币：26')
                  ],
                )
              ],
            )
          ],
        ),
        Icon(
          Icons.keyboard_arrow_right,
          size: 40,
          color: Colors.grey[500],
        )
      ]))
    ]));
  }

  Widget _buildSingleOption({required String title, required Icon icon}) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              Align(alignment: Alignment.topLeft, child: Icon(Icons.tv)),
              Gaps.hGap16,
              Align(alignment: Alignment.topLeft, child: Text(title))
            ]),
            Align(
                alignment: Alignment.bottomRight,
                child: Icon(Icons.keyboard_arrow_right))
          ],
        ));
  }

  Widget _buildOptions() {
    return Column(children: [
      _buildSingleOption(title: '已获得证书', icon: Icon(Icons.tv)),
      _buildSingleOption(title: '我的提醒', icon: Icon(Icons.tv)),
      _buildSingleOption(title: '我的备忘', icon: Icon(Icons.tv)),
      Divider(
        color: Colors.grey[400],
      ),
      _buildSingleOption(title: 'VIP', icon: Icon(Icons.tv)),
      _buildSingleOption(title: '订单物流', icon: Icon(Icons.tv)),
      Divider(
        color: Colors.grey[400],
      ),
      _buildSingleOption(title: '消息', icon: Icon(Icons.tv)),
      _buildSingleOption(title: '客服中心', icon: Icon(Icons.tv)),
      Gaps.vGap16,
      _buildSingleOption(title: '设置', icon: Icon(Icons.tv)),
    ]);
  }
}
