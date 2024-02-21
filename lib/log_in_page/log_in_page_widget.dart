import 'package:to_do_a_p_p/utils/constant/colors.dart';

import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'log_in_page_model.dart';
export 'log_in_page_model.dart';

class LogInPageWidget extends StatefulWidget {
  const LogInPageWidget({super.key});

  @override
  State<LogInPageWidget> createState() => _LogInPageWidgetState();
}

class _LogInPageWidgetState extends State<LogInPageWidget> {
  late LogIPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LogIPageModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();
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
          // top: true,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(image: AssetImage("assets/images/logo.png"), width: 150,),
                SizedBox(height: 40,),
                Text(
                  'Welcome Back',
                  style: FlutterFlowTheme.of(context)
                      .bodyMedium
                      .override(
                    fontFamily: 'Source Sans Pro',
                    fontSize: 28.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 5,),
                Text(
                  'I am Happy to see. You can continue to Login for manage your schedule',
                  style: FlutterFlowTheme.of(context)
                      .bodyMedium
                      .override(
                        fontFamily: 'Source Sans Pro',
                        fontSize: 16.0,
                    color: mainColor2

                      ),
                ),
                SizedBox(height: 40,),
                SizedBox(
                  height: 50,
                  child: TextFormField(
                    cursorColor: mainColor1,
                    controller: _model.textController1,
                    focusNode: _model.textFieldFocusNode1,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: FlutterFlowTheme.of(context)
                          .labelMedium
                          .override(
                            fontFamily: 'Roboto',
                            color: Color(0xFFACB7C1),
                          ),
                      hintStyle:
                          FlutterFlowTheme.of(context).labelMedium,
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
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      suffixIcon: Icon(
                        Icons.mail_outlined,
                      ),
                    ),
                    style: FlutterFlowTheme.of(context)
                        .bodyMedium
                        .override(
                          fontFamily: 'Source Sans Pro',
                        ),
                    validator: _model.textController1Validator
                        .asValidator(context),
                  ),
                ),
                SizedBox(height: 40,),
                SizedBox(
                  height: 50,
                  child: TextFormField(
                    cursorColor: mainColor1,
                    controller: _model.textController2,
                    focusNode: _model.textFieldFocusNode2,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: FlutterFlowTheme.of(context)
                          .labelMedium
                          .override(
                            fontFamily: 'Roboto',
                            color: Color(0xFFACB7C1),
                          ),
                      hintStyle:
                          FlutterFlowTheme.of(context).labelMedium,
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
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      suffixIcon: Icon(
                        Icons.lock_outlined,
                      ),
                    ),
                    style: FlutterFlowTheme.of(context)
                        .bodyMedium
                        .override(
                          fontFamily: 'Source Sans Pro',
                        ),
                    validator: _model.textController2Validator
                        .asValidator(context),
                  ),
                ),
                SizedBox(height: 40,),
                Row(
                  children: [
                    FlutterFlowRadioButton(
                      options: ['Remember me'].toList(),
                      onChanged: (val) => setState(() {}),
                      controller: _model
                              .radioButtonValueController ??=
                          FormFieldController<String>(null),
                      optionHeight: 32.0,
                      textStyle: FlutterFlowTheme.of(context)
                          .labelMedium,
                      selectedTextStyle:
                          FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Open Sans',
                                fontSize: 12.0,
                                fontWeight: FontWeight.w600,
                              ),
                      buttonPosition:
                          RadioButtonPosition.left,
                      // direction: Axis.vertical,
                      radioButtonColor: Color(0xFF59BB18),
                      inactiveRadioButtonColor:
                          FlutterFlowTheme.of(context)
                              .secondaryText,
                      toggleable: false,
                      horizontalAlignment:
                          WrapAlignment.start,
                      verticalAlignment:
                          WrapCrossAlignment.start,
                    ),
                    Spacer(),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed('ForgetPage');
                      },
                      child: Text(
                        'Forgot Password?',
                        textAlign: TextAlign.justify,
                        style: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                              fontFamily: 'Source Sans Pro',
                              color: mainColor2,
                            ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                FFButtonWidget(
                  onPressed: () {
                    context.pushNamed('userProfile1');
                  },
                  text: 'Log  In',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 50.0,
                    color: mainColor1,
                    textStyle:
                        FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily: 'Readex Pro',
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
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(),
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Don\'t have an account? ',
                        textAlign: TextAlign.start,
                        style:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Source Sans Pro',
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('NewAccPage');
                        },
                        child: Text(
                          'Sign Up',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Roboto',
                                color: mainColor2,
                                fontWeight: FontWeight.w800,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
