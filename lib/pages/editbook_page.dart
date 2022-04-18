import 'package:book_crud_api/model/book_model.dart';
import 'package:book_crud_api/providers/book_provider.dart';
import 'package:book_crud_api/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class EditBookPage extends StatefulWidget {
  final BookModel book;
  EditBookPage({this.book});

  @override
  State<EditBookPage> createState() => _EditBookPageState();
}

class _EditBookPageState extends State<EditBookPage> {
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
        padding: const EdgeInsets.only(bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Judul Buku',
              style: txRegular.copyWith(color: blackColor, fontSize: 18),
            ),
            const SizedBox(
              height: 7,
            ),
            TextFormField(
              controller: widget.book.namaBuku == null
                  ? titleController
                  : titleController =
                      TextEditingController(text: widget.book.namaBuku),
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
        padding: const EdgeInsets.only(bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kategori Buku',
              style: txRegular.copyWith(color: blackColor, fontSize: 18),
            ),
            const SizedBox(
              height: 7,
            ),
            TextFormField(
              controller: widget.book.kategori == null
                  ? categoryController
                  : categoryController =
                      TextEditingController(text: widget.book.kategori),
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
        padding: const EdgeInsets.only(bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Penerbit Buku',
              style: txRegular.copyWith(color: blackColor, fontSize: 18),
            ),
            const SizedBox(
              height: 7,
            ),
            TextFormField(
              controller: widget.book.penerbit == null
                  ? penerbitController
                  : penerbitController =
                      TextEditingController(text: widget.book.penerbit),
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
        padding: const EdgeInsets.only(bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Penulis Buku',
              style: txRegular.copyWith(color: blackColor, fontSize: 18),
            ),
            const SizedBox(
              height: 7,
            ),
            TextFormField(
              controller: widget.book.pengarang == null
                  ? authorController
                  : authorController =
                      TextEditingController(text: widget.book.pengarang),
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
            const SizedBox(
              height: 7,
            ),
            TextField(
              controller: widget.book.harga == null
                  ? priceController
                  : priceController = TextEditingController(
                      text: widget.book.harga.toInt().toString()),
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
          ],
        ),
      );
    }

    Widget btnSave() {
      return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: ElevatedButton(
          onPressed: () async {
            setState(() {});
            if (titleController.text.isEmpty ||
                categoryController.text.isEmpty ||
                penerbitController.text.isEmpty ||
                authorController.text.isEmpty ||
                priceController.text.isEmpty) {
              showError('Semua Kolom Harus Di Isi..!!');
            } else {
              int id = widget.book.id;
              String title = titleController.text.toString();
              String category = categoryController.text.toString();
              String penerbit = penerbitController.text.toString();
              String author = authorController.text.toString();
              int price = int.tryParse(priceController.text.toString());

              bookProvider.addBook(
                  id, title, category, penerbit, author, price);

              bookProvider.getBook();
              Navigator.pop(context);
            }
          },
          style: TextButton.styleFrom(
            backgroundColor: blueBtnColor,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
        title: const Text('Edit '),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
