import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _calcul = prefs.getInt('ff_calcul') ?? _calcul;
    });
    _safeInit(() {
      _Now = prefs.containsKey('ff_Now')
          ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_Now')!)
          : _Now;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  WorkoutStruct _Workout =
      WorkoutStruct.fromSerializableMap(jsonDecode('{\"exercise\":\"[]\"}'));
  WorkoutStruct get Workout => _Workout;
  set Workout(WorkoutStruct value) {
    _Workout = value;
  }

  void updateWorkoutStruct(Function(WorkoutStruct) updateFn) {
    updateFn(_Workout);
  }

  int _calcul = 0;
  int get calcul => _calcul;
  set calcul(int value) {
    _calcul = value;
    prefs.setInt('ff_calcul', value);
  }

  String _totaltodo = '';
  String get totaltodo => _totaltodo;
  set totaltodo(String value) {
    _totaltodo = value;
  }

  TodoStruct _todononcomplet = TodoStruct();
  TodoStruct get todononcomplet => _todononcomplet;
  set todononcomplet(TodoStruct value) {
    _todononcomplet = value;
  }

  void updateTodononcompletStruct(Function(TodoStruct) updateFn) {
    updateFn(_todononcomplet);
  }

  CalendrierStruct _calendrier = CalendrierStruct();
  CalendrierStruct get calendrier => _calendrier;
  set calendrier(CalendrierStruct value) {
    _calendrier = value;
  }

  void updateCalendrierStruct(Function(CalendrierStruct) updateFn) {
    updateFn(_calendrier);
  }

  DateTime? _Now = DateTime.fromMillisecondsSinceEpoch(1740588600000);
  DateTime? get Now => _Now;
  set Now(DateTime? value) {
    _Now = value;
    value != null
        ? prefs.setInt('ff_Now', value.millisecondsSinceEpoch)
        : prefs.remove('ff_Now');
  }

  DateTime? _currentdate = DateTime.fromMillisecondsSinceEpoch(1740588840000);
  DateTime? get currentdate => _currentdate;
  set currentdate(DateTime? value) {
    _currentdate = value;
  }

  /// photos of recipes
  List<String> _images = [];
  List<String> get images => _images;
  set images(List<String> value) {
    _images = value;
  }

  void addToImages(String value) {
    images.add(value);
  }

  void removeFromImages(String value) {
    images.remove(value);
  }

  void removeAtIndexFromImages(int index) {
    images.removeAt(index);
  }

  void updateImagesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    images[index] = updateFn(_images[index]);
  }

  void insertAtIndexInImages(int index, String value) {
    images.insert(index, value);
  }

  double _Height = 0.0;
  double get Height => _Height;
  set Height(double value) {
    _Height = value;
  }

  double _Weight = 0.0;
  double get Weight => _Weight;
  set Weight(double value) {
    _Weight = value;
  }

  String _searchQuery = '';
  String get searchQuery => _searchQuery;
  set searchQuery(String value) {
    _searchQuery = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
