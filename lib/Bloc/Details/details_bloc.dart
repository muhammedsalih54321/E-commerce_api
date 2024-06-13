import 'package:bloc/bloc.dart';
import 'package:e_commerce_api/Repository/Api/E-commerce/e-commerce_api.dart';
import 'package:e_commerce_api/Repository/Model/product_model.dart';
import 'package:meta/meta.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  late ProductModel productModel;
  EcommerceApi detailsapi=EcommerceApi();
  DetailsBloc() : super(DetailsInitial()) {
    on<FetchDetails>((event, emit)async {
    emit(Detailsblocloading());
    try {
      productModel =await detailsapi.getdetails(event.id);
      emit(Detailsblocloaded());
    } catch (e) {
      print(e);
      emit(Detailsblocerror());
    }
    });
  }
}
