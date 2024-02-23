class RoutineModel {
  String? rname;
  String? category;
  String? time;
  String? day;
  String? detail;

  RoutineModel({this.rname, this.category, this.time, this.day, this.detail});

  RoutineModel.fromJson(Map<String, dynamic> json) {
    rname = json['rname'];
    category = json['category'];
    time = json['time'];
    day = json['day'];
    detail = json['detail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rname'] = this.rname;
    data['category'] = this.category;
    data['time'] = this.time;
    data['day'] = this.day;
    data['detail'] = this.detail;
    return data;
  }
}
