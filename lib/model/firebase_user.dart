import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_a_p_p/model/view_model/to_do_view_model.dart';

class FirebaseUser {
  String? email;
  String? name;
  String? phone;
  TodoViewModel? todo;

  FirebaseUser({this.email, this.name, this.phone, this.todo});

  FirebaseUser.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    todo =  TodoViewModel.fromJson(json['todo']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['name'] = this.name;
    data['phone'] = this.phone;
    if (todo != null) {
      data['todo'] = todo!.toJson();
    }
    return data;
  }
}
