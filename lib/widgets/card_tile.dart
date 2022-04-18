// ignore_for_file: prefer_const_constructors

import 'package:book_crud_api/model/book_model.dart';
import 'package:book_crud_api/pages/detailbook_page.dart';
import 'package:book_crud_api/pages/editbook_page.dart';
import 'package:book_crud_api/providers/book_provider.dart';
import 'package:book_crud_api/theme.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:provider/provider.dart';

class BookTile extends StatelessWidget {
  final BookModel book;
  BookTile({this.book});

  @override
  Widget build(BuildContext context) {
    var bookProvider = Provider.of<BookProvider>(context);

    return FocusedMenuHolder(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookDetailPage(
              bookData: book,
            ),
          ),
        );
      },
      menuItems: [
        FocusedMenuItem(
            title: Text(
              'Edit Buku',
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditBookPage(
                            book: book,
                          )));
            }),
        FocusedMenuItem(
          title: Text(
            'Delete',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.red.shade400,
          onPressed: () {
            bookProvider.deleteBook(book.id);
          },
        ),
      ],
      child: Container(
        width: MediaQuery.of(context).size.width - 2 * 16,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        // margin: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(3, 5),
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '${book.id}',
              style: txMedium.copyWith(
                color: blackColor,
                fontSize: 18,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.namaBuku,
                    style: txMedium.copyWith(
                      color: blackColor,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    book.pengarang,
                    style: txRegular.copyWith(
                      color: greyColor,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    book.penerbit,
                    style: txRegular.copyWith(
                      color: greyColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15),
              width: 110,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.kategori,
                    style: txRegular.copyWith(color: greyColor, fontSize: 14),
                  ),
                  Text('Rp. ${book.harga}',
                      style:
                          txMedium.copyWith(fontSize: 16, color: blackColor)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
