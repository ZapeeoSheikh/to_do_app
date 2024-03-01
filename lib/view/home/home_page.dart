import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_a_p_p/model/firebase_user.dart';
import 'package:to_do_a_p_p/model/sechdule_model.dart';
import 'package:to_do_a_p_p/model/to_do_model.dart';
import 'package:to_do_a_p_p/utils/constant/colors.dart';
import '../../model/routine_model.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/utils/constant/global_constant.dart' as globals;
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  FirebaseUser firebaseUser = FirebaseUser();
  bool isLoading = true;
  bool isReload = false;
  List<TodoModel> todoList = [];
  List<RoutineModel> routineModel = [];
  List<SechduleModel> scheduleModel = [];


  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // _model = createModel(context, () => UserProfile1Model());
    getUserData(globals.email);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: scaffoldBackground,
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Hello, ${globals.name == "" ? "Good Morning" : globals.name}',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Source Sans Pro',
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    Text(
                      'Welcome to the dashboard',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Source Sans Pro',
                          fontSize: 15.0,
                          color: mainColor2
                          // fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  width: double.infinity,
                  height: 100.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [black, black],
                      stops: [0.0, 1.0],
                      begin: AlignmentDirectional(0.0, -1.0),
                      end: AlignmentDirectional(0, 1.0),
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          // mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Today Todo Tasks',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Source Sans Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'You have ${firebaseUser.todo != null && firebaseUser.todo!.todolist!.isNotEmpty ? firebaseUser.todo!.todolist!.length : 0} todo task today.',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Source Sans Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 16.0,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          width: 80.0,
                          height: 80.0,
                          // clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            border: Border.all(color: mainColor1, width: 5),
                            color: white,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                              child: Text(
                            "${firebaseUser.todo != null && firebaseUser.todo!.todolist!.isNotEmpty ? firebaseUser.todo!.todolist!.length : 0}",
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                    fontFamily: 'Source Sans Pro',
                                    fontSize: 22.0,
                                    color: mainColor2,
                                    fontWeight: FontWeight.bold
                                    // fontWeight: FontWeight.bold,
                                    ),
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat.yMMMEd().format(DateTime.now()),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Source Sans Pro',
                            fontSize: 18.0,
                            color: mainColor2,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        isReload =
                            await context.pushNamed('createTodo') as bool;
                        setState(() {
                          if (isReload) {
                            getUserData(globals.email);
                          }
                        });

                        print(isReload);
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.add,
                            color: mainColor1,
                          ),
                          Text(
                            'Add Todo',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Source Sans Pro',
                                  fontSize: 15.0,
                                  color: mainColor1,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                isLoading
                    ? Column(
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Center(
                              child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: CircularProgressIndicator(
                                    color: mainColor1,
                                  ))),
                        ],
                      )
                    : firebaseUser.todo != null &&
                            firebaseUser.todo!.todolist!.isNotEmpty
                        ? Column(
                            children: [
                              for (var i in firebaseUser.todo!.todolist!)
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF2F3F5),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Container(
                                            width: 55.0,
                                            height: 55.0,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              i.category == 'Home'
                                                  ? Icons.home_filled
                                                  : i.category == 'Work'
                                                      ? Icons.laptop
                                                      : i.category == 'Study'
                                                          ? Icons
                                                              .menu_book_outlined
                                                          : i.category ==
                                                                  'Personal'
                                                              ? Icons
                                                                  .person_outline
                                                              : Icons
                                                                  .person_outline,
                                              color: Color(0xFF59BB18),
                                              size: 30.0,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 0.0),
                                                  child: Text(
                                                    i.category.toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Source Sans Pro',
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  i.tname.toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Source Sans Pro',
                                                        color: mainColor2,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                                Text(
                                                  i.detail.toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                          fontFamily:
                                                              'Source Sans Pro',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              black.withOpacity(
                                                                  0.5)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.zero,
                                              elevation: 0,
                                              backgroundColor:
                                                  Colors.transparent,
                                              shape: CircleBorder()),
                                          onPressed: () {
                                            _showPopupMenu(i);
                                            print("more");
                                          },
                                          child: Icon(
                                            Icons.more_vert_sharp,
                                            color: mainColor2,
                                            size: 28.0,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(
                                  width: double.infinity,
                                  image:
                                      AssetImage("assets/images/addTodo.png")),
                              TextButton(
                                onPressed: () async {
                                  isReload = await context
                                      .pushNamed('createTodo') as bool;
                                  setState(() {
                                    if (isReload) {
                                      getUserData(globals.email);
                                    }
                                  });

                                  print(isReload);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add_circle_outline_outlined,
                                      color: black.withOpacity(0.5),
                                      size: 22,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Create new task',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                              fontFamily: 'Source Sans Pro',
                                              fontWeight: FontWeight.w500,
                                              color: black.withOpacity(0.5),
                                              fontSize: 16),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
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
          globals.email = firebaseUser.email!;
          globals.name = firebaseUser.name ?? "";
          globals.docID = doc.id;
          print(firebaseUser.todo);
          print(globals.docID);
          isLoading = false;
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

  deleteUserData(TodoModel todoModel) async {
    todoList.remove(todoModel);
    await users.doc(globals.docID).update({
      'todo': {
        'todolist': todoList.map((todo) => todo.toJson()).toList(),
        'routine': routineModel.map((routine) => routine.toJson()).toList(),
        'schedule': scheduleModel.map((schedule) => schedule.toJson()).toList(),
      }
    }) // <-- Updated data
        .then((_) {
      print(users);
      context.pop();
      getUserData(globals.email);
    }).catchError((error) {
      print(error);
    });
  }

  void _showPopupMenu(TodoModel todoModel) async {
    await showMenu(
      context: context,
      position: RelativeRect.fromRect(Rect.zero, Rect.largest),
      items: [
        PopupMenuItem<String>(
          child: ListTile(
            onTap: (){
              deleteUserData(todoModel);
              print("del");
            },
            title: Text(
              'Delete',
              style: TextStyle(color: mainColor2),
            ),
            leading: Icon(Icons.delete),
          ),
        ),
        PopupMenuItem<String>(
          child: ListTile(
            onTap: (){
              print("view");
            },
            title: Text(
              'View',
              style: TextStyle(color: mainColor2),
            ),
            leading: Icon(Icons.remove_red_eye),
          ),
        ),
        PopupMenuItem<String>(
          child: ListTile(
            onTap: (){
              print("update");
            },
            title: Text(
              'Update',
              style: TextStyle(color: mainColor2),
            ),
            leading: Icon(Icons.update),
          ),
        ),
      ],
      elevation: 8.0,
    );
  }
}
