part of 'fortune_cubit.dart';

@immutable
sealed class FortuneState {}

final class FortuneInitial extends FortuneState {}

final class FortuneLoaded extends FortuneState {
  final int balance;
  final int win;

  FortuneLoaded({required this.balance, required this.win});
}

