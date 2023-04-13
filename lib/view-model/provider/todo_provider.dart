import 'package:flutter/material.dart';
import 'package:flutterassignment/model/todo.dart';
import 'package:flutterassignment/model/services/todo_services.dart';
import 'package:flutterassignment/model/Featured.dart';
import 'package:flutterassignment/model/Popular.dart';

class TopProvider extends ChangeNotifier {
  final _service = TopService();
  bool isLoading = false;
  List<Top> _top = [];
  List<Top> get top => _top;
  List<Featured> _featured = [];
  List<Featured> get featured => _featured;
  List<Popular> _popular = [];
  List<Popular> get popular => _popular;

  Future<void> getAllpopular() async {
    isLoading = true;
    notifyListeners();

    final response = await _service.getAllpopular();

    _popular = response;
    isLoading = false;
    notifyListeners();
  }
  Future<void> getAllfeatured() async {
    isLoading = true;
    notifyListeners();

    final response = await _service.getAllfeatured();

    _featured = response;
    isLoading = false;
    notifyListeners();
  }

  Future<void> getAllTodos() async {
    isLoading = true;
    notifyListeners();

    final response = await _service.getAll();

    _top = response;
    isLoading = false;
    notifyListeners();
  }
}
