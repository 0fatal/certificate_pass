import 'package:certificate_pass/resources/gaps.dart';
import 'package:certificate_pass/widgets/my_app_bar.dart';
import 'package:certificate_pass/widgets/my_button.dart';
import 'package:certificate_pass/widgets/my_scroll_view.dart';
import 'package:flutter/material.dart';

class LicensePage extends StatelessWidget {
  LicensePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: MyAppBar(
            centerTitle: '用户协议',
            color: Colors.white,
            backgroundColor: Color(0xFF1890FF)),
        body: MyScrollView(
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all()),
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              child: Text(
                  '本协议为证证通《使用协议》的修订版自2021年12月20日公布。\n请您务必审慎间读、充分理解协议中相关条款内容,您一旦同意此协议,即视为您已了解并完全同意本协议各项内容,包括证证通对使用协议随时所做的任何修改。如您不同意本协议或随时对其的修改,请您立即停止及使用证证通所提供的全部服务。 \n【审慎阅读】您在申请注册流程中点击同意本协议之前,应当认真间读本协议。请您务必审慎间读、充分理解各条款内容,特别是免除或者限制责任的条款,法律适用和争议解决条款。免除或者限制责任的条款将以粗体下划线标识,您应重点阅读。如您对协议有任何疑间,可向淘宝平台客服咨询。\n【签约动作】当您按照注册页面提示填写信息、阅读并同意本协议且完成全部注册程序后,即表示您已充分阅读、理解并接受本协议的全部内容。闻读本协议的过程中,如果您不同意本协议或其中任何条款约定,您应立即停止注册程序。 \n\n软件使用许可 \n\n一、定义\n1.许可软件: 是指由我们开发的,供您从下载平台下载,并仅限在相应系统手持移动终端中安装、使用的软件系统。',
                  style: TextStyle(letterSpacing: 2, fontSize: 16)),
            ),
            Gaps.vGap16,
            Align(
              alignment: Alignment.center,
              child: MyButton(
                text: '同意',
                onPressed: () {},
                minWidth: 200,
                backgroundColor: Color(0xFF1890FF),
                radius: 12,
              ),
            )
          ],
        ));
  }
}
