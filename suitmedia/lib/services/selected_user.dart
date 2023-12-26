import 'package:flutter/material.dart';

class SelectedUserNameProvider extends ChangeNotifier {
  String _selectedUserName = '';

  String get selectedUserName => _selectedUserName;

  void setSelectedUserName(String userName) {
    _selectedUserName = userName;
    notifyListeners();
  }
}
