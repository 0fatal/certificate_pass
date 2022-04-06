import 'package:certificate_pass/resources/gaps.dart';
import 'package:certificate_pass/widgets/load_image.dart';
import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  PostCard(
      {Key? key,
      required this.starCount,
      required this.avatar,
      required this.commentCount,
      required this.nickname,
      required this.postTime,
      required this.summary,
      required this.tabTitle})
      : super(key: key);
  String avatar;
  String nickname;
  DateTime postTime;
  int commentCount;
  int starCount;
  String summary;
  String tabTitle;

  @override
  _PostCardState createState() {
    return _PostCardState();
  }
}

class _PostCardState extends State<PostCard> {
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
    String postTime;
    int sec = DateTime.now().difference(widget.postTime).inSeconds;
    if (sec < 60) {
      postTime = '$sec秒前发布';
    } else if (sec / 60 < 60) {
      postTime = '${sec ~/ 60}分钟前发布';
    } else if (sec / 60 / 60 < 24) {
      postTime = '${(sec / 60 ~/ 60).toInt()}小时前发布';
    } else {
      postTime = '${sec / 60 / 60 ~/ 24}天前发布';
    }

    return Container(
      decoration: BoxDecoration(color: Colors.white),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(children: [
                ClipOval(
                  child: LoadImage(
                    widget.avatar,
                    width: 32,
                    height: 32,
                  ),
                ),
                Gaps.hGap10,
                Text(widget.nickname),
              ]),
              TextButton(
                  onPressed: () {},
                  child: Row(children: [Icon(Icons.add), Text('关注')]))
            ],
          ),
          Gaps.vGap4,
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  widget.summary,
                )),
          ),
          Gaps.vGap12,
          Row(children: [
            Gaps.hGap10,
            _buildStarCount(widget.starCount),
            Gaps.hGap8,
            _buildCommentCount(widget.commentCount)
          ]),
          Gaps.vGap8,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.tabTitle,
                      style: TextStyle(letterSpacing: 0.2, color: Colors.grey)),
                  Text(postTime,
                      style: TextStyle(letterSpacing: 0.2, color: Colors.grey))
                ]),
          )
        ],
      ),
    );
  }

  Widget _buildStarCount(int starCount) {
    return Row(
      children: [
        Icon(Icons.thumb_up_alt_outlined, color: Colors.grey),
        Gaps.hGap4,
        SizedBox(
          width: 38,
          child: Text(
            starCount == 0 ? '点赞' : starCount.toString(),
            style: TextStyle(color: Colors.grey),
          ),
        )
      ],
    );
  }

  Widget _buildCommentCount(int commentCount) {
    return Row(
      children: [
        Icon(Icons.comment_outlined, color: Colors.grey),
        Gaps.hGap4,
        SizedBox(
            width: 38,
            child: Text(commentCount == 0 ? '评论' : commentCount.toString(),
                style: TextStyle(color: Colors.grey)))
      ],
    );
  }
}
