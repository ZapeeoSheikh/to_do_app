class SechduleModel {
  String? sname;
  String? category;
  String? time;
  String? date;
  String? detail;
  bool? isCompleted;

  SechduleModel(
      {this.sname,
        this.category,
        this.time,
        this.date,
        this.detail,
        this.isCompleted});

  SechduleModel.fromJson(Map<String, dynamic> json) {
    sname = json['sname'];
    category = json['category'];
    time = json['time'];
    date = json['date'];
    detail = json['detail'];
    isCompleted = json['isCompleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sname'] = this.sname;
    data['category'] = this.category;
    data['time'] = this.time;
    data['date'] = this.date;
    data['detail'] = this.detail;
    data['isCompleted'] = this.isCompleted;
    return data;
  }
}
