import 'package:library_app/books/models/book.dart';

abstract class IBookRepository {
  Future<List<Book>> getAllBooks();
  Future<List<Book>> addBook(Book bookToBeAdded);
  Future<List<Book>> deleteBook(Book bookToBeDeleted);
  Future<List<Book>> updateBook(Book bookBeforeUpdate, Book bookAfterUpdate);
}

class BookRepository implements IBookRepository {
  List<Book> _books = [];

  BookRepository();

  @override
  Future<List<Book>> getAllBooks() async {
    return Future.delayed(const Duration(seconds: 1), () => _books);
  }

  @override
  Future<List<Book>> addBook(Book bookToBeAdded) async {
    _books.add(bookToBeAdded);
    return _books;
  }

  @override
  Future<List<Book>> deleteBook(Book bookToBeDeleted) async {
    _books.remove(bookToBeDeleted);
    return _books;
  }

  @override
  Future<List<Book>> updateBook(
      Book bookBeforeUpdate, Book bookAfterUpdate) async {
    final insertIndex = _books.indexOf(bookBeforeUpdate);
    _books.remove(bookBeforeUpdate);
    _books.insert(insertIndex, bookAfterUpdate);
    return _books;
  }
}
