// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) => Book(
      isbn: json['isbn'] as int,
      name: json['name'] as String,
      yearPublished: json['yearPublished'] as int,
    );

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'isbn': instance.isbn,
      'name': instance.name,
      'yearPublished': instance.yearPublished,
    };
