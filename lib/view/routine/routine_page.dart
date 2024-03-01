import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_a_p_p/model/routine_model.dart';
import 'package:to_do_a_p_p/utils/constant/colors.dart';

import '../../model/firebase_user.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/utils/constant/global_constant.dart' as globals;
export 'routine_model.dart';

class RoutinePage extends StatefulWidget {
  const RoutinePage({super.key});

  @override
  State<RoutinePage> createState() => _RoutinePageState();
}

class _RoutinePageState extends State<RoutinePage> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  List<RoutineModel> routineModel = [];
  FirebaseUser firebaseUser = FirebaseUser();
  bool isLoading = true;
  bool isReload = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
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
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Have a nice day.',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Source Sans Pro',
                            fontSize: 26.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    SizedBox(height: 3,),
                    Text(
                        DateFormat.yMMMEd().format(DateTime.now()),
                      style:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Source Sans Pro',
                                color: mainColor2,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(6.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Create Routine Schedule',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Source Sans Pro',
                                      color: Color(0xFF59BB18),
                                      fontSize: 19.0,
                                    ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 10.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('createRoutine');
                              },
                              child: Icon(
                                Icons.add_circle,
                                color: Color(0xFF59BB18),
                                size: 30.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
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
                        padding: EdgeInsetsDirectional.fromSTEB(
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: Text(
                                  'Personal',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Source Sans Pro',
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Text(
                                'Task Details Details',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Source Sans Pro',
                                  color: mainColor2,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                '9:00AM - 12:00AM',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                    fontFamily: 'Source Sans Pro',
                                    fontWeight: FontWeight.w500,
                                    color: black.withOpacity(0.5)
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            shape: CircleBorder()
                        ),
                        onPressed: (){
                          print("more");
                        }, child:
                      Icon(
                        Icons.more_vert_sharp,
                        color: mainColor2,
                        size: 28.0,
                      ),)

                    ],
                  ),
                ),
              ),
              Padding(
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
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 0.0, 0.0),
                        child: Container(
                          width: 55.0,
                          height: 55.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.laptop,
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: Text(
                                  'Work',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Source Sans Pro',
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Text(
                                'Task Details Details',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Source Sans Pro',
                                  color: mainColor2,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                '9:00AM - 12:00AM',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                    fontFamily: 'Source Sans Pro',
                                    fontWeight: FontWeight.w500,
                                    color: black.withOpacity(0.5)
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            shape: CircleBorder()
                        ),
                        onPressed: (){
                          print("more");
                        }, child:
                      Icon(
                        Icons.more_vert_sharp,
                        color: mainColor2,
                        size: 28.0,
                      ),)

                    ],
                  ),
                ),
              ),
              Padding(
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
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 0.0, 0.0),
                        child: Container(
                          width: 55.0,
                          height: 55.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.menu_book_sharp,
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: Text(
                                  'Study',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Source Sans Pro',
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Text(
                                'Task Details Details',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Source Sans Pro',
                                  color: mainColor2,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                '9:00AM - 12:00AM',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                    fontFamily: 'Source Sans Pro',
                                    fontWeight: FontWeight.w500,
                                    color: black.withOpacity(0.5)
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            shape: CircleBorder()
                        ),
                        onPressed: (){
                          print("more");
                        }, child:
                      Icon(
                        Icons.more_vert_sharp,
                        color: mainColor2,
                        size: 28.0,
                      ),)

                    ],
                  ),
                ),
              ),

            ],
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

}
