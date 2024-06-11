part of 'e_commerce_bloc.dart';

@immutable
sealed class ECommerceState {}

final class ECommerceInitial extends ECommerceState {}
class ECommerceblocloading extends ECommerceState {}
class ECommerceblocloaded extends ECommerceState {}
class ECommerceblocerror extends ECommerceState {}

