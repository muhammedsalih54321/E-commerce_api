import 'dart:convert';


import 'package:e_commerce_api/Repository/Api/api_client.dart';
import 'package:e_commerce_api/Repository/Model/e-commerce_model.dart';
import 'package:e_commerce_api/Repository/Model/product_model.dart';
import 'package:e_commerce_api/Repository/Model/review_model.dart';
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
  Future<Reviewmodel> getreview(String id) async {
    String trendingpath = 'https://real-time-amazon-data.p.rapidapi.com/product-reviews?asin=${id}&country=US&sort_by=TOP_REVIEWS&star_rating=ALL&verified_purcha';
   
    var body = {

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return Reviewmodel.fromJson(jsonDecode(response.body));
  }
   Future<ProductModel> getdetails(String id) async {
    String trendingpath = 'https://real-time-amazon-data.p.rapidapi.com/product-offers?asin=${id}&country=US&limit=100&page=1';
   
    var body = {

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return ProductModel.fromJson(jsonDecode(response.body));
  }
  
}