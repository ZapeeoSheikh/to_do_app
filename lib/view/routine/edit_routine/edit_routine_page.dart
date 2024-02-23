// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'edit_routine_page_model.dart';
// export 'edit_routine_page_model.dart';
//
// class EditRoutinePageWidget extends StatefulWidget {
//   const EditRoutinePageWidget({super.key});
//
//   @override
//   State<EditRoutinePageWidget> createState() => _EditRoutinePageWidgetState();
// }
//
// class _EditRoutinePageWidgetState extends State<EditRoutinePageWidget> {
//   late EditRoutinePageModel _model;
//
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => EditRoutinePageModel());
//   }
//
//   @override
//   void dispose() {
//     _model.dispose();
//
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (isiOS) {
//       SystemChrome.setSystemUIOverlayStyle(
//         SystemUiOverlayStyle(
//           statusBarBrightness: Theme.of(context).brightness,
//           systemStatusBarContrastEnforced: true,
//         ),
//       );
//     }
//
//     return GestureDetector(
//       onTap: () => _model.unfocusNode.canRequestFocus
//           ? FocusScope.of(context).requestFocus(_model.unfocusNode)
//           : FocusScope.of(context).unfocus(),
//       child: Scaffold(
//         key: scaffoldKey,
//         backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
//         body: SafeArea(
//           top: true,
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: FlutterFlowTheme.of(context).secondaryBackground,
//                 ),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.max,
//                   children: [
//                     Column(
//                       mainAxisSize: MainAxisSize.max,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Column(
//                           mainAxisSize: MainAxisSize.max,
//                           children: [
//                             Padding(
//                               padding: EdgeInsetsDirectional.fromSTEB(
//                                   20.0, 40.0, 20.0, 20.0),
//                               child: Row(
//                                 mainAxisSize: MainAxisSize.max,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     'Create Schedule',
//                                     style: FlutterFlowTheme.of(context)
//                                         .bodyMedium
//                                         .override(
//                                           fontFamily: 'Open Sans',
//                                           fontSize: 26.0,
//                                           fontWeight: FontWeight.w500,
//                                         ),
//                                   ),
//                                   Padding(
//                                     padding: EdgeInsetsDirectional.fromSTEB(
//                                         0.0, 0.0, 10.0, 0.0),
//                                     child: Icon(
//                                       Icons.close_sharp,
//                                       color: FlutterFlowTheme.of(context)
//                                           .secondaryText,
//                                       size: 24.0,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                         Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(
//                               20.0, 40.0, 20.0, 0.0),
//                           child: Container(
//                             width: double.infinity,
//                             height: 70.0,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(12.0),
//                               border: Border.all(
//                                 color: Color(0xFFC2C4C6),
//                                 width: 2.0,
//                               ),
//                             ),
//                             child: Column(
//                               mainAxisSize: MainAxisSize.max,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Align(
//                                   alignment: AlignmentDirectional(-1.0, -1.0),
//                                   child: Padding(
//                                     padding: EdgeInsetsDirectional.fromSTEB(
//                                         10.0, 5.0, 0.0, 0.0),
//                                     child: Text(
//                                       'Name',
//                                       style: FlutterFlowTheme.of(context)
//                                           .bodyMedium
//                                           .override(
//                                             fontFamily: 'Readex Pro',
//                                             color: FlutterFlowTheme.of(context)
//                                                 .secondaryText,
//                                           ),
//                                     ),
//                                   ),
//                                 ),
//                                 Align(
//                                   alignment: AlignmentDirectional(-1.0, 0.0),
//                                   child: Padding(
//                                     padding: EdgeInsetsDirectional.fromSTEB(
//                                         10.0, 0.0, 0.0, 0.0),
//                                     child: Text(
//                                       'Schedule Name',
//                                       textAlign: TextAlign.start,
//                                       style: FlutterFlowTheme.of(context)
//                                           .bodyMedium
//                                           .override(
//                                             fontFamily: 'Open Sans',
//                                             fontSize: 18.0,
//                                             fontWeight: FontWeight.w500,
//                                           ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         Align(
//                           alignment: AlignmentDirectional(-1.0, 0.0),
//                           child: Padding(
//                             padding: EdgeInsetsDirectional.fromSTEB(
//                                 20.0, 30.0, 0.0, 0.0),
//                             child: Text(
//                               'Select Category',
//                               textAlign: TextAlign.start,
//                               style: FlutterFlowTheme.of(context)
//                                   .bodyMedium
//                                   .override(
//                                     fontFamily: 'Open Sans',
//                                     fontSize: 22.0,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsetsDirectional.fromSTEB(
//                               20.0, 20.0, 20.0, 0.0),
//                           child: Container(
//                             decoration: BoxDecoration(),
//                             child: Column(
//                               mainAxisSize: MainAxisSize.max,
//                               children: [
//                                 Row(
//                                   mainAxisSize: MainAxisSize.max,
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     FFButtonWidget(
//                                       onPressed: () {
//                                         print('Button pressed ...');
//                                       },
//                                       text: 'Personal',
//                                       options: FFButtonOptions(
//                                         width: 110.0,
//                                         height: 40.0,
//                                         padding: EdgeInsetsDirectional.fromSTEB(
//                                             24.0, 0.0, 24.0, 0.0),
//                                         iconPadding:
//                                             EdgeInsetsDirectional.fromSTEB(
//                                                 0.0, 0.0, 0.0, 0.0),
//                                         color: Color(0xFD00AD2C),
//                                         textStyle: FlutterFlowTheme.of(context)
//                                             .titleSmall
//                                             .override(
//                                               fontFamily: 'Readex Pro',
//                                               color: Colors.white,
//                                             ),
//                                         elevation: 3.0,
//                                         borderSide: BorderSide(
//                                           color: Colors.transparent,
//                                           width: 1.0,
//                                         ),
//                                         borderRadius:
//                                             BorderRadius.circular(8.0),
//                                       ),
//                                     ),
//                                     FFButtonWidget(
//                                       onPressed: () {
//                                         print('Button pressed ...');
//                                       },
//                                       text: 'Work',
//                                       options: FFButtonOptions(
//                                         width: 110.0,
//                                         height: 40.0,
//                                         padding: EdgeInsetsDirectional.fromSTEB(
//                                             24.0, 0.0, 24.0, 0.0),
//                                         iconPadding:
//                                             EdgeInsetsDirectional.fromSTEB(
//                                                 0.0, 0.0, 0.0, 0.0),
//                                         color: Color(0xFD00AD2C),
//                                         textStyle: FlutterFlowTheme.of(context)
//                                             .titleSmall
//                                             .override(
//                                               fontFamily: 'Readex Pro',
//                                               color: Colors.white,
//                                             ),
//                                         elevation: 3.0,
//                                         borderSide: BorderSide(
//                                           color: Colors.transparent,
//                                           width: 1.0,
//                                         ),
//                                         borderRadius:
//                                             BorderRadius.circular(8.0),
//                                       ),
//                                     ),
//                                     FFButtonWidget(
//                                       onPressed: () {
//                                         print('Button pressed ...');
//                                       },
//                                       text: 'Study',
//                                       options: FFButtonOptions(
//                                         width: 110.0,
//                                         height: 40.0,
//                                         padding: EdgeInsetsDirectional.fromSTEB(
//                                             24.0, 0.0, 24.0, 0.0),
//                                         iconPadding:
//                                             EdgeInsetsDirectional.fromSTEB(
//                                                 0.0, 0.0, 0.0, 0.0),
//                                         color: Color(0xFD00AD2C),
//                                         textStyle: FlutterFlowTheme.of(context)
//                                             .titleSmall
//                                             .override(
//                                               fontFamily: 'Readex Pro',
//                                               color: Colors.white,
//                                             ),
//                                         elevation: 3.0,
//                                         borderSide: BorderSide(
//                                           color: Colors.transparent,
//                                           width: 1.0,
//                                         ),
//                                         borderRadius:
//                                             BorderRadius.circular(8.0),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsetsDirectional.fromSTEB(
//                                       0.0, 20.0, 0.0, 0.0),
//                                   child: Row(
//                                     mainAxisSize: MainAxisSize.max,
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceEvenly,
//                                     children: [
//                                       FFButtonWidget(
//                                         onPressed: () {
//                                           print('Button pressed ...');
//                                         },
//                                         text: 'Home',
//                                         options: FFButtonOptions(
//                                           width: 110.0,
//                                           height: 40.0,
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   24.0, 0.0, 24.0, 0.0),
//                                           iconPadding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   0.0, 0.0, 0.0, 0.0),
//                                           color: Color(0xFD00AD2C),
//                                           textStyle:
//                                               FlutterFlowTheme.of(context)
//                                                   .titleSmall
//                                                   .override(
//                                                     fontFamily: 'Readex Pro',
//                                                     color: Colors.white,
//                                                   ),
//                                           elevation: 3.0,
//                                           borderSide: BorderSide(
//                                             color: Colors.transparent,
//                                             width: 1.0,
//                                           ),
//                                           borderRadius:
//                                               BorderRadius.circular(8.0),
//                                         ),
//                                       ),
//                                       FFButtonWidget(
//                                         onPressed: () {
//                                           print('Button pressed ...');
//                                         },
//                                         text: 'Movie ',
//                                         options: FFButtonOptions(
//                                           width: 110.0,
//                                           height: 40.0,
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   24.0, 0.0, 24.0, 0.0),
//                                           iconPadding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   0.0, 0.0, 0.0, 0.0),
//                                           color: Color(0xFD00AD2C),
//                                           textStyle:
//                                               FlutterFlowTheme.of(context)
//                                                   .titleSmall
//                                                   .override(
//                                                     fontFamily: 'Readex Pro',
//                                                     color: Colors.white,
//                                                   ),
//                                           elevation: 3.0,
//                                           borderSide: BorderSide(
//                                             color: Colors.transparent,
//                                             width: 1.0,
//                                           ),
//                                           borderRadius:
//                                               BorderRadius.circular(8.0),
//                                         ),
//                                       ),
//                                       FFButtonWidget(
//                                         onPressed: () {
//                                           print('Button pressed ...');
//                                         },
//                                         text: 'Travel',
//                                         options: FFButtonOptions(
//                                           width: 110.0,
//                                           height: 40.0,
//                                           padding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   24.0, 0.0, 24.0, 0.0),
//                                           iconPadding:
//                                               EdgeInsetsDirectional.fromSTEB(
//                                                   0.0, 0.0, 0.0, 0.0),
//                                           color: Color(0xFD00AD2C),
//                                           textStyle:
//                                               FlutterFlowTheme.of(context)
//                                                   .titleSmall
//                                                   .override(
//                                                     fontFamily: 'Readex Pro',
//                                                     color: Colors.white,
//                                                   ),
//                                           elevation: 3.0,
//                                           borderSide: BorderSide(
//                                             color: Colors.transparent,
//                                             width: 1.0,
//                                           ),
//                                           borderRadius:
//                                               BorderRadius.circular(8.0),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         Row(
//                           mainAxisSize: MainAxisSize.max,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Align(
//                               alignment: AlignmentDirectional(-1.0, 0.0),
//                               child: Padding(
//                                 padding: EdgeInsetsDirectional.fromSTEB(
//                                     20.0, 20.0, 0.0, 0.0),
//                                 child: Text(
//                                   'Select Date',
//                                   textAlign: TextAlign.start,
//                                   style: FlutterFlowTheme.of(context)
//                                       .bodyMedium
//                                       .override(
//                                         fontFamily: 'Open Sans',
//                                         fontSize: 22.0,
//                                         fontWeight: FontWeight.w600,
//                                       ),
//                                 ),
//                               ),
//                             ),
//                             Align(
//                               alignment: AlignmentDirectional(0.0, 1.0),
//                               child: Padding(
//                                 padding: EdgeInsetsDirectional.fromSTEB(
//                                     0.0, 10.0, 20.0, 0.0),
//                                 child: Text(
//                                   'Select Date',
//                                   style: FlutterFlowTheme.of(context)
//                                       .bodyMedium
//                                       .override(
//                                         fontFamily: 'Readex Pro',
//                                         color: Color(0xFD2BDA5C),
//                                       ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     Padding(
//                       padding:
//                           EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.max,
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Container(
//                             width: 65.0,
//                             height: 65.0,
//                             decoration: BoxDecoration(
//                               color: FlutterFlowTheme.of(context).primaryText,
//                               shape: BoxShape.circle,
//                               border: Border.all(
//                                 color: Color(0xFD00AD2C),
//                                 width: 2.0,
//                               ),
//                             ),
//                             child: Align(
//                               alignment: AlignmentDirectional(0.0, 0.0),
//                               child: Text(
//                                 'Mon',
//                                 style: FlutterFlowTheme.of(context)
//                                     .bodyMedium
//                                     .override(
//                                       fontFamily: 'Readex Pro',
//                                       color: Color(0xFD00AD2C),
//                                       fontSize: 22.0,
//                                     ),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             width: 65.0,
//                             height: 65.0,
//                             decoration: BoxDecoration(
//                               color: FlutterFlowTheme.of(context)
//                                   .secondaryBackground,
//                               shape: BoxShape.circle,
//                               border: Border.all(
//                                 color: Color(0xFD00AD2C),
//                                 width: 2.0,
//                               ),
//                             ),
//                             child: Align(
//                               alignment: AlignmentDirectional(0.0, 0.0),
//                               child: Text(
//                                 'Tue',
//                                 style: FlutterFlowTheme.of(context)
//                                     .bodyMedium
//                                     .override(
//                                       fontFamily: 'Readex Pro',
//                                       color: Color(0xFD00AD2C),
//                                       fontSize: 22.0,
//                                     ),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             width: 65.0,
//                             height: 65.0,
//                             decoration: BoxDecoration(
//                               color: FlutterFlowTheme.of(context)
//                                   .secondaryBackground,
//                               shape: BoxShape.circle,
//                               border: Border.all(
//                                 color: Color(0xFD00AD2C),
//                                 width: 2.0,
//                               ),
//                             ),
//                             child: Align(
//                               alignment: AlignmentDirectional(0.0, 0.0),
//                               child: Text(
//                                 'Wed',
//                                 style: FlutterFlowTheme.of(context)
//                                     .bodyMedium
//                                     .override(
//                                       fontFamily: 'Readex Pro',
//                                       color: Color(0xFD00AD2C),
//                                       fontSize: 22.0,
//                                     ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding:
//                           EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.max,
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Container(
//                             width: 65.0,
//                             height: 65.0,
//                             decoration: BoxDecoration(
//                               color: FlutterFlowTheme.of(context)
//                                   .secondaryBackground,
//                               shape: BoxShape.circle,
//                               border: Border.all(
//                                 color: Color(0xFD00AD2C),
//                                 width: 2.0,
//                               ),
//                             ),
//                             child: Align(
//                               alignment: AlignmentDirectional(0.0, 0.0),
//                               child: Text(
//                                 'Thur',
//                                 style: FlutterFlowTheme.of(context)
//                                     .bodyMedium
//                                     .override(
//                                       fontFamily: 'Readex Pro',
//                                       color: Color(0xFD00AD2C),
//                                       fontSize: 22.0,
//                                     ),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             width: 65.0,
//                             height: 65.0,
//                             decoration: BoxDecoration(
//                               color: FlutterFlowTheme.of(context)
//                                   .secondaryBackground,
//                               shape: BoxShape.circle,
//                               border: Border.all(
//                                 color: Color(0xFD00AD2C),
//                                 width: 2.0,
//                               ),
//                             ),
//                             child: Align(
//                               alignment: AlignmentDirectional(0.0, 0.0),
//                               child: Text(
//                                 'Fri',
//                                 style: FlutterFlowTheme.of(context)
//                                     .bodyMedium
//                                     .override(
//                                       fontFamily: 'Readex Pro',
//                                       color: Color(0xFD00AD2C),
//                                       fontSize: 22.0,
//                                     ),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             width: 65.0,
//                             height: 65.0,
//                             decoration: BoxDecoration(
//                               color: FlutterFlowTheme.of(context)
//                                   .secondaryBackground,
//                               shape: BoxShape.circle,
//                               border: Border.all(
//                                 color: Color(0xFD00AD2C),
//                                 width: 2.0,
//                               ),
//                             ),
//                             child: Align(
//                               alignment: AlignmentDirectional(0.0, 0.0),
//                               child: Text(
//                                 'Sat',
//                                 style: FlutterFlowTheme.of(context)
//                                     .bodyMedium
//                                     .override(
//                                       fontFamily: 'Readex Pro',
//                                       color: Color(0xFD00AD2C),
//                                       fontSize: 22.0,
//                                     ),
//                               ),
//                             ),
//                           ),
//                           Container(
//                             width: 65.0,
//                             height: 65.0,
//                             decoration: BoxDecoration(
//                               color: FlutterFlowTheme.of(context)
//                                   .secondaryBackground,
//                               shape: BoxShape.circle,
//                               border: Border.all(
//                                 color: Color(0xFD00AD2C),
//                                 width: 2.0,
//                               ),
//                             ),
//                             child: Align(
//                               alignment: AlignmentDirectional(0.0, 0.0),
//                               child: Text(
//                                 'Sun',
//                                 style: FlutterFlowTheme.of(context)
//                                     .bodyMedium
//                                     .override(
//                                       fontFamily: 'Readex Pro',
//                                       color: Color(0xFD00AD2C),
//                                       fontSize: 22.0,
//                                     ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.max,
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Container(
//                       width: 180.0,
//                       height: 80.0,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(12.0),
//                         border: Border.all(
//                           color: FlutterFlowTheme.of(context).secondaryText,
//                         ),
//                       ),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.max,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Expanded(
//                             child: Text(
//                               'Start Time',
//                               style: FlutterFlowTheme.of(context)
//                                   .bodyMedium
//                                   .override(
//                                     fontFamily: 'Open Sans',
//                                     fontSize: 18.0,
//                                   ),
//                             ),
//                           ),
//                           Align(
//                             alignment: AlignmentDirectional(0.0, 1.0),
//                             child: Padding(
//                               padding: EdgeInsetsDirectional.fromSTEB(
//                                   0.0, 0.0, 0.0, 20.0),
//                               child: Text(
//                                 '00:00',
//                                 style: FlutterFlowTheme.of(context)
//                                     .bodyMedium
//                                     .override(
//                                       fontFamily: 'Readex Pro',
//                                       fontSize: 18.0,
//                                     ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       width: 180.0,
//                       height: 80.0,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(12.0),
//                         border: Border.all(
//                           color: FlutterFlowTheme.of(context).secondaryText,
//                         ),
//                       ),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.max,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Expanded(
//                             child: Text(
//                               'End Time',
//                               style: FlutterFlowTheme.of(context)
//                                   .bodyMedium
//                                   .override(
//                                     fontFamily: 'Open Sans',
//                                     fontSize: 18.0,
//                                   ),
//                             ),
//                           ),
//                           Align(
//                             alignment: AlignmentDirectional(0.0, 1.0),
//                             child: Padding(
//                               padding: EdgeInsetsDirectional.fromSTEB(
//                                   0.0, 0.0, 0.0, 20.0),
//                               child: Text(
//                                 '00:00',
//                                 style: FlutterFlowTheme.of(context)
//                                     .bodyMedium
//                                     .override(
//                                       fontFamily: 'Readex Pro',
//                                       fontSize: 18.0,
//                                     ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(20.0, 40.0, 20.0, 80.0),
//                 child: FFButtonWidget(
//                   onPressed: () async {
//                     context.pushNamed('userProfile1');
//                   },
//                   text: 'Create',
//                   options: FFButtonOptions(
//                     width: double.infinity,
//                     height: 40.0,
//                     padding:
//                         EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
//                     iconPadding:
//                         EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
//                     color: Color(0xFF59BB18),
//                     textStyle: FlutterFlowTheme.of(context).titleSmall.override(
//                           fontFamily: 'Open Sans',
//                           color: Colors.white,
//                         ),
//                     elevation: 3.0,
//                     borderSide: BorderSide(
//                       color: Colors.transparent,
//                       width: 1.0,
//                     ),
//                     borderRadius: BorderRadius.circular(18.0),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
