import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:library_app/books/repositories/book_repository.dart';

import '../models/book.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final IBookRepository _bookRepository;

  BookBloc(IBookRepository bookRepository)
      : _bookRepository = bookRepository,
        super(BookInitial()) {
    on<BooksList>((event, emit) async {
      emit(BookLoading());
      List<Book> books = await _bookRepository.getAllBooks();
      emit(BookLoaded(books: books));
    });
    on<BookAdd>(
      (event, emit) async {
        emit(BookLoading());
        await _bookRepository.addBook(event.book);
        final books = await _bookRepository.getAllBooks();
        emit(BookLoaded(books: books));
      },
    );
    on<BookDelete>(
      (event, emit) async {
        emit(BookLoading());
        await _bookRepository.deleteBook(event.book);
        final books = await _bookRepository.getAllBooks();
        emit(BookLoaded(books: books));
      },
    );
    on<BookUpdate>(
      (event, emit) async {
        emit(BookLoading());
        await _bookRepository.updateBook(
            event.bookBeforeUpdate, event.bookAfterUpdate);
        final books = await _bookRepository.getAllBooks();
        emit(BookLoaded(books: books));
      },
    );

    add(BooksList());
  }
}
