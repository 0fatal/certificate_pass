JsonConvert jsonConvert = JsonConvert();

class JsonConvert {

  T? convert<T>(dynamic value) {
    if (value == null) {
      return null;
    }
    return asT<T>(value);
  }

  List<T?>? convertList<T>(List<dynamic>? value) {
    if (value == null) {
      return null;
    }
    try {
      return value.map((dynamic e) => asT<T>(e)).toList();
    } catch (e, stackTrace) {
      print('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

  List<T>? convertListNotNull<T>(dynamic value) {
    if (value == null) {
      return null;
    }
    try {
      return (value as List<dynamic>).map((dynamic e) => asT<T>(e)!).toList();
    } catch (e, stackTrace) {
      print('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }
  T? asT<T extends Object?>(dynamic value) {
    if (value is T) {
      return value;
    }
    final String type = T.toString();
    try {
      final String valueS = value.toString();
      if (type == "String") {
        return valueS as T;
      } else if (type == "int") {
        final int? intValue = int.tryParse(valueS);
        if (intValue == null) {
          return double.tryParse(valueS)?.toInt() as T?;
        } else {
          return intValue as T;
        }
      } else if (type == "double") {
        return double.parse(valueS) as T;
      } else if (type ==  "DateTime") {
        return DateTime.parse(valueS) as T;
      } else if (type ==  "bool") {
        if (valueS == '0' || valueS == '1') {
          return (valueS == '1') as T;
        }
        return (valueS == 'true') as T;
      } else {
        return JsonConvert.fromJsonAsT<T>(value);
      }
    } catch (e, stackTrace) {
      print('asT<$T> $e $stackTrace');
      return null;
    }
  }
  //Go back to a single instance by type
  static M? _fromJsonSingle<M>(Map<String, dynamic> json) {
    final String type = M.toString();
    // if(type == (BankEntity).toString()){
    //   return BankEntity.fromJson(json) as M;
    // }
    // if(type == (CityEntity).toString()){
    //   return CityEntity.fromJson(json) as M;
    // }
    // if(type == (GoodsSortEntity).toString()){
    //   return GoodsSortEntity.fromJson(json) as M;
    // }
    // if(type == (SearchEntity).toString()){
    //   return SearchEntity.fromJson(json) as M;
    // }
    // if(type == (SearchItems).toString()){
    //   return SearchItems.fromJson(json) as M;
    // }
    // if(type == (SearchItemsOwner).toString()){
    //   return SearchItemsOwner.fromJson(json) as M;
    // }
    // if(type == (SearchItemsLicense).toString()){
    //   return SearchItemsLicense.fromJson(json) as M;
    // }
    // if(type == (UserEntity).toString()){
    //   return UserEntity.fromJson(json) as M;
    // }

    print("$type not found");

    return null;
  }

  //list is returned by type
  static M? _getListChildType<M>(List<dynamic> data) {
    // if(<BankEntity>[] is M){
    //   return data.map<BankEntity>((e) => BankEntity.fromJson(e)).toList() as M;
    // }
    // if(<CityEntity>[] is M){
    //   return data.map<CityEntity>((e) => CityEntity.fromJson(e)).toList() as M;
    // }
    // if(<GoodsSortEntity>[] is M){
    //   return data.map<GoodsSortEntity>((e) => GoodsSortEntity.fromJson(e)).toList() as M;
    // }
    // if(<SearchEntity>[] is M){
    //   return data.map<SearchEntity>((e) => SearchEntity.fromJson(e)).toList() as M;
    // }
    // if(<SearchItems>[] is M){
    //   return data.map<SearchItems>((e) => SearchItems.fromJson(e)).toList() as M;
    // }
    // if(<SearchItemsOwner>[] is M){
    //   return data.map<SearchItemsOwner>((e) => SearchItemsOwner.fromJson(e)).toList() as M;
    // }
    // if(<SearchItemsLicense>[] is M){
    //   return data.map<SearchItemsLicense>((e) => SearchItemsLicense.fromJson(e)).toList() as M;
    // }
    // if(<UserEntity>[] is M){
    //   return data.map<UserEntity>((e) => UserEntity.fromJson(e)).toList() as M;
    // }

    print("${M.toString()} not found");

    return null;
  }

  static M? fromJsonAsT<M>(dynamic json) {
    if(json == null){
      return null;
    }
    if (json is List) {
      return _getListChildType<M>(json);
    } else {
      return _fromJsonSingle<M>(json as Map<String, dynamic>);
    }
  }
}