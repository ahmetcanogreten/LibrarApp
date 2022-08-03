part of 'book_bloc.dart';

abstract class BookEvent extends Equatable {
  const BookEvent();

  @override
  List<Object> get props => [];
}

class BookAdd extends BookEvent {
  final Book book;

  const BookAdd({required this.book});

  @override
  List<Object> get props => [book];
}

class BookDelete extends BookEvent {
  final Book book;

  const BookDelete({required this.book});

  @override
  List<Object> get props => [book];
}

class BookUpdate extends BookEvent {
  final Book bookBeforeUpdate;
  final Book bookAfterUpdate;

  const BookUpdate(
      {required this.bookBeforeUpdate, required this.bookAfterUpdate});

  @override
  List<Object> get props => [bookBeforeUpdate, bookAfterUpdate];
}

class BooksList extends BookEvent {}
