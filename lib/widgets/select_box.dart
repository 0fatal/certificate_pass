import 'dart:math';

import 'package:flutter/material.dart';

class SelectBox extends StatefulWidget {
  SelectBox(
      {Key? key,
      required this.options,
      required this.onChanged,
      required this.value})
      : super(key: key);

  final List<String> options;
  final String value;
  final ValueChanged<String> onChanged;

  @override
  _SelectBoxState createState() {
    return _SelectBoxState();
  }
}

class _SelectBoxState extends State<SelectBox> {
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
    return Container(
        width: double.infinity,
        height: min(40.0 * widget.options.length, 300),
        decoration: BoxDecoration(
            border: Border.symmetric(
                horizontal: BorderSide(color: Colors.grey[400]!))),
        child: ListView.builder(
            itemCount: widget.options.length,
            itemBuilder: (BuildContext context, int index) => GestureDetector(
                  onTap: () => widget.onChanged(widget.options[index]),
                  child: Container(
                      height: 40,
                      padding: EdgeInsets.only(left: 16),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          border: index == widget.options.length - 1
                              ? Border.all(color: Colors.grey[400]!)
                              : Border.merge(
                                  Border(
                                      top:
                                          BorderSide(color: Colors.grey[400]!)),
                                  Border.symmetric(
                                      vertical: BorderSide(
                                          color: Colors.grey[400]!))),
                          color: widget.options[index] == widget.value
                              ? Color(0xFF4252E9)
                              : Colors.white),
                      child: Text(
                        widget.options[index],
                        style: TextStyle(
                            color: widget.options[index] == widget.value
                                ? Colors.white
                                : Colors.black),
                      )),
                )));
  }
}
