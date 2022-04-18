import 'package:book_crud_api/model/book_model.dart';
import 'package:book_crud_api/pages/addbook_page.dart';
import 'package:book_crud_api/providers/book_provider.dart';
import 'package:book_crud_api/theme.dart';
import 'package:book_crud_api/widgets/card_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bookProvider = Provider.of<BookProvider>(context);

    Widget bodyItem() {
      return Container(
        margin: EdgeInsets.only(
          top: 14,
          left: defaultMargin,
          right: defaultMargin,
        ),
        padding: const EdgeInsets.only(bottom: 70),
        child: FutureBuilder<List<BookModel>>(
          builder: (context, snapshot) => Column(
            children: snapshot.data
                .map(
                  (e) => Container(
                    margin: const EdgeInsets.only(bottom: 14),
                    child: BookTile(
                      book: e,
                    ),
                  ),
                )
                .toList(),
          ),
          future: bookProvider.getBook(),
        ),
        // child: FutureBuilder<List<BookModel>>(
        //   future: bookProvider.getBook(),
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.done) {
        //       return Column(
        //           children: snapshot.data
        //               .map(
        //                 (json) => Container(
        //                   margin: const EdgeInsets.only(bottom: 10),
        //                   child: BookTile(
        //                     book: json,
        //                   ),
        //                 ),
        //               )
        //               .toList());
        //     }
        //   },
        // ),
      );
    }

    return Scaffold(
      backgroundColor: blueSecondColor,
      appBar: AppBar(
        title: Text('Book Management',
            style: txMedium.copyWith(
              color: whiteColor,
              fontSize: 20,
            )),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            bodyItem(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddBookPage()));
        },
        label: Text(
          'Add Book',
          style: txMedium.copyWith(fontSize: 12, color: whiteColor),
        ),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
