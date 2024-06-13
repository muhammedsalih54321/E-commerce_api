part of 'details_bloc.dart';

@immutable
sealed class DetailsEvent {}
class FetchDetails extends DetailsEvent{
  final String id;

  FetchDetails({required this.id});

  

  
  

}