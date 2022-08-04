import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/books/bloc/book_bloc.dart';
import 'package:library_app/books/presentation/widgets/book_add_form.dart';
import 'package:library_app/books/presentation/widgets/book_list.dart';

class BookListPage extends StatelessWidget {
  const BookListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Books'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: BlocBuilder<BookBloc, BookState>(
            builder: (context, state) {
              if (state is BookInitial) {
                return const Text('Book Initial');
              } else if (state is BookLoading) {
                return const Text('Book Loading');
              } else if (state is BookLoaded) {
                return Column(
                  children: [
                    Expanded(child: BookList(books: state.books)),
                    const BookAddForm(),
                  ],
                );
              } else {
                return const Text('Book Bloc Unexpected Return');
              }
            },
          ),
        ),
      ),
    );
  }
}
