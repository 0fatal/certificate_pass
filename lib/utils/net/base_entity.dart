import 'package:certificate_pass/utils/generated/json/base/json_convert_content.dart';
import 'package:certificate_pass/utils/res/constant.dart';

class BaseEntity<T> {
  int? code;
  late String msg;
  T? data;

  BaseEntity(this.code, this.msg,this.data);

  BaseEntity.fromJson(Map<String,dynamic> json) {
    code = json[Constant.code] as int?;
    msg = json[Constant.message] as String;
    if(json.containsKey(Constant.data)) {
      data = _generateOBJ<T>(json[Constant.data] as Object);
    }
  }

  T? _generateOBJ<O>(Object json) {
    if(T.toString() == 'String') {
      return json.toString() as T;
    } else if (T.toString() == 'Map<dynamic, dynamic>') {
      return json as T;
    } else {
      return JsonConvert.fromJsonAsT<T>(json);
    }
  }
}