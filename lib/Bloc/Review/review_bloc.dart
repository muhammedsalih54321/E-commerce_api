import 'package:bloc/bloc.dart';
import 'package:e_commerce_api/Repository/Api/E-commerce/e-commerce_api.dart';
import 'package:e_commerce_api/Repository/Model/review_model.dart';
import 'package:meta/meta.dart';

part 'review_event.dart';
part 'review_state.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {

  late Reviewmodel reviewmodel;
  EcommerceApi reviewApi=EcommerceApi();
  ReviewBloc() : super(ReviewInitial()) {

    on<Fetchreview>((event, emit)async {
     emit(Reviewblocloading());
      try {
       reviewmodel =await reviewApi.getreview(event.id);
        emit(Reviewblocloaded());
      } catch (e) {
        print(e);
        emit(Reviewblocerror());
      }
    });
  }
}
