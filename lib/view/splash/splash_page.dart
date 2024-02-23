import 'package:go_router/go_router.dart';

import '../../utils/constant/colors.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'splash_page_model.dart';
export 'splash_page_model.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late SplashPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashPageModel());
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
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Welcome to',
                      style:
                      FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Open Sans',
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'To Do List Apps',
                      style:
                      FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Open Sans',
                        color: mainColor2,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 400.0,
                  // color: Colors.red,
                  child: CarouselSlider(
                    items: [
                      Image.asset(
                        'assets/images/onboarding1.png',
                        width: double.infinity,
                        // height: 500.0,
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/images/onboarding2.png',
                        width: double.infinity,                        // height: 500.0,
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/images/onboarding3.png',
                        width: double.infinity,                        // height: 600.0,
                        fit: BoxFit.cover,
                      ),
                    ],
                    carouselController: _model.carouselController ??=
                        CarouselController(),
                    options: CarouselOptions(
                      initialPage: 1,
                      viewportFraction: 0.8,
                      disableCenter: false,
                      enlargeCenterPage: true,
                      // enlargeFactor: 0.25,
                      enableInfiniteScroll: true,
                      scrollDirection: Axis.horizontal,
                      autoPlay: true,
                      autoPlayAnimationDuration:
                      Duration(milliseconds: 800),
                      autoPlayInterval:
                      Duration(milliseconds: (800 + 2000)),
                      autoPlayCurve: Curves.decelerate,
                      pauseAutoPlayInFiniteScroll: true,
                      onPageChanged: (index, _) =>
                      _model.carouselCurrentIndex = index,
                    ),
                  ),
                ),
                SizedBox(height: 50,),
                Text(
                  'Stay organized and productive with our powerful to-do app. Manage tasks effortlessly, set priorities, and track progress with ease. Boost your efficiency and accomplish more every day.',
                  textAlign: TextAlign.justify,
                  style:
                  FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Montserrat',
                    color: mainColor2,
                    fontSize: 12.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 50,),
                FFButtonWidget(
                  onPressed: () async {
                    context.pushReplacementNamed('signup');
                  },
                  text: 'Continue',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 50.0,
                    color: mainColor1,
                    textStyle: FlutterFlowTheme.of(context)
                        .titleSmall
                        .override(
                      fontFamily: 'Readex Pro',
                      color: Colors.white,
                    ),
                    elevation: 3.0,
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
