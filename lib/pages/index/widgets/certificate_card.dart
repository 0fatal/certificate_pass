import 'package:certificate_pass/resources/gaps.dart';
import 'package:flutter/material.dart';

class CertificateCard extends StatelessWidget {
  CertificateCard(
      {Key? key,
      required this.title,
      required this.bgColor,
      required this.titleBgColor})
      : super(key: key);

  String title;
  Color titleBgColor;
  Color bgColor;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: bgColor,
          border: Border.all(color: Colors.grey[700]!)),
      child: Column(
        children: [
          Gaps.vGap12,
          SizedBox(
            width: 300,
            height: 50,
            child: Container(
              decoration: BoxDecoration(
                  color: titleBgColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey[400]!)),
              child: Center(
                child: Text(title,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ),
          ),
          Gaps.vGap24,
          buildOperationBtn(context),
          Gaps.vGap8,
        ],
      ),
    );
  }

  Widget buildOperationBtn(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            child: Text('了解详情', style: TextStyle(color: Colors.white)),
            margin: EdgeInsets.symmetric(horizontal: 12),
            padding: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
                color: titleBgColor,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.grey[400]!))),
        Container(
            child: Text('添加备考', style: TextStyle(color: Colors.white)),
            margin: EdgeInsets.symmetric(horizontal: 12),
            padding: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
                color: titleBgColor,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.grey[400]!)))
      ],
    );
  }
}
