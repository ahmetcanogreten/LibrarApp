import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:library_app/books/models/book.dart';

class BookRow extends StatelessWidget {
  final Book book;
  const BookRow({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(book.isbn.toString()),
        Text(book.name),
        Text(book.yearPublished.toString())
      ],
    );
  }
}
