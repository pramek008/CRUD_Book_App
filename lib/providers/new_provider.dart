import 'package:book_crud_api/model/book_model.dart';
import 'package:flutter/material.dart';

class NewBookProvider with ChangeNotifier {
  BookModel _book;

  BookModel get book => _book;

  set book(BookModel value) {
    _book = value;
    notifyListeners();
  }
}
