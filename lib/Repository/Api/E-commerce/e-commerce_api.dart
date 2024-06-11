import 'dart:convert';


import 'package:e_commerce_api/Repository/Api/api_client.dart';
import 'package:e_commerce_api/Repository/Model/e-commerce_model.dart';
import 'package:http/http.dart';


class EcommerceApi {
  ApiClient apiClient = ApiClient();


  Future<ECommerceModel> getproduct(bool allProduct,String brand) async {
    String trendingpath = '';
    if(allProduct==true){
      trendingpath='https://real-time-amazon-data.p.rapidapi.com/search?query=Phone&page=1&country=US&sort_by=RELEVANCE&product_condition=ALL';
    }else{
      trendingpath='https://real-time-amazon-data.p.rapidapi.com/search?query=Phone&page=1&country=US&sort_by=RELEVANCE&product_condition=ALL&brand=${brand}';
    }
    var body = {

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return ECommerceModel.fromJson(jsonDecode(response.body));
  }
}