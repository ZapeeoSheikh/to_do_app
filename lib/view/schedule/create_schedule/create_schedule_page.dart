import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_a_p_p/model/sechdule_model.dart';
import 'package:to_do_a_p_p/utils/constant/colors.dart';
import '../../../model/firebase_user.dart';
import '../../../model/routine_model.dart';
import '../../../model/to_do_model.dart';
import '/utils/constant/global_constant.dart' as globals;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_schedule_page_model.dart';
export 'create_schedule_page_model.dart';

class CreateSchedulePage extends StatefulWidget {
  const CreateSchedulePage({super.key});

  @override
  State<CreateSchedulePage> createState() => _CreateSchedulePageState();
}

class _CreateSchedulePageState extends State<CreateSchedulePage> {
  TextEditingController sname = TextEditingController();
  TextEditingController detail = TextEditingController();
  TextEditingController date = TextEditingController();
  // TextEditingController time = TextEditingController();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  List<TodoModel> todoList = [];
  List<RoutineModel> routineModel = [];
  List<SechduleModel> scheduleModel = [];
  FirebaseUser firebaseUser = FirebaseUser();

  final List<String> items = [
    'Personal',
    'Work',
    'Home',
    'Study',
    'Travel',
  ];
  String? selectedValue;
  bool isSubmited = false;

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
        backgroundColor: scaffoldBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
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
                      'Create Schedule',
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
                  controller: sname,
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.edit,
                      color: mainColor1,
                    ),
                    labelText: 'Schedule Name',
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
                    labelText: 'Schedule Details',
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
                  keyboardType: TextInputType.text,
                  maxLength: 45,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 80.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: Color(0xFFC2C4C6),
                      width: 2.0,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 5.0, 0.0, 0.0),
                          child: Text(
                            'Category',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 12),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 5.0, 10.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DropdownButtonHideUnderline(
                              child: DropdownButton2<String>(
                                isExpanded: true,
                                hint: Text(
                                  'Select Category',
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Source Sans Pro',
                                        color: black.withOpacity(0.9),
                                      ),
                                ),
                                items: items
                                    .map((String item) =>
                                        DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Source Sans Pro',
                                                ),
                                          ),
                                        ))
                                    .toList(),
                                value: selectedValue,
                                onChanged: (String? value) {
                                  setState(() {
                                    selectedValue = value;
                                  });
                                },
                                buttonStyleData: const ButtonStyleData(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  height: 40,
                                  width: 140,
                                ),
                                menuItemStyleData: const MenuItemStyleData(
                                  height: 40,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.bookmarks_rounded,
                              color: Color(0xFD00AD2C),
                              size: 24.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onTap: () {
                    _selectDate(context);
                  },
                  cursorColor: mainColor1,
                  controller: date,
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.calendar_month,
                      color: mainColor1,
                    ),
                    labelText: 'Select Date',
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
                  height: 60,
                ),
                FFButtonWidget(
                  onPressed: () async {
                    setState(() {
                      if (isSubmited == false) {
                        if (sname.text != "" &&
                            detail.text != "" &&
                            selectedValue != null &&
                            date.text != "" ) {
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
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950, 1),
        lastDate: DateTime(2060, 12),
        builder: (context, picker) {
          return Theme(
            data: Theme.of(context).copyWith(
                primaryColor: mainColor1,
                datePickerTheme: DatePickerThemeData(
                    rangePickerHeaderForegroundColor: Colors.red)),
            child: picker!,
          );
        }).then((selectedDate) {
      //TODO: handle selected date
      if (selectedDate != null) {
        setState(() {
          print(
              "${selectedDate.day < 10 ? "0${selectedDate.day}" : selectedDate.day}-${selectedDate.month < 10 ? "0${selectedDate.month}" : selectedDate.month}-${selectedDate.year}");
          date.text =
              "${selectedDate.day < 10 ? "0${selectedDate.day}" : selectedDate.day}-${selectedDate.month < 10 ? "0${selectedDate.month}" : selectedDate.month}-${selectedDate.year}";
        });
      }
    });
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
    SechduleModel newSchedule = SechduleModel(sname.text, selectedValue, date.text, detail.text, false);
    scheduleModel = [...scheduleModel, newSchedule];
    await users.doc(globals.docID).update({
      'todo': {
        'todolist': todoList.map((todo) => todo.toJson()).toList(),
        'routine': routineModel.map((routine) => routine.toJson()).toList(),
        'schedule': scheduleModel.map((schedule) => schedule.toJson()).toList(),
      }
    }) // <-- Updated data
        .then((_) {
      showToastMessage("Schedule created");
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
