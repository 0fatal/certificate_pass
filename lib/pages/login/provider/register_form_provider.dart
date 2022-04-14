import 'package:flutter/cupertino.dart';

class RegisterFormProvider extends ChangeNotifier {
  String _username = '';
  String _school = '';
  DateTime _birth = DateTime.now();
  String _grade = '';
  String _major = '计算机';
  String _major2 = '';
  List<String> _expectedCert = [];
  String _phone = '';

  String get username => _username;
  String get school => _school;
  DateTime get birth => _birth;
  String get grade => _grade;
  String get major => _major;
  List<String> get expectedCert => _expectedCert;
  String get phone => _phone;
  String get major2 => _major2;

  void update(
      {String? username,
      String? school,
      DateTime? birth,
      String? grade,
      String? major,
      String? phone,
      String? major2}) {
    _major = major ?? _major;
    _school = school ?? _school;
    _birth = birth ?? _birth;
    _grade = grade ?? _grade;
    _major = major ?? _major;
    _phone = phone ?? _phone;
    _major2 = major2 ?? _major2;
    notifyListeners();
  }

  void addCert(String cert) {
    _expectedCert.add(cert);
    notifyListeners();
  }

  void removeCert(String cert) {
    _expectedCert.remove(cert);
    notifyListeners();
  }
}
