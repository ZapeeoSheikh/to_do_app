import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_a_p_p/model/to_do_model.dart';
import 'package:to_do_a_p_p/utils/constant/colors.dart';
import '../../../flutter_flow/flutter_flow_widgets.dart';
import '../../../model/firebase_user.dart';
import '/utils/constant/global_constant.dart' as globals;
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';


class CreateTodoPage extends StatefulWidget {
  const CreateTodoPage({super.key});

  @override
  State<CreateTodoPage> createState() => _CreateTodoPageState();
}

class _CreateTodoPageState extends State<CreateTodoPage> {
  TextEditingController tname = TextEditingController();
  TextEditingController detail = TextEditingController();
  // TextEditingController time = TextEditingController();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  FirebaseUser firebaseUser = FirebaseUser();
  List<TodoModel> todoList = [];

  final List<String> items = [
    'Personal',
    'Work',
    'Home',
    'Study',
  ];
  String? selectedValue;
  bool isSubmited = false;
@override
  void initState() {
    // TODO: implement initState
    getUserData(globals.email);
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
                          context.pop(false);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          color: black,
                        )),
                    Text(
                      'Create Todo',
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
                  controller: tname,
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.edit,
                      color: mainColor1,
                    ),
                    labelText: 'Todo Title',
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
                    labelText: 'Todo Details',
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
                  height: 60,
                ),
                FFButtonWidget(
                  onPressed: () async {
                    setState(() {
                      if (isSubmited == false) {
                        if (tname.text != "" &&
                            detail.text != "" &&
                            selectedValue != null  ) {
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
        });
      } else {
        print("error");
        // Handle cases where data is missing or invalid
      }
    }
  }


  updateUserData(String email) async {
   TodoModel newtodo = TodoModel(tname.text, selectedValue, detail.text, false);
   todoList = [...todoList, newtodo];
    await users.doc(globals.docID).update({
      'todo': {
        'todolist': todoList.map((todo) => todo.toJson()).toList()
      }
    }) // <-- Updated data
        .then((_) {
      showToastMessage("Todo created");
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
