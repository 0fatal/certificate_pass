import 'package:certificate_pass/widgets/empty.dart';
import 'package:certificate_pass/widgets/my_app_bar.dart';
import 'package:certificate_pass/widgets/my_scroll_view.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: MyAppBar(
        centerTitle: '设置',
      ),
      body: MyScrollView(
        children: [
          _buildSingleOption(title: '账号与安全'),
          _buildSingleOption(title: '地址管理'),
          Divider(),
          _buildSingleOption(title: '护眼模式'),
          _buildSingleOption(title: '上课通知'),
          _buildSingleOption(title: '清楚缓存'),
          Divider(),
          _buildSingleOption(title: '关于')
        ],
      ),
    );
  }

  Widget _buildSingleOption(
      {required String title, GestureTapCallback? onTap, Widget? right}) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 4),
        child: GestureDetector(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Align(alignment: Alignment.topLeft, child: Text(title))
              ]),
              Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    children: [
                      right ?? Empty(),
                      Icon(Icons.keyboard_arrow_right)
                    ],
                  ))
            ],
          ),
          onTap: onTap,
        ));
  }
}
