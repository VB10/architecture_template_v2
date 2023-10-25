import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

final class ProductState extends Equatable {
  const ProductState({this.themeMode = ThemeMode.light});

  final ThemeMode themeMode;

  @override
  List<Object> get props => [themeMode];

  ProductState copyWith({
    ThemeMode? themeMode,
  }) {
    return ProductState(
      themeMode: themeMode ?? this.themeMode,
    );
  }
}
