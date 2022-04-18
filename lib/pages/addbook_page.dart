import 'package:book_crud_api/model/book_model.dart';
import 'package:book_crud_api/providers/book_provider.dart';
import 'package:book_crud_api/providers/new_provider.dart';
import 'package:book_crud_api/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AddBookPage extends StatefulWidget {
  @override
  State<AddBookPage> createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  //* Fill Input Controller
  TextEditingController titleController = TextEditingController(text: (''));

  TextEditingController categoryController = TextEditingController(text: (''));

  TextEditingController penerbitController = TextEditingController(text: (''));

  TextEditingController authorController = TextEditingController(text: (''));

  TextEditingController priceController = TextEditingController(text: (''));

  @override
  Widget build(BuildContext context) {
    //* Provider
    var bookProvider = Provider.of<BookProvider>(context);
    var newProvider = Provider.of<NewBookProvider>(context);

    bool isLoading = false;
    //! Blank Filed Notice
    void showError(String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
        ),
      );
    }

    Widget titleInput() {
      return Container(
        padding: EdgeInsets.only(bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Judul Buku',
              style: txRegular.copyWith(color: blackColor, fontSize: 18),
            ),
            SizedBox(
              height: 7,
            ),
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: 'Masukkan Judul Buku',
                hintStyle: txLight.copyWith(color: greyColor, fontSize: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: greyColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: bluePrimaryColor),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                filled: true,
              ),
              cursorColor: bluePrimaryColor,
              style: txRegular.copyWith(fontSize: 16, color: bluePrimaryColor),
            ),
          ],
        ),
      );
    }

    Widget categoryInput() {
      return Container(
        padding: EdgeInsets.only(bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kategori Buku',
              style: txRegular.copyWith(color: blackColor, fontSize: 18),
            ),
            SizedBox(
              height: 7,
            ),
            TextFormField(
              controller: categoryController,
              decoration: InputDecoration(
                hintText: 'Masukkan Kategori Buku',
                hintStyle: txLight.copyWith(color: greyColor, fontSize: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: greyColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: bluePrimaryColor),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                filled: true,
              ),
              cursorColor: bluePrimaryColor,
              style: txRegular.copyWith(fontSize: 16, color: bluePrimaryColor),
            ),
          ],
        ),
      );
    }

    Widget penerbitInput() {
      return Container(
        padding: EdgeInsets.only(bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Penerbit Buku',
              style: txRegular.copyWith(color: blackColor, fontSize: 18),
            ),
            SizedBox(
              height: 7,
            ),
            TextFormField(
              controller: penerbitController,
              decoration: InputDecoration(
                hintText: 'Masukkan Penerbit Buku',
                hintStyle: txLight.copyWith(color: greyColor, fontSize: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: greyColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: bluePrimaryColor),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                filled: true,
              ),
              cursorColor: bluePrimaryColor,
              style: txRegular.copyWith(fontSize: 16, color: bluePrimaryColor),
            ),
          ],
        ),
      );
    }

    Widget authorInput() {
      return Container(
        padding: EdgeInsets.only(bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Penulis Buku',
              style: txRegular.copyWith(color: blackColor, fontSize: 18),
            ),
            SizedBox(
              height: 7,
            ),
            TextFormField(
              controller: authorController,
              decoration: InputDecoration(
                hintText: 'Masukkan Nama Penulis',
                hintStyle: txLight.copyWith(color: greyColor, fontSize: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: greyColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: bluePrimaryColor),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                filled: true,
              ),
              cursorColor: bluePrimaryColor,
              style: txRegular.copyWith(fontSize: 16, color: bluePrimaryColor),
            ),
          ],
        ),
      );
    }

    Widget priceInpit() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Harga Buku',
              style: txRegular.copyWith(color: blackColor, fontSize: 18),
            ),
            SizedBox(
              height: 7,
            ),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Masukkan Harga Buku',
                hintStyle: txLight.copyWith(color: greyColor, fontSize: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: greyColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: bluePrimaryColor),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                filled: true,
              ),
              cursorColor: bluePrimaryColor,
              style: txRegular.copyWith(fontSize: 16, color: bluePrimaryColor),
            ),
            // TextFormField(
            //   inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            //   controller: priceController,
            //   decoration: InputDecoration(
            //     hintText: 'Masukkan Harga Buku',
            //     hintStyle: txLight.copyWith(color: greyColor, fontSize: 16),
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(10),
            //       borderSide: BorderSide(color: greyColor),
            //     ),
            //     focusedBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(10),
            //       borderSide: BorderSide(color: bluePrimaryColor),
            //     ),
            //     contentPadding:
            //         const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            //     filled: true,
            //   ),
            //   cursorColor: bluePrimaryColor,
            //   style: txRegular.copyWith(fontSize: 16, color: bluePrimaryColor),
            // ),
          ],
        ),
      );
    }

    Widget btnSave() {
      return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: ElevatedButton(
          onPressed: () async {
            if (titleController.text.isEmpty ||
                categoryController.text.isEmpty ||
                penerbitController.text.isEmpty ||
                authorController.text.isEmpty ||
                priceController.text.isEmpty) {
              showError('Semua Kolom Harus Di Isi..!!');
            } else {
              int id = 1;
              String title = titleController.text.toString();
              String category = categoryController.text.toString();
              String penerbit = penerbitController.text.toString();
              String author = authorController.text.toString();
              int price = int.tryParse(priceController.text).toInt();

              BookModel newbook = await bookProvider.addBook(
                  id, title, category, penerbit, author, price);

              if (newbook != null) {
                showError('buku sudah di tambahkan');
              } else {
                newProvider.book = newbook;
                Navigator.pushNamed(context, '/listBook');
              }
              // BookModel book = await bookProvider.addBook(
              //   titleController.text.toString(),
              //   categoryController.text.toString(),
              //   penerbitController.text.toString(),
              //   authorController.text.toString(),
              //   int.parse(priceController.text.toString()),
              // );
            }
          },
          style: TextButton.styleFrom(
            backgroundColor: blueBtnColor,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            'Simpan',
            style: txMedium.copyWith(color: blackColor, fontSize: 22),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Add a New Book'),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                titleInput(),
                categoryInput(),
                penerbitInput(),
                authorInput(),
                priceInpit(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: btnSave(),
    );
  }
}
