import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:library_app/books/bloc/book_bloc.dart';
import 'package:library_app/books/models/book.dart';
import 'package:provider/provider.dart';

class BookAddForm extends StatefulWidget {
  const BookAddForm({Key? key}) : super(key: key);

  @override
  State<BookAddForm> createState() => _BookAddFormState();
}

class _BookAddFormState extends State<BookAddForm> {
  final _formKey = GlobalKey();

  final _isbnController = TextEditingController();
  final _titleController = TextEditingController();
  final _yearController = TextEditingController();

  @override
  void dispose() {
    _isbnController.dispose();
    _titleController.dispose();
    _yearController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _isbnController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'ISBN',
            ),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          TextFormField(
            controller: _titleController,
            decoration: const InputDecoration(
              labelText: 'Name',
            ),
          ),
          TextFormField(
            controller: _yearController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Year',
            ),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          const SizedBox(height: 32),
          ElevatedButton(
              onPressed: () {
                context.read<BookBloc>().add(BookAdd(
                    book: Book(
                        isbn: int.parse(_isbnController.text),
                        title: _titleController.text,
                        yearPublished: int.parse(_yearController.text))));

                _isbnController.clear();
                _titleController.clear();
                _yearController.clear();
              },
              child: const Text('Add Book'))
        ],
      ),
    );
  }
}
