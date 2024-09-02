import 'package:flutter/material.dart';
import 'cpd_activity_model.dart';
import 'cpd_activity_service.dart';

class CpdActivityLogic extends ChangeNotifier {
  CpdActivityModel _cpdActivity = CpdActivityModel(
    code: 200,
    message: "",
    data: Data(
      lookup: Lookup(
          trainingModes: [], provinces: [], districts: [], providers: []),
      courses: [],
    ),
  );
  CpdActivityModel get cpdActivity => _cpdActivity;

  bool _loading = false;
  bool get loading => _loading;

  void enableLoading() {
    _loading = true;
    notifyListeners();
  }

  void disableLoading() {
    _loading = false;
    notifyListeners();
  }

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  void fetch() async {
    enableLoading();
    try {
      _cpdActivity = await CpdActivityService.readData();
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    }

    disableLoading();
    notifyListeners();
  }

  List<Course> _courses = [];
  List<Course> get courses => _courses;

  bool _smallToBigSorted = true;
  bool get smallToBigSorted => _smallToBigSorted;

  void toggleSortByDate() {
    _courses = _cpdActivity.data.courses;
    if (_smallToBigSorted) {
      courses.sort((x, y) => x.startDate.compareTo(y.startDate));
    } else {
      courses.sort((x, y) => y.startDate.compareTo(x.startDate));
    }
    _smallToBigSorted = !_smallToBigSorted;
    notifyListeners();
  }


}
