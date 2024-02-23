class TodoModel {
  String? tname;
  String? category;
  String? detail;
  bool? isCompleted;

  TodoModel({this.tname, this.category, this.detail, this.isCompleted});

  TodoModel.fromJson(Map<String, dynamic> json) {
    tname = json['tname'];
    category = json['category'];
    detail = json['detail'];
    isCompleted = json['isCompleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tname'] = this.tname;
    data['category'] = this.category;
    data['detail'] = this.detail;
    data['isCompleted'] = this.isCompleted;
    return data;
  }
}
