import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecommendCard extends StatelessWidget {
  RecommendCard(
      {Key? key, required this.title, this.icon, required this.subTitle})
      : super(key: key);

  String title;
  String subTitle;
  Widget? icon;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 100,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            )),
        Row(children: [
          Text(subTitle, style: TextStyle(color: Colors.grey[500])),
          // icon != null
          //     ? Container(
          //         margin: EdgeInsets.only(left: 20),
          //         child: icon,
          //       )
          //     : Container()
        ]),
      ]),
    );
  }
}

class RecommendCardList extends StatelessWidget {
  RecommendCardList({Key? key, required this.cards}) : super(key: key);

  final List<RecommendCard> cards;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: cards,
            )),
      ],
    );
  }
}
