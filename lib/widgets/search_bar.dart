import 'package:certificate_pass/resources/resources.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  SearchBar(
      {Key? key,
      this.enablePrefixIcon = true,
      this.enableSuffixIcon = false,
      this.disabled = false,
      this.hintText = '搜索'})
      : super(key: key);

  bool enablePrefixIcon;
  bool enableSuffixIcon;
  String hintText;
  bool disabled;

  @override
  _SearchBarState createState() {
    return _SearchBarState();
  }
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _controller = TextEditingController();
  late FocusNode _focusNode;
  bool _offstage = true;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _controller.addListener(() {
      var isVisible = _controller.text.isNotEmpty;
      _updateDelIconVisible(isVisible);
    });
  }

  _updateDelIconVisible(bool isVisible) {
    setState(() {
      _offstage = !isVisible;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 30,
        child: Row(children: [
          Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5)),
                height: double.infinity,
                margin: !_offstage
                    ? const EdgeInsets.only(left: 16)
                    : const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          flex: 1,
                          child: TextField(
                            enabled: !widget.disabled,
                            controller: _controller,
                            autofocus: false,
                            focusNode: _focusNode,
                            style: TextStyle(fontSize: 14, color: Colors.black),
                            textAlignVertical: TextAlignVertical.center,
                            maxLines: 1,
                            decoration: InputDecoration(
                              isCollapsed: true,
                              contentPadding: const EdgeInsets.only(left: 20),
                              hintText: widget.hintText,
                              border: InputBorder.none,
                              prefixIcon: widget.enablePrefixIcon
                                  ? Icon(Icons.search)
                                  : null,
                              suffixIcon: widget.enableSuffixIcon
                                  ? Icon(Icons.search)
                                  : null,
                              hintStyle: TextStyle(
                                  fontSize: 14, color: Colors.grey[400]),
                            ),
                            onTap: () {
                              _focusNode.requestFocus();
                            },
                          )),
                      Gaps.hGap16,
                      Offstage(
                        offstage: _offstage,
                        child: GestureDetector(
                          onTap: () => {_controller.clear()},
                          child: Icon(Icons.cancel, color: Colors.grey[400]),
                        ),
                      ),
                      Gaps.hGap4,
                    ]),
              )),
          Offstage(
            offstage: _offstage,
            child: GestureDetector(
              onTap: () {
                _controller.clear();
                _focusNode.unfocus();
              },
              child: Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Text("取消",
                    style: TextStyle(fontSize: 16, color: Color(0xFF3D7DFF))),
              ),
            ),
          ),
        ]));
  }
}
