

import 'package:flutter/cupertino.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}
final class CategoryLoading extends CategoryState {}

final class CategorySuccess extends CategoryState {
  final List<String> category;
  final int selectedIndex;
  CategorySuccess({required this.category, required this.selectedIndex,});
}
final class CategoryError extends CategoryState {
  final String message;
  CategoryError({required this.message});
}