import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:just_audio/just_audio.dart';
import 'voice_a_i_model.dart';
export 'voice_a_i_model.dart';

class VoiceAIWidget extends StatefulWidget {
  const VoiceAIWidget({super.key});

  @override
  State<VoiceAIWidget> createState() => _VoiceAIWidgetState();
}

class _VoiceAIWidgetState extends State<VoiceAIWidget> {
  late VoiceAIModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VoiceAIModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.soundPlayer ??= AudioPlayer();
      if (_model.soundPlayer!.playing) {
        await _model.soundPlayer!.stop();
      }
      _model.soundPlayer!.setVolume(1.0);
      _model.soundPlayer!.setUrl('').then((_) => _model.soundPlayer!.play());
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 25.0),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.mic,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 120.0,
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.759,
                            decoration: const BoxDecoration(),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/explore-mfa918/assets/s6d4n7vfuwa0/Screencast_from_2024-11-01_17-38-24.gif',
                                width: 125.0,
                                height: 231.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(height: 40.0)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
