import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class DogData extends ChangeNotifier {
  Map<String, dynamic> _map = {};
  bool _error = false;
  String _errorMessage = '';

  Map<String, dynamic> get map => _map;
  bool get error => _error;
  String get errorMessage => _errorMessage;

  Future<void> get fetchData async {
    final response =
        await get(Uri.parse('https://dog.ceo/api/breeds/list/all'));

    if (response.statusCode == 200) {
      try {
        _map = jsonDecode(response.body);
        _error = false;
        _errorMessage = '';
      } catch (e) {
        _error = true;
        _errorMessage = e.toString();
        _map = {};
      }
    } else {
      _error = true;
      _errorMessage = 'Error: ${response.statusCode}';
      _map = {};
    }
    notifyListeners();
  }

  void initialValues() {
    _map = {};
    _error = false;
    _errorMessage = '';
    notifyListeners();
  }
}
