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
        final books = await _bookRepository.addBook(event.book);
        emit(BookLoaded(books: books));
      },
    );
    on<BookDelete>(
      (event, emit) async {
        emit(BookLoading());
        final books = await _bookRepository.deleteBook(event.book);
        emit(BookLoaded(books: books));
      },
    );
    on<BookUpdate>(
      (event, emit) async {
        emit(BookLoading());
        final books = await _bookRepository.updateBook(
            event.bookBeforeUpdate, event.bookAfterUpdate);
        emit(BookLoaded(books: books));
      },
    );

    add(BooksList());

    add(const BookAdd(
        book: Book(isbn: 1, title: 'Book 1', yearPublished: 2020)));

    add(const BookAdd(
        book: Book(isbn: 2, title: 'Book 2', yearPublished: 2020)));

    add(const BookAdd(
        book: Book(isbn: 3, title: 'Book 3', yearPublished: 2020)));
  }
}
