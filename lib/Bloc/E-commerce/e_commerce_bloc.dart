import 'package:bloc/bloc.dart';
import 'package:e_commerce_api/Repository/Api/E-commerce/e-commerce_api.dart';
import 'package:e_commerce_api/Repository/Model/e-commerce_model.dart';
import 'package:meta/meta.dart';

part 'e_commerce_event.dart';
part 'e_commerce_state.dart';

class ECommerceBloc extends Bloc<ECommerceEvent, ECommerceState> {
  late ECommerceModel eCommerceModel;
  EcommerceApi ecommerceApi =EcommerceApi();
  ECommerceBloc() : super(ECommerceInitial()) {
    on<FetchEcommerce>((event, emit)async {
      emit(ECommerceblocloading());
      try {
        eCommerceModel =await ecommerceApi.getproduct(event.isAllProduct,event.brand);
        emit(ECommerceblocloaded());
      } catch (e) {
        print(e);
        emit(ECommerceblocerror());
      }
  
    });
  }
}
