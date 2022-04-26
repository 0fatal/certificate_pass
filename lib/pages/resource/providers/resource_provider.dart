import 'package:flutter/cupertino.dart';

class ResourceProvider extends ChangeNotifier {
  String? currentExam = '大学英语四级';

  update({String? currentExam}) {
    this.currentExam = currentExam ?? this.currentExam;
    notifyListeners();
  }
}
