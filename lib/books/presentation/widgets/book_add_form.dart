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
  final _nameController = TextEditingController();
  final _yearController = TextEditingController();

  @override
  void dispose() {
    _isbnController.dispose();
    _nameController.dispose();
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
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          TextFormField(
            controller: _nameController,
          ),
          TextFormField(
            controller: _yearController,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          ElevatedButton(
              onPressed: () {
                context.read<BookBloc>().add(BookAdd(
                    book: Book(
                        isbn: int.parse(_isbnController.text),
                        name: _nameController.text,
                        yearPublished: int.parse(_yearController.text))));
              },
              child: const Text('Add Book'))
        ],
      ),
    );
  }
}
