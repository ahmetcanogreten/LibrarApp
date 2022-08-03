import 'package:library_app/books/models/book.dart';

abstract class IBookRepository {
  Future<List<Book>> getAllBooks();
  Future<void> addBook(Book bookToBeAdded);
  Future<void> deleteBook(Book bookToBeDeleted);
  Future<void> updateBook(Book bookBeforeUpdate, Book bookAfterUpdate);
}

class BookRepository implements IBookRepository {
  List<Book> _books = [];

  BookRepository();

  @override
  Future<List<Book>> getAllBooks() async {
    return Future.delayed(const Duration(seconds: 1), () => _books);
  }

  @override
  Future<void> addBook(Book bookToBeAdded) async {
    _books.add(bookToBeAdded);
  }

  @override
  Future<void> deleteBook(Book bookToBeDeleted) async {
    _books.remove(bookToBeDeleted);
  }

  @override
  Future<void> updateBook(Book bookBeforeUpdate, Book bookAfterUpdate) async {
    final insertIndex = _books.indexOf(bookBeforeUpdate);
    _books.remove(bookBeforeUpdate);
    _books.insert(insertIndex, bookAfterUpdate);
  }
}
