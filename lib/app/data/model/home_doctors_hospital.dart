class homeDoctorHospitalModel {
  List<Info>? info;

  homeDoctorHospitalModel({this.info});

  homeDoctorHospitalModel.fromJson(Map<String, dynamic> json) {
    if (json['info'] != null) {
      info = <Info>[];
      json['info'].forEach((v) {
        info!.add(new Info.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.info != null) {
      data['info'] = this.info!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'homeDoctorHospitalModel{info: $info}';
  }
}

class Info {
  String? name;
  String? kind;
  String? address;
  int? star;
  String? avatar;

  Info({this.name, this.kind, this.address, this.star, this.avatar});

  Info.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    kind = json['kind'];
    address = json['address'];
    star = json['star'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['kind'] = this.kind;
    data['address'] = this.address;
    data['star'] = this.star;
    data['avatar'] = this.avatar;
    return data;
  }

  @override
  String toString() {
    return 'Info{name: $name, kind: $kind, address: $address, star: $star, avatar: $avatar}';
  }
}
