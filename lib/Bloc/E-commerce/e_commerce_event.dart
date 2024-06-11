part of 'e_commerce_bloc.dart';

@immutable
sealed class ECommerceEvent {}
class FetchEcommerce extends ECommerceEvent{
  final bool isAllProduct;
  final String brand;
  FetchEcommerce({required this.brand,required this.isAllProduct});
}
