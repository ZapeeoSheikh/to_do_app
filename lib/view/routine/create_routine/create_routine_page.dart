import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_a_p_p/model/routine_model.dart';
import '../../../model/firebase_user.dart';
import '../../../model/sechdule_model.dart';
import '../../../model/to_do_model.dart';
import '/utils/constant/global_constant.dart' as globals;
import 'package:go_router/go_router.dart';
import 'package:to_do_a_p_p/utils/constant/colors.dart';
import '../../../flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateRoutinePage extends StatefulWidget {
  const CreateRoutinePage({super.key});

  @override
  State<CreateRoutinePage> createState() => _CreateRoutinePageState();
}

class _CreateRoutinePageState extends State<CreateRoutinePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController rname = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController detail = TextEditingController();
  bool isSubmited = false;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  List<TodoModel> todoList = [];
  List<RoutineModel> routineModel = [];
  List<SechduleModel> scheduleModel = [];
  FirebaseUser firebaseUser = FirebaseUser();
  int category = 0;
  List<int> days = [];

  @override
  void initState() {
    // TODO: implement initState
    getUserData(globals.email);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        setState(() {});
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: scaffoldBackground,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {
                            context.pop();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            color: black,
                          )),
                      Text(
                        'Create Routine',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Source Sans Pro',
                              fontSize: 26.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    maxLength: 15,
                    cursorColor: mainColor1,
                    controller: rname,
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.edit,
                        color: mainColor1,
                      ),
                      labelText: 'Routine Name',
                      labelStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Source Sans Pro',
                                color: black.withOpacity(0.9),
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: inActive,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: mainColor1,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Source Sans Pro',
                        ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Select Category',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Source Sans Pro',
                              fontSize: 24.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              category = 0;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color:
                                      category == 0 ? mainColor1 : Colors.white,
                                ),
                                color: category == 0 ? null : mainColor1,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Center(
                                child: Text(
                                  'Personal',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Source Sans Pro',
                                        fontSize: 18.0,
                                        color: category == 0
                                            ? mainColor1
                                            : Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              category = 1;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color:
                                      category == 1 ? mainColor1 : Colors.white,
                                ),
                                color: category == 1 ? null : mainColor1,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Center(
                                child: Text(
                                  'Work',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Source Sans Pro',
                                        fontSize: 18.0,
                                        color: category == 1
                                            ? mainColor1
                                            : Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              category = 2;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color:
                                      category == 2 ? mainColor1 : Colors.white,
                                ),
                                color: category == 2 ? null : mainColor1,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Center(
                                child: Text(
                                  'Study',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Source Sans Pro',
                                        fontSize: 18.0,
                                        color: category == 2
                                            ? mainColor1
                                            : Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              category = 3;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color:
                                      category == 3 ? mainColor1 : Colors.white,
                                ),
                                color: category == 3 ? null : mainColor1,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Center(
                                child: Text(
                                  'Home',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Source Sans Pro',
                                        fontSize: 18.0,
                                        color: category == 3
                                            ? mainColor1
                                            : Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              category = 4;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color:
                                      category == 4 ? mainColor1 : Colors.white,
                                ),
                                color: category == 4 ? null : mainColor1,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Center(
                                child: Text(
                                  'Movie',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Source Sans Pro',
                                        fontSize: 18.0,
                                        color: category == 4
                                            ? mainColor1
                                            : Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              category = 5;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color:
                                      category == 5 ? mainColor1 : Colors.white,
                                ),
                                color: category == 5 ? null : mainColor1,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Center(
                                child: Text(
                                  'Travel',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Source Sans Pro',
                                        fontSize: 18.0,
                                        color: category == 5
                                            ? mainColor1
                                            : Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Select Days',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Source Sans Pro',
                              fontSize: 24.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              days.contains(0) ? days.remove(0) : days.add(0);
                            });
                          },
                          child: Container(
                            width: 60.0,
                            height: 60.0,
                            decoration: BoxDecoration(
                              color: days.contains(0) ? mainColor1 : null,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: mainColor1,
                                width: 2.0,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Mon',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: days.contains(0)
                                          ? Colors.white
                                          : mainColor1,
                                      fontSize: 18.0,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              days.contains(1) ? days.remove(1) : days.add(1);
                            });
                          },
                          child: Container(
                            width: 60.0,
                            height: 60.0,
                            decoration: BoxDecoration(
                              color: days.contains(1) ? mainColor1 : null,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: mainColor1,
                                width: 2.0,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Tue',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: days.contains(1)
                                          ? Colors.white
                                          : mainColor1,
                                      fontSize: 18.0,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              days.contains(2) ? days.remove(2) : days.add(2);
                            });
                            },
                          child: Container(
                            width: 60.0,
                            height: 60.0,
                            decoration: BoxDecoration(
                              color: days.contains(2) ? mainColor1 : null,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: mainColor1,
                                width: 2.0,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Wed',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: days.contains(2)
                                          ? Colors.white
                                          : mainColor1,
                                      fontSize: 18.0,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              days.contains(3) ? days.remove(3) : days.add(3);
                            });
                            },
                          child: Container(
                            width: 60.0,
                            height: 60.0,
                            decoration: BoxDecoration(
                              color: days.contains(3) ? mainColor1 : null,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: mainColor1,
                                width: 2.0,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Thu',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: days.contains(3)
                                          ? Colors.white
                                          : mainColor1,
                                      fontSize: 18.0,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              days.contains(4) ? days.remove(4) : days.add(4);
                            });                        },
                          child: Container(
                            width: 60.0,
                            height: 60.0,
                            decoration: BoxDecoration(
                              color: days.contains(4) ? mainColor1 : null,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: mainColor1,
                                width: 2.0,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Fri',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: days.contains(4)
                                          ? Colors.white
                                          : mainColor1,
                                      fontSize: 18.0,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              days.contains(5) ? days.remove(5) : days.add(5);
                            });                        },
                          child: Container(
                            width: 60.0,
                            height: 60.0,
                            decoration: BoxDecoration(
                              color: days.contains(5) ? mainColor1 : null,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: mainColor1,
                                width: 2.0,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Sat',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: days.contains(5)
                                          ? Colors.white
                                          : mainColor1,
                                      fontSize: 18.0,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              days.contains(6) ? days.remove(6) : days.add(6);
                            });                        },
                          child: Container(
                            width: 60.0,
                            height: 60.0,
                            decoration: BoxDecoration(
                              color: days.contains(6) ? mainColor1 : null,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: mainColor1,
                                width: 2.0,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Sun',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: days.contains(6)
                                          ? Colors.white
                                          : mainColor1,
                                      fontSize: 18.0,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: time,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Source Sans Pro',
                        ),
                    //editing controller of this TextField
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.timer,
                        color: mainColor1,
                      ),
                      labelText: 'Select Time',
                      labelStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Source Sans Pro',
                                color: black.withOpacity(0.9),
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: inActive,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: mainColor1,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    readOnly: true,
                    //set it true, so that user will not able to edit text
                    onTap: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                        initialTime: TimeOfDay.now(),
                        context: context,
                      );
            
                      if (pickedTime != null) {
                        print(pickedTime.format(context)); //output 10:51 PM
                        DateTime parsedTime = DateFormat.jm()
                            .parse(pickedTime.format(context).toString());
                        //converting to DateTime so that we can further format on different pattern.
                        print(parsedTime); //output 1970-01-01 22:53:00.000
                        String formattedTime =
                            DateFormat('h:mm a').format(parsedTime);
                        print(formattedTime); //output 14:59:00
                        //DateFormat() is from intl package, you can format the time on any pattern you need.
            
                        setState(() {
                          time.text =
                              formattedTime; //set the value of text field.
                        });
                      } else {
                        print("Time is not selected");
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    cursorColor: mainColor1,
                    controller: detail,
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.description,
                        color: mainColor1,
                      ),
                      labelText: 'Routine Details',
                      labelStyle:
                      FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Source Sans Pro',
                        color: black.withOpacity(0.9),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFACB7C1),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: mainColor1,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 12),
                    keyboardType: TextInputType.multiline,
                    maxLength: 45,
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      setState(() {
                        if (isSubmited == false) {
                          if (rname.text != "" &&
                              time.text != "" &&
                              days != [] ) {
                            isSubmited = true;
                            print(globals.docID);
                            updateUserData(globals.email);
                          } else {
                            showToastMessage("Field can't be empty");
                          }
                        }
                      });
                    },
                    text: isSubmited ? 'Creating ..' : 'Create',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 50.0,
                      color: mainColor1,
                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Source Sans Pro',
                        color: Colors.white,
                      ),
                      elevation: 3.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  getUserData(String email) async {
    final snapshot = await users.where('email', isEqualTo: email).get();
    for (final doc in snapshot.docs) {
      final userData = doc.data()
      as Map<String, dynamic>?; // Use a type cast with null check
      print(userData);
      if (userData != null) {
        setState(() {
          print(userData['email']);
          firebaseUser = FirebaseUser.fromJson(userData);
          todoList = firebaseUser.todo!.todolist ?? [];
          routineModel = firebaseUser.todo!.routine ?? [];
          scheduleModel = firebaseUser.todo!.sechdule ?? [];
        });
      } else {
        print("error");
        // Handle cases where data is missing or invalid
      }
    }
  }


  updateUserData(String email) async {
    RoutineModel newRoutine = RoutineModel(rname.text,
        category == 0 ? "Personal" :
        category == 1 ? "Work" :
        category == 2 ? "Study" :
        category == 3 ? "Home" :
        category == 4 ? "Movie" :
        "Travel", time.text, days, detail.text);
    routineModel = [...routineModel, newRoutine];
    await users.doc(globals.docID).update({
      'todo': {
        'todolist': todoList.map((todo) => todo.toJson()).toList(),
        'routine': routineModel.map((routine) => routine.toJson()).toList(),
        'schedule': scheduleModel.map((schedule) => schedule.toJson()).toList(),
      }
    }) // <-- Updated data
        .then((_) {
      showToastMessage("Routine created");
      print(users);
      context.pop(true);
    }).catchError((error) {
      setState(() {
        isSubmited = false;
      });
      showToastMessage("Failed");
      print(error);
    });
  }


  void showToastMessage(String message) {
    BotToast.showText(text: message); //popup a text toast;
  }
}
