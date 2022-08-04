import 'package:flutter/material.dart';
import 'package:library_app/books/models/book.dart';
import 'package:library_app/books/presentation/widgets/book_row.dart';

class BookList extends StatelessWidget {
  final List<Book> books;
  const BookList({Key? key, required this.books}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                ),
                child: const Text('ISB', textAlign: TextAlign.right),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                ),
                child: const Text(
                  'Year',
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                ),
                child: const Text('Title'),
              ),
            ),
            const Expanded(flex: 2, child: SizedBox())
          ],
        ),
        ...books.map((eachBook) => BookRow(book: eachBook)).toList()
      ],
    );
  }
}
