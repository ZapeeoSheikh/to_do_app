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
  FirebaseUser firebaseUser = FirebaseUser();
  bool isLoading = true;
  bool isReload = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int day = 0;

  @override
  void initState() {
    super.initState();
    getUserData(globals.email);
    if (DateFormat('EEE').format(DateTime.now()) == 'Mon') {
      setState(() {
        day = 0;
      });
    } else if (DateFormat('EEE').format(DateTime.now()) == 'Tue') {
      setState(() {
        day = 1;
      });
    } else if (DateFormat('EEE').format(DateTime.now()) == 'Wed') {
      setState(() {
        day = 2;
      });
    } else if (DateFormat('EEE').format(DateTime.now()) == 'Thu') {
      setState(() {
        day = 3;
      });
    } else if (DateFormat('EEE').format(DateTime.now()) == 'Fri') {
      setState(() {
        day = 4;
      });
    } else if (DateFormat('EEE').format(DateTime.now()) == 'Sat') {
      setState(() {
        day = 5;
      });
    } else {
      setState(() {
        day = 6;
      });
    }
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
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                        Text(
                          DateFormat('kk:mm a').format(DateTime.now()),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Source Sans Pro',
                                    color: mainColor2,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
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
                                'Create Weekly Routine',
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
                                isReload = await context
                                    .pushNamed('createRoutine') as bool;
                                setState(() {
                                  if (isReload) {
                                    getUserData(globals.email);
                                  }
                                });

                                print(isReload);
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
                          firebaseUser.todo!.routine!.isNotEmpty
                      ? Expanded(
                        child: ListView.builder(
                            itemCount: firebaseUser.todo!.routine!.length,
                            itemBuilder: (BuildContext context, int i) {
                              return GestureDetector(
                                onTap: () {
                                  print(firebaseUser.todo!.routine![i].day!
                                      .contains(DateFormat('EEE')
                                          .format(DateTime.now())));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Container(
                                    width: double.infinity,
                                    // height: 120.0,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFF2F3F5),
                                        borderRadius: BorderRadius.circular(8.0),
                                        border: Border.all(
                                            color: firebaseUser
                                                    .todo!.routine![i].day!
                                                    .contains(day)
                                                ? mainColor1
                                                : Color(0xFFF2F3F5))),
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
                                              firebaseUser.todo!.routine![i]
                                                          .category ==
                                                      'Home'
                                                  ? Icons.home_filled
                                                  : firebaseUser.todo!.routine![i]
                                                              .category ==
                                                          'Work'
                                                      ? Icons.laptop
                                                      : firebaseUser
                                                                  .todo!
                                                                  .routine![i]
                                                                  .category ==
                                                              'Study'
                                                          ? Icons
                                                              .menu_book_outlined
                                                          : firebaseUser
                                                                      .todo!
                                                                      .routine![i]
                                                                      .category ==
                                                                  'Personal'
                                                              ? Icons
                                                                  .person_outline
                                                              : firebaseUser
                                                                          .todo!
                                                                          .routine![
                                                                              i]
                                                                          .category ==
                                                                      'Movie'
                                                                  ? Icons
                                                                      .movie_filter_outlined
                                                                  : firebaseUser
                                                                              .todo!
                                                                              .routine![
                                                                                  i]
                                                                              .category ==
                                                                          'Travel'
                                                                      ? Icons
                                                                          .mode_of_travel_sharp
                                                                      : Icons
                                                                          .person_outline,
                                              color: mainColor1,
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
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        firebaseUser.todo!
                                                            .routine![i].category
                                                            .toString(),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Source Sans Pro',
                                                              fontSize: 18.0,
                                                              fontWeight:
                                                                  FontWeight.w700,
                                                            ),
                                                      ),
                                                      Text(
                                                        firebaseUser.todo!
                                                            .routine![i].time
                                                            .toString(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Source Sans Pro',
                                                                  fontSize: 12.0,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Text(
                                                  firebaseUser
                                                      .todo!.routine![i].rname
                                                      .toString(),
                                                  style:
                                                      FlutterFlowTheme.of(context)
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
                                                  firebaseUser
                                                      .todo!.routine![i].detail
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                          fontFamily:
                                                              'Source Sans Pro',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: black
                                                              .withOpacity(0.5)),
                                                ),
                                                SizedBox(
                                                  height: 2,
                                                ),
                                                Wrap(
                                                  runSpacing: 5.0,
                                                  spacing: 5.0,
                                                  children: [
                                                    for (var item in firebaseUser
                                                        .todo!.routine![i].day!)
                                                      Container(
                                                        width: 40,
                                                        decoration: BoxDecoration(
                                                            color: mainColor1
                                                                .withOpacity(0.5),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                        height: 15,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      8.0),
                                                          child: Center(
                                                            child: Text(
                                                              item == 0
                                                                  ? "Mon"
                                                                  : item == 1
                                                                      ? "Tue"
                                                                      : item == 2
                                                                          ? "Wed"
                                                                          : item ==
                                                                                  3
                                                                              ? "Thu"
                                                                              : item == 4
                                                                                  ? "Fri"
                                                                                  : item == 5
                                                                                      ? "Sat"
                                                                                      : "Sun",
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                      fontFamily:
                                                                          'Source Sans Pro',
                                                                      fontSize:
                                                                          10.0,
                                                                      color:
                                                                          black),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.zero,
                                              elevation: 0,
                                              backgroundColor: Colors.transparent,
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
                                ),
                              );
                            }),
                      )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                                width: double.infinity,
                                image:
                                    AssetImage("assets/images/addRoutine.png")),
                            TextButton(
                              onPressed: () async {
                                isReload = await context
                                    .pushNamed('createRoutine') as bool;
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
                                    'Create new routine',
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
