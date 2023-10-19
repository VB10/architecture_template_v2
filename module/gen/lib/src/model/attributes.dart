// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'attributes.g.dart';

@JsonSerializable()
@immutable

/// This modal will use X api response
final class Attributes with EquatableMixin {
  /// It will be used to create a new instance of this class
  const Attributes({
    this.title,
    this.body,
    this.created,
    this.updated,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) =>
      _$AttributesFromJson(json);
  final String? title;
  final String? body;
  final DateTime? created;
  final DateTime? updated;

  /// The function converts an object of type Attributes to a JSON map.
  Map<String, dynamic> toJson() => _$AttributesToJson(this);

  @override
  List<Object?> get props => [title, body, created, updated];

  Attributes copyWith({
    String? title,
    String? body,
    DateTime? created,
    DateTime? updated,
  }) {
    return Attributes(
      title: title ?? this.title,
      body: body ?? this.body,
      created: created ?? this.created,
      updated: updated ?? this.updated,
    );
  }
}
