// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'flutter_flow_theme.dart';
import 'flutter_flow_widgets.dart';

class EndEffectorFrontWidget extends StatefulWidget {
  EndEffectorFrontWidget({Key? key}) : super(key: key);

  @override
  _EndEffectorFrontWidgetState createState() => _EndEffectorFrontWidgetState();
}

class _EndEffectorFrontWidgetState extends State<EndEffectorFrontWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final _unfocusNode = FocusNode();

  // define the slider value
  double sliderValue1 = 0.0;
  double sliderValue2 = 0.0;
  double sliderValue3 = 0.0;
  double sliderValue4 = 0.0;

  @override
  void initState() {
    super.initState();
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
      width: 500,
      height: 298.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Color(0xFFD23793),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: Text(
                'Adjust Scion Height',
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Poppins',
                      fontSize: 10,
                    ),
              ),
            ),
            Slider(
              activeColor: FlutterFlowTheme.of(context).primaryColor,
              inactiveColor: Color(0xFF9E9E9E),
              min: 0,
              max: 10,
              value: sliderValue1 ??= 0,
              label: sliderValue1.toString(),
              onChanged: (newValue) {
                newValue = double.parse(newValue.toStringAsFixed(4));
                setState(() {
                  sliderValue1 = newValue;
                  print(sliderValue1);
                });
              },
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
              child: FFButtonWidget(
                onPressed: () {
                  print('Button pressed ...');
                },
                text: 'Splice',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 40,
                  color: FlutterFlowTheme.of(context).tertiaryColor,
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  alignment: AlignmentDirectional(-0.9, 0),
                  child: Text(
                    'Aligner',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Container(
                    width: 390,
                    child: Slider(
                      activeColor: FlutterFlowTheme.of(context).primaryColor,
                      inactiveColor: Color(0xFF9E9E9E),
                      min: 0,
                      max: 10,
                      value: sliderValue2 ??= 0,
                      onChanged: (newValue) {
                        newValue = double.parse(newValue.toStringAsFixed(4));
                        setState(() => sliderValue2 = newValue);
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Slider(
                  activeColor: FlutterFlowTheme.of(context).primaryColor,
                  inactiveColor: Color(0xFF9E9E9E),
                  min: 0,
                  max: 10,
                  value: sliderValue3 ??= 0,
                  onChanged: (newValue) {
                    newValue = double.parse(newValue.toStringAsFixed(4));
                    setState(() => sliderValue3 = newValue);
                  },
                ),
                Text(
                  'Bottom Aligner',
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
                Slider(
                  activeColor: FlutterFlowTheme.of(context).primaryColor,
                  inactiveColor: Color(0xFF9E9E9E),
                  min: 0,
                  max: 10,
                  value: sliderValue4 ??= 0,
                  onChanged: (newValue) {
                    newValue = double.parse(newValue.toStringAsFixed(4));
                    setState(() => sliderValue4 = newValue);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
