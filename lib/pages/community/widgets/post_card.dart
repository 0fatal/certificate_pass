import 'package:certificate_pass/widgets/load_image.dart';
import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  PostCard({Key? key}) : super(key: key);

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
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Row(children: [
                ClipOval(
                  child: LoadImage(
                    'https://avatars.githubusercontent.com/u/72899968?s=40&v=4',
                    width: 32,
                    height: 32,
                  ),
                ),
                Text('小陈老师'),
              ]),
              TextButton(
                  onPressed: () {},
                  child: Row(children: [Icon(Icons.add), Text('关注')]))
            ],
          ),
          Text(''),
          Row(),
          Row(children: [_buildStarCount(10), _buildCommentCount(10)])
        ],
      ),
    );
  }

  Widget _buildStarCount(int starCount) {
    return Row(
      children: [Icon(Icons.thumb_up_alt_outlined), Text(starCount.toString())],
    );
  }

  Widget _buildCommentCount(int commentCount) {
    return Row(
      children: [Icon(Icons.comment), Text(commentCount.toString())],
    );
  }
}
