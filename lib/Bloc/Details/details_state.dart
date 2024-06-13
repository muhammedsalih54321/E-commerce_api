part of 'details_bloc.dart';

@immutable
sealed class DetailsState {}

final class DetailsInitial extends DetailsState {}
class Detailsblocloading extends DetailsState {}
class Detailsblocloaded extends DetailsState {}
class Detailsblocerror extends DetailsState {}
