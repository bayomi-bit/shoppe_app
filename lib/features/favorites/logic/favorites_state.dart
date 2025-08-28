part of 'favorites_cubit.dart';

@immutable
sealed class FavoritesState {}

final class FavoritesInitial extends FavoritesState {}
final class FavoritesLoaded extends FavoritesState {
  final List<Product> products;
  FavoritesLoaded({required this.products});
}
final class FavoritesError extends FavoritesState {
  final String message;
  FavoritesError({required this.message});
}
final class FavoritesLoading extends FavoritesState {}
