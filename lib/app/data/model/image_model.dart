class Images {
  Images({
    required this.detail,
  });
  late final List<Detail> detail;

  Images.fromJson(Map<String, dynamic> json) {
    detail = List.from(json['detail']).map((e) => Detail.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['detail'] = detail.map((e) => e.toJson()).toList();
    return data;
  }
}

class Detail {
  Detail({
    required this.type,
    required this.loc,
    required this.msg,
    this.input,
  });
  late final String type;
  late final List<String> loc;
  late final String msg;
  late final Null input;

  Detail.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    loc = List.castFrom<dynamic, String>(json['loc']);
    msg = json['msg'];
    input = null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['type'] = type;
    data['loc'] = loc;
    data['msg'] = msg;
    data['input'] = input;
    return data;
  }
}
