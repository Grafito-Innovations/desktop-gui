import 'dart:math';

import 'package:flutter/material.dart';
import 'flutter_flow_theme.dart';
import 'flutter_flow_widgets.dart';
import 'package:roslibdart/roslibdart.dart';
import 'dart:async';
import 'dart:convert';

class EndEffectorSetupWidget extends StatefulWidget {
  EndEffectorSetupWidget({Key? key}) : super(key: key);

  @override
  _EndEffectorSetupWidgetState createState() => _EndEffectorSetupWidgetState();
}

class _EndEffectorSetupWidgetState extends State<EndEffectorSetupWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  late Ros ros;

  late Topic sy12_setpoint;
  late Topic sy34_setpoint;
  late Topic bg12_setpoint;
  late Topic bg34_setpoint;

  int counter_bg12 = 0;
  int counter_bg34 = 0;

  @override
  void initState() {
    super.initState();

    ros = Ros(url: 'ws://127.0.0.1:9090');

    sy12_setpoint = Topic(
      ros: ros,
      name: '/sy12_setpoint',
      type: 'std_msgs/Float32',
      reconnectOnClose: true,
      queueLength: 10,
      queueSize: 1,
      compression: 'none',
    );

    sy34_setpoint = Topic(
      ros: ros,
      name: '/sy34_setpoint',
      type: 'std_msgs/Float32',
      reconnectOnClose: true,
      queueLength: 10,
      queueSize: 1,
      compression: 'none',
    );

    bg12_setpoint = Topic(
      ros: ros,
      name: '/bg12_setpoint',
      type: 'std_msgs/Float32',
      reconnectOnClose: true,
      queueLength: 10,
      queueSize: 1,
      compression: 'none',
    );

    bg34_setpoint = Topic(
      ros: ros,
      name: '/bg34_setpoint',
      type: 'std_msgs/Float32',
      reconnectOnClose: true,
      queueLength: 10,
      queueSize: 1,
      compression: 'none',
    );

    ros.connect();
  }

  void activateSy12() {
    var counter = 20;
    var counter2 = 20;

    Timer.periodic(const Duration(milliseconds: 40), (timer1) {
      if (counter == 0) {
        Timer.periodic(const Duration(milliseconds: 40), (timer2) {
          sy12_setpoint.publish({'data': 0.0});
          counter2--;
          print(counter2);
          if (counter2 == 0) {
            timer2.cancel();
            timer1.cancel();
            counter = 1;
            counter2 = 1;
          }
        });
      } else {
        sy12_setpoint.publish({'data': 300.0});
        counter--;
        print(counter);
      }
    });
  }

  void activateSy34() {
    var counter = 20;
    var counter2 = 20;

    Timer.periodic(const Duration(milliseconds: 40), (timer1) {
      if (counter == 0) {
        Timer.periodic(const Duration(milliseconds: 40), (timer2) {
          sy34_setpoint.publish({'data': 0.0});
          counter2--;
          print(counter2);
          if (counter2 == 0) {
            timer2.cancel();
            timer1.cancel();
            counter = 1;
            counter2 = 1;
          }
        });
      } else {
        sy34_setpoint.publish({'data': 300.0});
        counter--;
        print(counter);
      }
    });
  }

  void hold_bg12() {
    int counter = 20;
    Timer.periodic(const Duration(milliseconds: 40), (timer1) {
      if (counter == 0) {
        timer1.cancel();
        counter = 1;
      } else {
        bg12_setpoint.publish({'data': 260.0});
        counter--;
        print(counter);
      }
    });
  }

  void release_bg12() {
    int counter = 20;
    Timer.periodic(const Duration(milliseconds: 40), (timer1) {
      if (counter == 0) {
        timer1.cancel();
        counter = 1;
      } else {
        bg12_setpoint.publish({'data': 0.0});
        counter--;
        print(counter);
      }
    });
  }

  void hold_bg34() {
    int counter = 20;
    Timer.periodic(const Duration(milliseconds: 40), (timer1) {
      if (counter == 0) {
        timer1.cancel();
        counter = 1;
      } else {
        bg34_setpoint.publish({'data': 1000.0});
        counter--;
        print(counter);
      }
    });
  }

  void release_bg34() {
    int counter = 20;
    Timer.periodic(const Duration(milliseconds: 40), (timer1) {
      if (counter == 0) {
        timer1.cancel();
        counter = 1;
      } else {
        bg34_setpoint.publish({'data': 0.0});
        counter--;
        print(counter);
      }
    });
  }

  void destroryConnection() async {
    await sy12_setpoint.unsubscribe();
    await sy34_setpoint.unsubscribe();
    await bg12_setpoint.unsubscribe();
    await bg34_setpoint.unsubscribe();

    await ros.close();

    setState(() {});
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return // Generated code for this Container Widget...
        Container(
      width: 378,
      height: 500,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color(0xFFD22F2F),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
            child: TextFormField(
              // controller: _model.textController3,
              autofocus: true,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Z axis',
                hintText: 'Adjust height of scion',
                hintStyle: FlutterFlowTheme.of(context).bodyText2,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x00000000),
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
              ),
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                  ),
              keyboardType: TextInputType.number,
              // validator: _model.textController3Validator.asValidator(context),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
            child: FFButtonWidget(
              onPressed: () {
                print('Button pressed ...');
              },
              text: 'Set',
              options: FFButtonOptions(
                width: double.infinity,
                height: 40,
                color: Color(0xFF0C994A),
                textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: 8,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
            child: FFButtonWidget(
              onPressed: () {
                setState(() {
                  if (counter_bg12 % 2 == 0) {
                    hold_bg12();
                    print("Hold");
                  } else {
                    release_bg12();
                    print("Release");
                  }
                  counter_bg12++;
                });
              },
              text: 'Hold Bottom of Root',
              options: FFButtonOptions(
                width: double.infinity,
                height: 40,
                color: FlutterFlowTheme.of(context).primaryColor,
                textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: 8,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
            child: FFButtonWidget(
              onPressed: () {
                setState(() {
                  if (counter_bg34 % 2 == 0) {
                    hold_bg34();
                    print("Hold");
                  } else {
                    release_bg34();
                    print("Release");
                  }
                  counter_bg34++;
                });
              },
              text: 'Hold Bottom of Scion',
              options: FFButtonOptions(
                width: double.infinity,
                height: 40,
                color: FlutterFlowTheme.of(context).primaryColor,
                textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: 8,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
            child: FFButtonWidget(
              onPressed: () {
                print('Splice Scion Button pressed ...');
                setState(() {
                  activateSy12();
                });
              },
              text: 'Splice Scion',
              options: FFButtonOptions(
                width: double.infinity,
                height: 40,
                color: FlutterFlowTheme.of(context).primaryColor,
                textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: 8,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
            child: FFButtonWidget(
              onPressed: () {
                print('Splice Root Stock');
                setState(() {
                  activateSy34();
                });
              },
              text: 'Splice Root Stock',
              options: FFButtonOptions(
                width: double.infinity,
                height: 40,
                color: FlutterFlowTheme.of(context).primaryColor,
                textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
