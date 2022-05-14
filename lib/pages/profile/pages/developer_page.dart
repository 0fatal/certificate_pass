import 'package:certificate_pass/resources/gaps.dart';
import 'package:certificate_pass/widgets/load_image.dart';
import 'package:certificate_pass/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DeveloperPage extends StatelessWidget {
  DeveloperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        centerTitle: "开发者名单",
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Gaps.vGap50,
          Gaps.vGap50,
          Center(
            child: ClipOval(
                clipBehavior: Clip.antiAlias,
                child: LoadImage(
                  "https://avatars.githubusercontent.com/u/72899968?s=40&v=4",
                  width: 100,
                  height: 100,
                )),
          ),
          Gaps.vGap8,
          Text(
            "ZacharyWin",
            style: TextStyle(fontSize: 26),
          ),
          Gaps.vGap8,
          InkWell(
            child: Text('https://github.com/ZacharyWin',
                style: TextStyle(
                    color: Colors.blue, decoration: TextDecoration.underline)),
            onTap: () => launch('https://github.com/ZacharyWin'),
          )
        ],
      ),
    );
  }
}
