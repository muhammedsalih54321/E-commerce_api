part of 'review_bloc.dart';

@immutable
sealed class ReviewEvent {}

class Fetchreview extends ReviewEvent{
  final String id;

  Fetchreview({required this.id});
  

}
