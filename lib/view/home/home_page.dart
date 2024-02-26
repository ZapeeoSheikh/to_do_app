import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:to_do_a_p_p/model/firebase_user.dart';
import 'package:to_do_a_p_p/model/sechdule_model.dart';
import 'package:to_do_a_p_p/model/view_model/to_do_view_model.dart';
import 'package:to_do_a_p_p/utils/constant/colors.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/utils/constant/global_constant.dart' as globals;
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late UserProfile1Model _model;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  List<SechduleModel> sechduleModel = [];
  FirebaseUser firebaseUser = FirebaseUser();
  bool isLoading = true;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserProfile1Model());
    getUserData(globals.email);
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
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
                                    'Today Schedule',
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
                                    'You have 6 schedule today.',
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
                              "6",
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
                        onTap: () {},
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
                          SizedBox(height: 50,),
                          Center(
                              child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: CircularProgressIndicator(
                                    color: mainColor1,
                                  ))),
                        ],
                      )
                      : firebaseUser.todo == null &&
                              firebaseUser.todo!.todolist == null
                          ? ListView.builder(
                              itemCount: firebaseUser.todo!.todolist!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 100.0,
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
                                              Icons.person_outline,
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
                                                    'Personal',
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
                                                  'Task Details Details',
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
                                                  '9:00AM - 12:00AM',
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
                                );
                              })
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image(
                                    width: double.infinity,
                                    image: AssetImage(
                                        "assets/images/addTodo.png")),
                                TextButton(
                                  onPressed: () {},
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
        });
      } else {
        print("error");
        // Handle cases where data is missing or invalid
      }
    }
  }

  void showToastMessage(String message) {
    BotToast.showText(text: message); //popup a text toast;
  }
}
