import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'categogry_list_model.dart';
export 'categogry_list_model.dart';

class CategogryListWidget extends StatefulWidget {
  const CategogryListWidget({super.key});

  @override
  State<CategogryListWidget> createState() => _CategogryListWidgetState();
}

class _CategogryListWidgetState extends State<CategogryListWidget> {
  late CategogryListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategogryListModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 300.0,
          height: 200.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(24.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).primaryBackground,
              width: 1.0,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.construction,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 48.0,
              ),
              Text(
                'Construction',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).titleMedium.override(
                      fontFamily:
                          FlutterFlowTheme.of(context).titleMediumFamily,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).titleMediumFamily),
                    ),
              ),
              Text(
                '0 open positions',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodySmallFamily),
                    ),
              ),
            ].divide(const SizedBox(height: 8.0)),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.circle,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 8.0,
            ),
            Icon(
              Icons.circle,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 8.0,
            ),
            Icon(
              Icons.circle,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 8.0,
            ),
            Icon(
              Icons.circle,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 8.0,
            ),
            Icon(
              Icons.circle,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 8.0,
            ),
            Icon(
              Icons.circle,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 8.0,
            ),
            Icon(
              Icons.circle,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 8.0,
            ),
            Icon(
              Icons.circle,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 8.0,
            ),
            Icon(
              Icons.circle,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 8.0,
            ),
          ].divide(const SizedBox(width: 8.0)),
        ),
      ].divide(const SizedBox(height: 16.0)),
    );
  }
}
