import 'package:book_crud_api/pages/addbook_page.dart';
import 'package:book_crud_api/pages/detailbook_page.dart';
import 'package:book_crud_api/pages/editbook_page.dart';
import 'package:book_crud_api/pages/list_page.dart';
import 'package:book_crud_api/pages/splash_page.dart';
import 'package:book_crud_api/providers/book_provider.dart';
import 'package:book_crud_api/providers/new_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() => runApp(BookManagement());

class BookManagement extends StatelessWidget {
  const BookManagement({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BookProvider>(
            create: (context) => BookProvider()),
        ChangeNotifierProvider<NewBookProvider>(
            create: (context) => NewBookProvider())
      ],
      child: MaterialApp(
        routes: {
          '/': (context) => SplashPage(),
          '/listBook': (context) => ListPage(),
          '/addBook': (context) => AddBookPage(),
          '/editBook': (context) => EditBookPage(),
          '/detailBook': (context) => BookDetailPage(),
        },
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
      ),
    );
  }
}
