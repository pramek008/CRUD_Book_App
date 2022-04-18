// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:book_crud_api/model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BookProvider with ChangeNotifier {
  Future<List<BookModel>> getBook() async {
    try {
      var response = await http.get(
        Uri.parse('http://10.0.2.2:8080/book'),
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        List<BookModel> books = [];
        List parsedJson = jsonDecode(response.body);

        for (var book in parsedJson) {
          books.add(BookModel.fromJson(book));
        }

        return books;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<BookModel> addBook(
    int id,
    String title,
    String category,
    String penerbit,
    String author,
    int price,
  ) async {
    try {
      String apiUrl = 'http://10.0.2.2:8080/book';
      final headers = {'Content-Type': 'application/json; charset=UTF-8'};
      final encoding = Encoding.getByName('utf-8');
      var body = {
        'id': id,
        'namaBuku': title,
        'kategori': category,
        'penerbit': penerbit,
        'pengarang': author,
        'harga': price
      };

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: jsonEncode(body),
        encoding: encoding,
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        return BookModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to create album.');
      }
    } on Exception catch (_, e) {
      print(e);
    }
  }

  Future<BookModel> updateBook(
    int id,
    String title,
    String category,
    String penerbit,
    String author,
    int price,
  ) async {
    try {
      var body = {
        'id': id,
        'namaBuku': title,
        'kategori': category,
        'penerbit': penerbit,
        'pengarang': author,
        'harga': price
      };

      var uri = 'http://10.0.2.2:8080/book/updatebook';
      var response = await http.put(
        Uri.parse(uri),
        body: jsonEncode(body),
      );
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 201) {
        return BookModel.fromJson(jsonDecode(response.body));
      } else {
        print('Failed to update album');
      }
    } on Exception catch (_, e) {
      print(e);
    }
  }

  Future<BookModel> deleteBook(int id) async {
    try {
      String uri = 'http://127.0.0.1:8080/book/$id';
      final headers = {'Content-Type': 'application/json; charset=UTF-8'};
      var response = await http.delete(
        Uri.parse(uri),
        headers: headers,
      );

      if (response.statusCode == 200) {
        return BookModel.fromJson(
          jsonDecode(response.body),
        );
      } else {
        throw Exception('Failed to delete album.');
      }
    } on Exception catch (_, e) {
      print(e);
    }
  }
}
