import 'dart:convert';
/// nickName : "myNickName"
/// tier : "B1"
/// position : ["top","support"]

IdModel idModelFromJson(String str) => IdModel.fromJson(json.decode(str));
String idModelToJson(IdModel data) => json.encode(data.toJson());
class IdModel {
  IdModel({
      String? nickName, 
      String? tier, 
      List<String>? position,}){
    _nickName = nickName;
    _tier = tier;
    _position = position;
}

  IdModel.fromJson(dynamic json) {
    _nickName = json['nickName'];
    _tier = json['tier'];
    _position = json['position'] != null ? json['position'].cast<String>() : [];
  }
  String? _nickName;
  String? _tier;
  List<String>? _position;
IdModel copyWith({  String? nickName,
  String? tier,
  List<String>? position,
}) => IdModel(  nickName: nickName ?? _nickName,
  tier: tier ?? _tier,
  position: position ?? _position,
);
  String? get nickName => _nickName;
  String? get tier => _tier;
  List<String>? get position => _position;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['nickName'] = _nickName;
    map['tier'] = _tier;
    map['position'] = _position;
    return map;
  }

}