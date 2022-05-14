import 'package:bruno/bruno.dart';
import 'package:certificate_pass/pages/profile/profile_router.dart';
import 'package:certificate_pass/resources/gaps.dart';
import 'package:certificate_pass/routes/fluro_navigator.dart';
import 'package:certificate_pass/utils/image_utils.dart';
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
        Divider(
          height: 30,
        ),
        _buildOptions()
      ],
    )));
  }

  Widget _buildProfileInfo() {
    return GestureDetector(
        child: Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              Row(
                children: [
                  ClipOval(
                    child: LoadImage(
                      'avatar',
                      format: ImageFormat.jpeg,
                      width: 70,
                    ),
                  ),
                  Gaps.hGap16,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '学生国栋',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Gaps.vGap4,
                      Text('大二',
                          style: TextStyle(fontSize: 13, color: Colors.grey)),
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
                            textPadding: EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
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
            ])),
        onTap: () {
          NavigatorUtils.push(context, ProfileRouter.profileInfo,
              arguments: {"type": 'student'});
        });
  }

  Widget _buildSingleOption(
      {required String title, required Icon icon, GestureTapCallback? onTap}) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 6),
        child: GestureDetector(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                icon,
                Gaps.hGap16,
                Text(
                  title,
                  style: TextStyle(fontSize: 16),
                )
              ]),
              Align(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.keyboard_arrow_right))
            ],
          ),
          onTap: onTap,
        ));
  }

  Widget _buildOptions() {
    return Column(children: [
      _buildSingleOption(
          title: '已获得证书', icon: Icon(Icons.perm_identity, color: Colors.blue)),
      _buildSingleOption(
          title: '我的提醒',
          icon: Icon(Icons.notifications_active_outlined, color: Colors.cyan)),
      _buildSingleOption(
          title: '我的备忘',
          icon: Icon(Icons.event_note_outlined, color: Colors.brown)),
      Divider(
        height: 30,
      ),
      _buildSingleOption(
          title: 'VIP',
          icon: Icon(
            Icons.verified_outlined,
            color: Colors.orange,
          )),
      _buildSingleOption(title: '订单物流', icon: Icon(Icons.shopping_cart)),
      Divider(
        height: 30,
      ),
      _buildSingleOption(
          title: '消息', icon: Icon(Icons.message, color: Colors.orange[300]!)),
      _buildSingleOption(
          title: '客服中心',
          icon: Icon(Icons.perm_identity_outlined, color: Colors.black)),
      Divider(
        height: 30,
      ),
      _buildSingleOption(
          title: '设置',
          icon: Icon(Icons.settings, color: Colors.cyan[900]),
          onTap: () {
            NavigatorUtils.push(context, ProfileRouter.settings);
          }),
      _buildSingleOption(
          title: '开发者名单',
          icon: Icon(Icons.build_circle_rounded, color: Colors.cyan[900]),
          onTap: () {
            NavigatorUtils.push(context, ProfileRouter.developer);
          }),
    ]);
  }
}
