// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers

import 'package:book_crud_api/model/book_model.dart';
import 'package:book_crud_api/theme.dart';
import 'package:flutter/material.dart';

class BookDetailPage extends StatelessWidget {
  final BookModel bookData;
  BookDetailPage({this.bookData});
  @override
  Widget build(BuildContext context) {
    Widget dotItem(String text) {
      return Container(
        child: Row(
          children: [
            Icon(
              Icons.adjust,
              color: blueBtnColor,
              size: 12,
            ),
            SizedBox(
              width: 7,
            ),
            Text(
              text,
              style: txLight.copyWith(color: blackColor),
            )
          ],
        ),
      );
    }

    Widget idBook() {
      return Container(
        padding: EdgeInsets.only(bottom: 34),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            dotItem('ID'),
            SizedBox(
              width: 3,
            ),
            Text(
              '${bookData.id}',
              style: txMedium.copyWith(
                fontSize: 20,
                color: blackColor,
              ),
            )
          ],
        ),
      );
    }

    Widget titleBook() {
      return Container(
        padding: EdgeInsets.only(bottom: 34),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            dotItem('Title'),
            SizedBox(
              width: 3,
            ),
            Text(
              bookData.namaBuku,
              style: txMedium.copyWith(
                fontSize: 20,
                color: blackColor,
              ),
            )
          ],
        ),
      );
    }

    Widget categoryBook() {
      return Container(
        padding: EdgeInsets.only(bottom: 34),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            dotItem('Category'),
            SizedBox(
              width: 3,
            ),
            Text(
              bookData.kategori,
              style: txMedium.copyWith(
                fontSize: 20,
                color: blackColor,
              ),
            )
          ],
        ),
      );
    }

    Widget penerbitBook() {
      return Container(
        padding: EdgeInsets.only(bottom: 34),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            dotItem('Penerbit'),
            SizedBox(
              width: 3,
            ),
            Text(
              bookData.penerbit,
              style: txMedium.copyWith(
                fontSize: 20,
                color: blackColor,
              ),
            )
          ],
        ),
      );
    }

    Widget authorBook() {
      return Container(
        padding: EdgeInsets.only(bottom: 34),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            dotItem('Author'),
            SizedBox(
              width: 3,
            ),
            Text(
              bookData.pengarang,
              style: txMedium.copyWith(
                fontSize: 20,
                color: blackColor,
              ),
            )
          ],
        ),
      );
    }

    Widget priceBook() {
      return Container(
        padding: EdgeInsets.only(bottom: 34),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            dotItem('Price'),
            SizedBox(
              width: 3,
            ),
            Text(
              'Rp. ${bookData.harga}',
              style: txMedium.copyWith(
                fontSize: 20,
                color: blackColor,
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Book',
          style: txMedium.copyWith(
            fontSize: 20,
            color: whiteColor,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: ListView(
            children: [
              idBook(),
              titleBook(),
              categoryBook(),
              penerbitBook(),
              authorBook(),
              priceBook()
            ],
          ),
        ),
      ),
    );
  }
}
