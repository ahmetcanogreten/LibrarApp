import 'package:flutter/material.dart';
import 'package:library_app/books/models/book.dart';
import 'package:library_app/books/presentation/widgets/book_row.dart';

class BookList extends StatelessWidget {
  final List<Book> books;
  const BookList({Key? key, required this.books}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: books.map((eachBook) => BookRow(book: eachBook)).toList(),
    );
  }
}
