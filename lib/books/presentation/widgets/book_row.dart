import 'package:flutter/material.dart';
import 'package:library_app/books/models/book.dart';
import 'package:provider/provider.dart';
import '../../bloc/book_bloc.dart';

class BookRow extends StatelessWidget {
  final Book book;
  const BookRow({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Text(book.isbn.toString(), textAlign: TextAlign.right)),
        const SizedBox(width: 16),
        Expanded(
            flex: 1,
            child: Text(book.yearPublished.toString(),
                textAlign: TextAlign.right)),
        const SizedBox(width: 16),
        Expanded(flex: 4, child: Text(book.title)),
        Expanded(
          flex: 1,
          child: IconButton(
            iconSize: 20,
            splashRadius: 20,
            padding: const EdgeInsets.all(0),
            onPressed: () {},
            icon: const Icon(
              Icons.edit,
              color: Colors.grey,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: IconButton(
            iconSize: 20,
            splashRadius: 20,
            padding: const EdgeInsets.all(0),
            onPressed: () {
              context.read<BookBloc>().add(BookDelete(book: book));
            },
            icon: const Icon(Icons.delete, color: Colors.grey),
          ),
        )
      ],
    );
  }
}
