part of 'review_bloc.dart';

@immutable
sealed class ReviewState {}

final class ReviewInitial extends ReviewState {}

class Reviewblocloading extends ReviewState {}
class Reviewblocloaded extends ReviewState {}
class Reviewblocerror extends ReviewState {}

