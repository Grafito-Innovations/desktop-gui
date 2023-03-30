// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'flutter_flow_theme.dart';
import 'flutter_flow_widgets.dart';
import 'package:roslibdart/roslibdart.dart';
import 'dart:async';
import 'dart:convert';

class CartesianoSetupWidget extends StatefulWidget {
  CartesianoSetupWidget({Key? key}) : super(key: key);

  @override
  _CartesianoSetupWidgetState createState() => _CartesianoSetupWidgetState();
}

class _CartesianoSetupWidgetState extends State<CartesianoSetupWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final _unfocusNode = FocusNode();

  late Ros ros;
  late Topic x_setpoint;
  late Topic y_setpoint;
  late Topic set_speed;
  late Topic set_acceleration;

  int x = 0;
  int y = 0;
  int speed = 0;
  int acceleration = 0;

  final xController = TextEditingController();
  final yController = TextEditingController();
  final speedController = TextEditingController();
  final accelerationController = TextEditingController();

  @override
  void initState() {
    super.initState();

    ros = Ros(url: 'ws://127.0.0.1:9090');
    // subscribe to the topic
    x_setpoint = Topic(
        ros: ros,
        name: "/base_xstepper_new_setpoint_insteps",
        type: "std_msgs/Int64",
        reconnectOnClose: true,
        queueLength: 10,
        queueSize: 10);

    y_setpoint = Topic(
        ros: ros,
        name: "/base_ystepper_new_setpoint_insteps",
        type: "std_msgs/Int64",
        reconnectOnClose: true,
        queueLength: 10,
        queueSize: 10);

    set_speed = Topic(
        ros: ros,
        name: "/base_stepper_set_speed_in_hz",
        type: "std_msgs/Int64",
        reconnectOnClose: true,
        queueLength: 10,
        queueSize: 10);

    set_acceleration = Topic(
        ros: ros,
        name: "/base_stepper_set_acceleration",
        type: "std_msgs/Int64",
        reconnectOnClose: true,
        queueLength: 10,
        queueSize: 10);

    ros.connect();
  }

  void destroyConnection() async {
    await x_setpoint.unsubscribe();
    await y_setpoint.unsubscribe();
    await set_speed.unsubscribe();
    await set_acceleration.unsubscribe();

    await ros.close();
    setState(() {});
  }

  void publishCoordinate() {
    int xSetpoint = int.tryParse(xController.text) ?? 0;
    int ySetpoint = int.tryParse(yController.text) ?? 0;

    Map<String, dynamic> xSetpointMap = {
      "data": xSetpoint.toInt(),
    };

    Map<String, dynamic> ySetpointMap = {
      "data": ySetpoint.toInt(),
    };

    String xSetpointJson = jsonEncode(xSetpointMap);
    String ySetpointJson = jsonEncode(ySetpointMap);

    x_setpoint.publish({'data': xSetpoint.toInt()});
    y_setpoint.publish({'data': ySetpoint.toInt()});
  }

  void setSpeedAndAcceleration() {
    int speedSetpoint = int.tryParse(speedController.text) ?? 0;
    int accelerationSetpoint = int.tryParse(accelerationController.text) ?? 0;

    Map<String, dynamic> speedSetpointMap = {
      'data': speedSetpoint.toInt(),
    };

    Map<String, dynamic> accelerationSetpointMap = {
      'data': accelerationSetpoint.toInt(),
    };

    String speedSetpointJson = jsonEncode(speedSetpointMap);
    String accelerationSetpointJson = jsonEncode(accelerationSetpointMap);

    set_speed.publish({'data': speedSetpoint.toInt()});
    set_acceleration.publish({'data': accelerationSetpoint.toInt()});
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    xController.dispose();
    yController.dispose();
    speedController.dispose();
    accelerationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return // Generated code for this Container Widget...
        Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
      child: Container(
        width: 390,
        height: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          shape: BoxShape.rectangle,
          border: Border.all(
            color: Color(0xFFA241D3),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                child: FFButtonWidget(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  text: 'Auto Caliberate',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 50,
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    color: Color(0xFF8C11BD),
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
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: TextFormField(
                      autofocus: true,
                      controller: xController,
                      textCapitalization: TextCapitalization.none,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'X axis',
                        hintText: '120 mm',
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
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      autofocus: true,
                      controller: speedController,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Speed',
                        hintText: '1 cm/s',
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
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: TextFormField(
                      autofocus: true,
                      controller: yController,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Y axis',
                        hintText: '120 mm',
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
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      autofocus: true,
                      controller: accelerationController,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Acceleration',
                        hintText: '1 cm/s2',
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
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: FFButtonWidget(
                      onPressed: () {
                        setState(() {
                          publishCoordinate();
                          // print value from the text field
                        });
                      },
                      text: 'Publish',
                      options: FFButtonOptions(
                        width: 150,
                        height: 40,
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: Color(0xFF0C994A),
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
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
                  FFButtonWidget(
                    onPressed: () {
                      setState(() {
                        setSpeedAndAcceleration();
                        print(speedController.text);
                        print(accelerationController.text);
                      });
                    },
                    text: 'Set',
                    options: FFButtonOptions(
                      width: 150,
                      height: 40,
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: Color(0xFF2987E3),
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
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
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Current X :',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                          ),
                    ),
                    Text(
                      '30',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                          ),
                    ),
                    Text(
                      'Current Y :',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                          ),
                    ),
                    Text(
                      '40',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
