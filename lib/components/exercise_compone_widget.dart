import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'exercise_compone_model.dart';
export 'exercise_compone_model.dart';

class ExerciseComponeWidget extends StatefulWidget {
  const ExerciseComponeWidget({super.key});

  @override
  State<ExerciseComponeWidget> createState() => _ExerciseComponeWidgetState();
}

class _ExerciseComponeWidgetState extends State<ExerciseComponeWidget> {
  late ExerciseComponeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExerciseComponeModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: Text(
                    'add(${_model.total.toString()})',
                    textAlign: TextAlign.end,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Plus Jakarta Sans',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ],
            ),
          ),
          StreamBuilder<List<ExercisesRecord>>(
            stream: queryExercisesRecord(),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              List<ExercisesRecord> listViewExercisesRecordList =
                  snapshot.data!;

              return ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: listViewExercisesRecordList.length,
                itemBuilder: (context, listViewIndex) {
                  final listViewExercisesRecord =
                      listViewExercisesRecordList[listViewIndex];
                  return Material(
                    color: Colors.transparent,
                    child: Theme(
                      data: ThemeData(
                        checkboxTheme: CheckboxThemeData(
                          visualDensity: VisualDensity.compact,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                        unselectedWidgetColor:
                            FlutterFlowTheme.of(context).alternate,
                      ),
                      child: CheckboxListTile(
                        value: _model.checkboxListTileValueMap[
                            listViewExercisesRecord] ??= false,
                        onChanged: (newValue) async {
                          safeSetState(() => _model.checkboxListTileValueMap[
                              listViewExercisesRecord] = newValue!);
                          if (newValue!) {
                            _model.total = _model.total + 1;
                            safeSetState(() {});
                            FFAppState().updateWorkoutStruct(
                              (e) => e
                                ..updateExercise(
                                  (e) => e.add(ExercisesStruct(
                                    exerciseRef:
                                        listViewExercisesRecord.reference,
                                  )),
                                ),
                            );
                            safeSetState(() {});
                          } else {
                            _model.total = _model.total + -1;
                            safeSetState(() {});
                          }
                        },
                        title: Text(
                          listViewExercisesRecord.name,
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Outfit',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        subtitle: Text(
                          listViewExercisesRecord.bodyPart,
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Outfit',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        activeColor: FlutterFlowTheme.of(context).primary,
                        checkColor: FlutterFlowTheme.of(context).info,
                        dense: false,
                        controlAffinity: ListTileControlAffinity.trailing,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
