// To parse this JSON data, do
//
//     final bookModel = bookModelFromJson(jsonString);

import 'dart:convert';

BookModel bookModelFromJson(String str) => BookModel.fromJson(json.decode(str));

String bookModelToJson(BookModel data) => json.encode(data.toJson());

class BookModel {
  BookModel({
    this.id,
    this.namaBuku,
    this.kategori,
    this.penerbit,
    this.pengarang,
    this.harga,
  });

  int id;
  String namaBuku;
  String kategori;
  String penerbit;
  String pengarang;
  int harga;

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        id: json["id"],
        namaBuku: json["namaBuku"],
        kategori: json["kategori"],
        penerbit: json["penerbit"],
        pengarang: json["pengarang"],
        harga: json["harga"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "namaBuku": namaBuku,
        "kategori": kategori,
        "penerbit": penerbit,
        "pengarang": pengarang,
        "harga": harga,
      };
}
