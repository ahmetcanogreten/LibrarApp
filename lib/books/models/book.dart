import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'book.g.dart';

@JsonSerializable()
class Book extends Equatable {
  final int isbn;
  final String title;
  final int yearPublished;

  const Book(
      {required this.isbn, required this.title, required this.yearPublished});

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  Map<String, dynamic> toJson() => _$BookToJson(this);

  @override
  List<Object> get props => [isbn, title, yearPublished];
}
