import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_a_p_p/backend/backend.dart';
import 'package:to_do_a_p_p/model/sechdule_model.dart';
import '../../model/firebase_user.dart';
import '../../utils/constant/colors.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/utils/constant/global_constant.dart' as globals;

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  FirebaseUser firebaseUser = FirebaseUser();
  List<SechduleModel> sechduleModel = [];
  bool isLoading = true;
  bool isReload = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int currentIndex = 0;

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
      backgroundColor: scaffoldBackground,
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 130.0,
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat.yMMMEd().format(DateTime.now()),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Source Sans Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 65.0,
                              height: 65.0,
                              // clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                border: Border.all(color: mainColor1, width: 5),
                                color: white,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                  child: Text(
                                "${firebaseUser.todo != null ? firebaseUser.todo!.sechdule!.isNotEmpty ?
                                firebaseUser.todo!.sechdule!.where((element) => element.date == "${DateTime.now().day < 10 ? "0${DateTime.now().day}" : DateTime.now().day}-${DateTime.now().month < 10 ? "0${DateTime.now().month}" : DateTime.now().month}-${DateTime.now().year}").length : 0
                                    : 0}",
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                        fontFamily: 'Source Sans Pro',
                                        fontSize: 20.0,
                                        color: mainColor2,
                                        fontWeight: FontWeight.bold
                                        // fontWeight: FontWeight.bold,
                                        ),
                              )),
                            ),
                            SizedBox(width: 10),
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
                                      'You have ${firebaseUser.todo != null ? firebaseUser.todo!.sechdule!.isNotEmpty ?
                                      firebaseUser.todo!.sechdule!.where((element) => element.date == "${DateTime.now().day < 10 ? "0${DateTime.now().day}" : DateTime.now().day}-${DateTime.now().month < 10 ? "0${DateTime.now().month}" : DateTime.now().month}-${DateTime.now().year}").length : 0
                                          : 0} schedule today.',
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
                          ],
                        ),
                      ],
                    ),
                  ),
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
                            'Create Weekly Schedule',
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
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            isReload = await context.pushNamed('createSchedule') as bool;
                            setState(() {
                              if(isReload){
                                getUserData(globals.email);
                              }
                            });

                            print(isReload);
                          },
                          child: Icon(
                            Icons.add_circle_outline_outlined,
                            color: Color(0xFF59BB18),
                            size: 30.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                firebaseUser.todo != null &&
                    firebaseUser.todo!.sechdule!.isNotEmpty
                    ? currentIndex != 0 ?
                Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          currentIndex = 0;
                        });
                      },
                      child: Row(
                        children: [
                          Icon(Icons.chevron_left, color: mainColor2, size: 25,),
                          SizedBox(width: 5),
                          Text(
                            "Back to panel",
                            style: FlutterFlowTheme.of(
                                context)
                                .bodyMedium
                                .override(
                              fontFamily:
                              'Source Sans Pro',
                              fontSize: 17.0,
                              color: mainColor2
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    for(var i in sechduleModel)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Container(
                          width: double.infinity,
                          // height: 120.0,
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
                                    i.category == 'Home' ?
                                    Icons.home_filled :
                                    i.category == 'Work' ?
                                    Icons.laptop :
                                    i.category == 'Study' ?
                                    Icons.menu_book_outlined :
                                    i.category == 'Personal' ?
                                    Icons.person_outline :
                                    i.category == 'Movie' ?
                                    Icons.movie_filter_outlined :
                                    i.category == 'Travel' ?
                                    Icons.mode_of_travel_sharp :
                                    Icons.person_outline,
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
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
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
                                            Text(
                                              i.date.toString(),
                                              style: FlutterFlowTheme.of(
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
                                        i.sname.toString(),
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
                ) :
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                currentIndex = 1;
                                sechduleModel = firebaseUser.todo!.sechdule ?? [];
                              });
                            },
                            child: Container(
                              width: 156.0,
                              height: 146.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFF2F3F5),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 10.0, 0.0, 0.0),
                                        child: Icon(
                                          Icons.list_alt,
                                          color: mainColor1,
                                          size: 30.0,
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                10.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'All',
                                              style: FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Readex Pro',
                                                color: Color(0xFD0AA338),
                                                fontSize: 18.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              10.0, 0.0, 0.0, 5.0),
                                          child: Text(
                                            '${firebaseUser.todo != null ? firebaseUser.todo!.sechdule!.length : 0} Schedule',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Icon(
                                      Icons.more_vert,
                                      color: Color(0xFD0AA338),
                                      size: 24.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                if(firebaseUser.todo!.sechdule!.where((element) => element.category == "Home").isNotEmpty){
                                  currentIndex = 2;
                                  sechduleModel = firebaseUser.todo!.sechdule!.where((element) => element.category == "Home").toList();
                                } else {
                                  showToastMessage("No schedule for category Home");
                                }
                                print(firebaseUser.todo!.sechdule!.where((element) => element.category == "Home"));
                              });
                            },
                            child: Container(
                              width: 156.0,
                              height: 146.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFF2F3F5),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 10.0, 0.0, 0.0),
                                        child: Icon(
                                          Icons.home_filled,
                                          color: mainColor1,
                                          size: 30.0,
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                10.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Home',
                                              style: FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Readex Pro',
                                                color: Color(0xFD0AA338),
                                                fontSize: 18.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              10.0, 0.0, 0.0, 5.0),
                                          child: Text(
                                            '${firebaseUser.todo != null ? firebaseUser.todo!.sechdule!.length > 0 ?
                                            firebaseUser.todo!.sechdule!.where((element) => element.category == "Home").length : 0
                                                : 0} Schedule',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Icon(
                                      Icons.more_vert,
                                      color: Color(0xFD0AA338),
                                      size: 24.0,
                                    ),
                                  ),
                                ],
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                if(firebaseUser.todo!.sechdule!.where((element) => element.category == "Personal").isNotEmpty){
                                  currentIndex = 3;
                                  sechduleModel = firebaseUser.todo!.sechdule!.where((element) => element.category == "Personal").toList();
                                } else {
                                  showToastMessage("No schedule for category Personal");
                                }
                                print(firebaseUser.todo!.sechdule!.where((element) => element.category == "Personal"));
                              });
                            },
                            child: Container(
                              width: 156.0,
                              height: 146.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFF2F3F5),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 10.0, 0.0, 0.0),
                                        child: Icon(
                                          Icons.person_outline,
                                          color: mainColor1,
                                          size: 30.0,
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                10.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Personal',
                                              style: FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Readex Pro',
                                                color: Color(0xFD0AA338),
                                                fontSize: 18.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: const AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                              10.0, 0.0, 0.0, 5.0),
                                          child: Text(
                                            '${firebaseUser.todo != null ? firebaseUser.todo!.sechdule!.length > 0 ?
                                            firebaseUser.todo!.sechdule!.where((element) => element.category == "Personal").length : 0
                                                : 0} Schedule',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Icon(
                                      Icons.more_vert,
                                      color: Color(0xFD0AA338),
                                      size: 24.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                if(firebaseUser.todo!.sechdule!.where((element) => element.category == "Work").isNotEmpty){
                                  currentIndex = 4;
                                  sechduleModel = firebaseUser.todo!.sechdule!.where((element) => element.category == "Work").toList();
                                } else {
                                  showToastMessage("No schedule for category Work");
                                }
                                print(firebaseUser.todo!.sechdule!.where((element) => element.category == "Work"));
                              });
                            },
                            child: Container(
                              width: 156.0,
                              height: 146.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFF2F3F5),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 10.0, 0.0, 0.0),
                                        child: Icon(
                                          Icons.laptop,
                                          color: mainColor1,
                                          size: 30.0,
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                10.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Work',
                                              style: FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Readex Pro',
                                                color: Color(0xFD0AA338),
                                                fontSize: 18.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              10.0, 0.0, 0.0, 5.0),
                                          child: Text(
                                            '${firebaseUser.todo != null ? firebaseUser.todo!.sechdule!.length > 0 ?
                                            firebaseUser.todo!.sechdule!.where((element) => element.category == "Work").length : 0
                                                : 0} Schedule',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Icon(
                                      Icons.more_vert,
                                      color: Color(0xFD0AA338),
                                      size: 24.0,
                                    ),
                                  ),
                                ],
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                if(firebaseUser.todo!.sechdule!.where((element) => element.category == "Study").isNotEmpty){
                                  currentIndex = 5;
                                  sechduleModel = firebaseUser.todo!.sechdule!.where((element) => element.category == "Study").toList();
                                } else {
                                  showToastMessage("No schedule for category Study");
                                }
                                print(firebaseUser.todo!.sechdule!.where((element) => element.category == "Study"));
                              });
                            },
                            child: Container(
                              width: 156.0,
                              height: 146.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFF2F3F5),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 10.0, 0.0, 0.0),
                                        child: Icon(
                                          Icons.menu_book_outlined,
                                          color: mainColor1,
                                          size: 30.0,
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                10.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Study',
                                              style: FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Readex Pro',
                                                color: Color(0xFD0AA338),
                                                fontSize: 18.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              10.0, 0.0, 0.0, 5.0),
                                          child: Text(
                                            '${firebaseUser.todo != null ? firebaseUser.todo!.sechdule!.length > 0 ?
                                            firebaseUser.todo!.sechdule!.where((element) => element.category == "Study").length : 0
                                                : 0} Schedule',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Icon(
                                      Icons.more_vert,
                                      color: Color(0xFD0AA338),
                                      size: 24.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                if(firebaseUser.todo!.sechdule!.where((element) => element.category == "Travel").isNotEmpty){
                                  currentIndex = 6;
                                  sechduleModel = firebaseUser.todo!.sechdule!.where((element) => element.category == "Travel").toList();
                                } else {
                                  showToastMessage("No schedule for category Travel");
                                }
                                print(firebaseUser.todo!.sechdule!.where((element) => element.category == "Travel"));
                              });
                            },
                            child: Container(
                              width: 156.0,
                              height: 146.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFF2F3F5),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 10.0, 0.0, 0.0),
                                        child: Icon(
                                          Icons.mode_of_travel_sharp,
                                          color: mainColor1,
                                          size: 30.0,
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                10.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Travel',
                                              style: FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Readex Pro',
                                                color: Color(0xFD0AA338),
                                                fontSize: 18.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              10.0, 0.0, 0.0, 5.0),
                                          child: Text(
                                            '${firebaseUser.todo != null ? firebaseUser.todo!.sechdule!.length > 0 ?
                                            firebaseUser.todo!.sechdule!.where((element) => element.category == "Travel").length : 0
                                                : 0} Schedule',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Icon(
                                      Icons.more_vert,
                                      color: Color(0xFD0AA338),
                                      size: 24.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ) :
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              width: 156.0,
                              height: 146.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFF2F3F5),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 10.0, 0.0, 0.0),
                                        child: Icon(
                                          Icons.list_alt,
                                          color: mainColor1,
                                          size: 30.0,
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                10.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'All',
                                              style: FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Readex Pro',
                                                color: Color(0xFD0AA338),
                                                fontSize: 18.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              10.0, 0.0, 0.0, 5.0),
                                          child: Text(
                                            '${firebaseUser.todo != null ? firebaseUser.todo!.sechdule!.length : 0} Schedule',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Icon(
                                      Icons.more_vert,
                                      color: Color(0xFD0AA338),
                                      size: 24.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              width: 156.0,
                              height: 146.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFF2F3F5),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 10.0, 0.0, 0.0),
                                        child: Icon(
                                          Icons.home_filled,
                                          color: mainColor1,
                                          size: 30.0,
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                10.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Home',
                                              style: FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Readex Pro',
                                                color: Color(0xFD0AA338),
                                                fontSize: 18.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              10.0, 0.0, 0.0, 5.0),
                                          child: Text(
                                            '${firebaseUser.todo != null ? firebaseUser.todo!.sechdule!.length > 0 ?
                                            firebaseUser.todo!.sechdule!.where((element) => element.category == "Home").length : 0
                                                : 0} Schedule',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Icon(
                                      Icons.more_vert,
                                      color: Color(0xFD0AA338),
                                      size: 24.0,
                                    ),
                                  ),
                                ],
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              print(firebaseUser.todo!.sechdule!.length);
                            },
                            child: Container(
                              width: 156.0,
                              height: 146.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFF2F3F5),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 10.0, 0.0, 0.0),
                                        child: Icon(
                                          Icons.person_outline,
                                          color: mainColor1,
                                          size: 30.0,
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                10.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Personal',
                                              style: FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Readex Pro',
                                                color: Color(0xFD0AA338),
                                                fontSize: 18.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: const AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                              10.0, 0.0, 0.0, 5.0),
                                          child: Text(
                                            '${firebaseUser.todo != null ? firebaseUser.todo!.sechdule!.length > 0 ?
                                            firebaseUser.todo!.sechdule!.where((element) => element.category == "Personal").length : 0
                                                : 0} Schedule',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Icon(
                                      Icons.more_vert,
                                      color: Color(0xFD0AA338),
                                      size: 24.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              width: 156.0,
                              height: 146.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFF2F3F5),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 10.0, 0.0, 0.0),
                                        child: Icon(
                                          Icons.laptop,
                                          color: mainColor1,
                                          size: 30.0,
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                10.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Work',
                                              style: FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Readex Pro',
                                                color: Color(0xFD0AA338),
                                                fontSize: 18.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              10.0, 0.0, 0.0, 5.0),
                                          child: Text(
                                            '${firebaseUser.todo != null ? firebaseUser.todo!.sechdule!.length > 0 ?
                                            firebaseUser.todo!.sechdule!.where((element) => element.category == "Work").length : 0
                                                : 0} Schedule',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Icon(
                                      Icons.more_vert,
                                      color: Color(0xFD0AA338),
                                      size: 24.0,
                                    ),
                                  ),
                                ],
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              width: 156.0,
                              height: 146.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFF2F3F5),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 10.0, 0.0, 0.0),
                                        child: Icon(
                                          Icons.menu_book_outlined,
                                          color: mainColor1,
                                          size: 30.0,
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                10.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Study',
                                              style: FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Readex Pro',
                                                color: Color(0xFD0AA338),
                                                fontSize: 18.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              10.0, 0.0, 0.0, 5.0),
                                          child: Text(
                                            '${firebaseUser.todo != null ? firebaseUser.todo!.sechdule!.length > 0 ?
                                            firebaseUser.todo!.sechdule!.where((element) => element.category == "Study").length : 0
                                                : 0} Schedule',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Icon(
                                      Icons.more_vert,
                                      color: Color(0xFD0AA338),
                                      size: 24.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              width: 156.0,
                              height: 146.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFF2F3F5),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 10.0, 0.0, 0.0),
                                        child: Icon(
                                          Icons.mode_of_travel_sharp,
                                          color: mainColor1,
                                          size: 30.0,
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                10.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Travel',
                                              style: FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Readex Pro',
                                                color: Color(0xFD0AA338),
                                                fontSize: 18.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              10.0, 0.0, 0.0, 5.0),
                                          child: Text(
                                            '${firebaseUser.todo != null ? firebaseUser.todo!.sechdule!.length > 0 ?
                                            firebaseUser.todo!.sechdule!.where((element) => element.category == "Travel").length : 0
                                                : 0} Schedule',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Icon(
                                      Icons.more_vert,
                                      color: Color(0xFD0AA338),
                                      size: 24.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
          sechduleModel = firebaseUser.todo!.sechdule ?? [];
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
