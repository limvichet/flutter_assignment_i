import 'package:flutter/material.dart';

import 'cpd_activity_model.dart';



class FavoriteCpdActivityLogic extends ChangeNotifier {
  final List<Course> _favoriteCpdActivities = [];
  List<Course> get favoriteCpdActivities => _favoriteCpdActivities;

  void toggle(Course item) {
    bool faved = isFavorite(item);
    if (faved) {
      remove(item);
    } else {
      add(item);
    }
  }

  void add(Course item) {
    _favoriteCpdActivities.add(item);
    notifyListeners();
  }

  void remove(Course item) {
    _favoriteCpdActivities.remove(item);
    notifyListeners();
  }

  bool isFavorite(Course item) {
    return _favoriteCpdActivities.contains(item);
  }

  int get numOfFavorite{
    return _favoriteCpdActivities.length;
  }
}
