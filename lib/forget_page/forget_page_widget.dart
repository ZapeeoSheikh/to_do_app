import 'package:to_do_a_p_p/utils/constant/colors.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'forget_page_model.dart';
export 'forget_page_model.dart';

class ForgetPageWidget extends StatefulWidget {
  const ForgetPageWidget({super.key});

  @override
  State<ForgetPageWidget> createState() => _ForgetPageWidgetState();
}

class _ForgetPageWidgetState extends State<ForgetPageWidget> {
  late ForgetPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ForgetPageModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
              children: [
                Text(
                  'Forget Password?',
                  style: FlutterFlowTheme.of(context)
                      .bodyMedium
                      .override(
                        fontFamily: 'Source Sans Pro',
                        fontSize: 26.0,
                        fontWeight: FontWeight.w800,
                      ),
                ),
                SizedBox(height: 60,),
                Image.asset(
                  'assets/images/forget.png',
                  width: double.infinity,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 50,),
                Text(
                  'Please enter your registered Email ID to reset your password. We\'ll send reset Password link to your Email ID',
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context)
                      .bodyMedium
                      .override(
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w600,
                    fontSize: 17
                      ),
                ),
                SizedBox(height: 40,),
                SizedBox(
                  height: 50,
                  child: TextFormField(
                    cursorColor: mainColor1,
                    controller: _model.textController,
                    focusNode: _model.textFieldFocusNode,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: FlutterFlowTheme.of(context)
                          .labelMedium
                          .override(
                            fontFamily: 'Source Sans Pro',
                          ),
                      hintStyle: FlutterFlowTheme.of(context)
                          .labelMedium
                          .override(
                            fontFamily: 'Readex Pro',
                            color: Color(0xFFACB7C1),
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
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    validator: _model.textControllerValidator
                        .asValidator(context),
                  ),
                ),
                SizedBox(height: 40,),
                Center(
                  child: Text(
                    'Try another way',
                    style: FlutterFlowTheme.of(context)
                        .bodyMedium
                        .override(
                          fontFamily: 'Readex Pro',
                          color: mainColor2,
                      fontSize: 14
                        ),
                  ),
                ),
                SizedBox(height: 40,),
                FFButtonWidget(
                  onPressed: () async {

                  },
                  text: 'Send',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
