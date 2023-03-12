import 'package:flutter/material.dart';
import 'flutter_flow_theme.dart';

PreferredSize GrafitoAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: Align(
          alignment: AlignmentDirectional(0, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.network(
                'https://as2.ftcdn.net/v2/jpg/01/09/23/89/1000_F_109238979_8qLUFshVRXss6meBwqudhyDCxAcURXYP.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        title: Text(
          'Grafito Control UI',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
    );
}