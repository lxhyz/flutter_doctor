class homeDoctorsListModel {
  bool? success;
  String? message;
  Data? data;

  homeDoctorsListModel({this.success, this.message, this.data});

  homeDoctorsListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'homeDoctorsListModel{success: $success, message: $message, data: $data}';
  }
}

class Data {
  List<Doctors>? doctors;
  List<ServicesList>? servicesList;

  Data({this.doctors, this.servicesList});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['doctors'] != null) {
      doctors = <Doctors>[];
      json['doctors'].forEach((v) {
        doctors!.add(new Doctors.fromJson(v));
      });
    }
    if (json['servicesList'] != null) {
      servicesList = <ServicesList>[];
      json['servicesList'].forEach((v) {
        servicesList!.add(new ServicesList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.doctors != null) {
      data['doctors'] = this.doctors!.map((v) => v.toJson()).toList();
    }
    if (this.servicesList != null) {
      data['servicesList'] = this.servicesList!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'Data{doctors: $doctors, servicesList: $servicesList}';
  }
}

class Doctors {
  String? name;
  int? time;
  String? kind;
  String? day;
  int? mobile;
  int? mobileCode;
  String? image;

  Doctors(
      {this.name,
        this.time,
        this.kind,
        this.day,
        this.mobile,
        this.mobileCode,
        this.image});

  Doctors.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    time = json['time'];
    kind = json['kind'];
    day = json['day'];
    mobile = json['mobile'];
    mobileCode = json['mobile_code'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['time'] = this.time;
    data['kind'] = this.kind;
    data['day'] = this.day;
    data['mobile'] = this.mobile;
    data['mobile_code'] = this.mobileCode;
    data['image'] = this.image;
    return data;
  }

  @override
  String toString() {
    return 'Doctors{name: $name, time: $time, kind: $kind, day: $day, mobile: $mobile, mobileCode: $mobileCode, image: $image}';
  }
}

class ServicesList {
  String? tabbarImage;
  String? tabbarTitle;

  ServicesList({this.tabbarImage, this.tabbarTitle});

  ServicesList.fromJson(Map<String, dynamic> json) {
    tabbarImage = json['tabbarImage'];
    tabbarTitle = json['tabbarTitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tabbarImage'] = this.tabbarImage;
    data['tabbarTitle'] = this.tabbarTitle;
    return data;
  }

  @override
  String toString() {
    return 'ServicesList{tabbarImage: $tabbarImage, tabbarTitle: $tabbarTitle}';
  }
}
