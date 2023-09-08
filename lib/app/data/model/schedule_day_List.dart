class scheduleDayList {
  List<ScheduleList>? scheduleList;

  scheduleDayList({this.scheduleList});

  scheduleDayList.fromJson(Map<String, dynamic> json) {
    if (json['scheduleList'] != null) {
      scheduleList = <ScheduleList>[];
      json['scheduleList'].forEach((v) {
        scheduleList!.add(new ScheduleList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.scheduleList != null) {
      data['scheduleList'] = this.scheduleList!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'scheduleDayList{scheduleList: $scheduleList}';
  }
}

class ScheduleList {
  String? avatar;
  String? kind;
  String? address;
  String? day;
  String? date;
  String? status;

  ScheduleList(
      {this.avatar, this.kind, this.address, this.day, this.date, this.status});

  ScheduleList.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
    kind = json['kind'];
    address = json['address'];
    day = json['day'];
    date = json['date'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar'] = this.avatar;
    data['kind'] = this.kind;
    data['address'] = this.address;
    data['day'] = this.day;
    data['date'] = this.date;
    data['status'] = this.status;
    return data;
  }

  @override
  String toString() {
    return 'ScheduleList{avatar: $avatar, kind: $kind, address: $address, day: $day, date: $date, status: $status}';
  }
}
