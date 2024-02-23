import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_a_p_p/model/routine_model.dart';
import 'package:to_do_a_p_p/model/sechdule_model.dart';

import '../to_do_model.dart';

class TodoViewModel {
  List<RoutineModel>? routine;
  List<TodoModel>? todolist;
  List<SechduleModel>? sechdule;

  TodoViewModel({this.routine, this.todolist, this.sechdule});

  TodoViewModel.fromJson(Map<String, dynamic> json) {
    if (json['routine'] != null) {
      routine = <RoutineModel>[];
      json['routine'].forEach((v) {
        routine!.add(RoutineModel.fromJson(v));
      });
    }
    if (json['todolist'] != null) {
      todolist = <TodoModel>[];
      json['todolist'].forEach((v) {
        todolist!.add(TodoModel.fromJson(v));
      });
    }
    if (json['sechdule'] != null) {
      sechdule = <SechduleModel>[];
      json['sechdule'].forEach((v) {
        sechdule!.add(SechduleModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (routine != null) {
      data['routine'] = routine!.map((v) => v.toJson()).toList();
    }
    if (todolist != null) {
      data['todolist'] = todolist!.map((v) => v.toJson()).toList();
    }
    if (sechdule != null) {
      data['sechdule'] = sechdule!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


