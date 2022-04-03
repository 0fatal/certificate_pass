import 'package:bruno/bruno.dart';
import 'package:certificate_pass/resources/resources.dart';
import 'package:certificate_pass/routes/fluro_navigator.dart';
import 'package:certificate_pass/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CertificateDetail extends StatelessWidget {
  CertificateDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: MyAppBar(
        onPressed: () => NavigatorUtils.goBack(context),
        customTitle: Align(
          alignment: Alignment.center,
          child: Container(
              width: 250,
              margin: EdgeInsets.symmetric(vertical: 6),
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: Color(0xFF4252E9),
                  borderRadius: BorderRadius.circular(4)),
              child: Text(
                '证书详情',
                style: TextStyle(color: Colors.white, fontSize: 18),
              )),
        ),
      ),
      body: Column(
        children: [
          Gaps.vGap12,
          Align(
              child: Text(
            '全国计算机二级等级考试',
            style: TextStyles.textBold18,
          )),
          _buildMainContent()
        ],
      ),
    );
  }

  Widget _buildMainContent() {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.grey)),
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '简介',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Text(
              '计算机二级考试是全国计算机等级考试（National Computer Rank Examination，简称NCRE）四个等级中的一个等级，由教育部考试中心主办，考核计算机基础知识和使用一种高级计算机语言编写程序以及上机调试的基本技能。考试采用全国统一命题、统一考试的形式，二级上机考试的成绩由考生交卷后由计算机直接评分给出，机器阅卷，并由考点汇总并与答题卡一起提交至教育部考试中心，教育部考试中心方面将试卷评阅完毕后，会将各省的成绩合格信息汇总并发回给各省的主考部门，并由各省的主考部门来决定具体的成绩公布的时间。'),
          Gaps.vGap12,
          Text(
            '内容',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          Text(
              '计算机二级考试包含：程序设计/办公软件高级应用，考核内容包括计算机语言与基础程序设计能力，要求参试者掌握一门计算机语言，可选类别有高级语言程序设计类、数据库程序设计类等；办公软件高级应用能力，要求参试者具有计算机应用知识及MS Office办公软件或WPS Office的高级应用能力，能够在实际办公环境中开展具体应用。'),
          Gaps.vGap12,
          Text('官网链接'),
          InkWell(
              onTap: () => launch('https://neea.edu.cn'),
              child: Text(
                'NCRE - 中国教育考试网 (neea.edu.cn)',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                    fontSize: 15),
              )),
          Gaps.vGap12,
          Text(
            '报考资格',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Text(
              '考生不受年龄、职业、学历等背景的限制，任何人均可根据自己学习和使用计算机的实际情况报考。每次考试报名的具体时间由各省（自治区、直辖市）级承办机构规定。考生按照有关规定到就近考点报名。'),
          Gaps.vGap12,
          Align(
            alignment: Alignment.bottomRight,
            child: BrnSmallMainButton(
              title: '添加报考',
              width: 120,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
