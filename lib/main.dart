import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/books/bloc/book_bloc.dart';
import 'package:library_app/books/presentation/pages/book_list_page.dart';
import 'package:library_app/books/repositories/book_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BookBloc>(
      create: (context) => BookBloc(BookRepository()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const BookListPage(),
      ),
    );
  }
}
