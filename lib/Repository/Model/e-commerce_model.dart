
class ECommerceModel {
    String? status;
    String? requestId;
    Data? data;

    ECommerceModel({this.status, this.requestId, this.data});

    ECommerceModel.fromJson(Map<String, dynamic> json) {
        if(json["status"] is String) {
            status = json["status"];
        }
        if(json["request_id"] is String) {
            requestId = json["request_id"];
        }
        if(json["data"] is Map) {
            data = json["data"] == null ? null : Data.fromJson(json["data"]);
        }
    }

    static List<ECommerceModel> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => ECommerceModel.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["status"] = status;
        _data["request_id"] = requestId;
        if(data != null) {
            _data["data"] = data?.toJson();
        }
        return _data;
    }

    ECommerceModel copyWith({
        String? status,
        String? requestId,
        Data? data,
    }) => ECommerceModel(
        status: status ?? this.status,
        requestId: requestId ?? this.requestId,
        data: data ?? this.data,
    );
}

class Data {
    int? totalProducts;
    String? country;
    String? domain;
    List<Products>? products;

    Data({this.totalProducts, this.country, this.domain, this.products});

    Data.fromJson(Map<String, dynamic> json) {
        if(json["total_products"] is num) {
            totalProducts = (json["total_products"] as num).toInt();
        }
        if(json["country"] is String) {
            country = json["country"];
        }
        if(json["domain"] is String) {
            domain = json["domain"];
        }
        if(json["products"] is List) {
            products = json["products"] == null ? null : (json["products"] as List).map((e) => Products.fromJson(e)).toList();
        }
    }

    static List<Data> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Data.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["total_products"] = totalProducts;
        _data["country"] = country;
        _data["domain"] = domain;
        if(products != null) {
            _data["products"] = products?.map((e) => e.toJson()).toList();
        }
        return _data;
    }

    Data copyWith({
        int? totalProducts,
        String? country,
        String? domain,
        List<Products>? products,
    }) => Data(
        totalProducts: totalProducts ?? this.totalProducts,
        country: country ?? this.country,
        domain: domain ?? this.domain,
        products: products ?? this.products,
    );
}

class Products {
    String? asin;
    String? productTitle;
    String? productPrice;
    dynamic productOriginalPrice;
    String? currency;
    String? productStarRating;
    int? productNumRatings;
    String? productUrl;
    String? productPhoto;
    int? productNumOffers;
    String? productMinimumOfferPrice;
    bool? isBestSeller;
    bool? isAmazonChoice;
    bool? isPrime;
    bool? climatePledgeFriendly;
    String? salesVolume;
    String? delivery;

    Products({this.asin, this.productTitle, this.productPrice, this.productOriginalPrice, this.currency, this.productStarRating, this.productNumRatings, this.productUrl, this.productPhoto, this.productNumOffers, this.productMinimumOfferPrice, this.isBestSeller, this.isAmazonChoice, this.isPrime, this.climatePledgeFriendly, this.salesVolume, this.delivery});

    Products.fromJson(Map<String, dynamic> json) {
        if(json["asin"] is String) {
            asin = json["asin"];
        }
        if(json["product_title"] is String) {
            productTitle = json["product_title"];
        }
        if(json["product_price"] is String) {
            productPrice = json["product_price"];
        }
        productOriginalPrice = json["product_original_price"];
        if(json["currency"] is String) {
            currency = json["currency"];
        }
        if(json["product_star_rating"] is String) {
            productStarRating = json["product_star_rating"];
        }
        if(json["product_num_ratings"] is num) {
            productNumRatings = (json["product_num_ratings"] as num).toInt();
        }
        if(json["product_url"] is String) {
            productUrl = json["product_url"];
        }
        if(json["product_photo"] is String) {
            productPhoto = json["product_photo"];
        }
        if(json["product_num_offers"] is num) {
            productNumOffers = (json["product_num_offers"] as num).toInt();
        }
        if(json["product_minimum_offer_price"] is String) {
            productMinimumOfferPrice = json["product_minimum_offer_price"];
        }
        if(json["is_best_seller"] is bool) {
            isBestSeller = json["is_best_seller"];
        }
        if(json["is_amazon_choice"] is bool) {
            isAmazonChoice = json["is_amazon_choice"];
        }
        if(json["is_prime"] is bool) {
            isPrime = json["is_prime"];
        }
        if(json["climate_pledge_friendly"] is bool) {
            climatePledgeFriendly = json["climate_pledge_friendly"];
        }
        if(json["sales_volume"] is String) {
            salesVolume = json["sales_volume"];
        }
        if(json["delivery"] is String) {
            delivery = json["delivery"];
        }
    }

    static List<Products> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Products.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["asin"] = asin;
        _data["product_title"] = productTitle;
        _data["product_price"] = productPrice;
        _data["product_original_price"] = productOriginalPrice;
        _data["currency"] = currency;
        _data["product_star_rating"] = productStarRating;
        _data["product_num_ratings"] = productNumRatings;
        _data["product_url"] = productUrl;
        _data["product_photo"] = productPhoto;
        _data["product_num_offers"] = productNumOffers;
        _data["product_minimum_offer_price"] = productMinimumOfferPrice;
        _data["is_best_seller"] = isBestSeller;
        _data["is_amazon_choice"] = isAmazonChoice;
        _data["is_prime"] = isPrime;
        _data["climate_pledge_friendly"] = climatePledgeFriendly;
        _data["sales_volume"] = salesVolume;
        _data["delivery"] = delivery;
        return _data;
    }

    Products copyWith({
        String? asin,
        String? productTitle,
        String? productPrice,
        dynamic productOriginalPrice,
        String? currency,
        String? productStarRating,
        int? productNumRatings,
        String? productUrl,
        String? productPhoto,
        int? productNumOffers,
        String? productMinimumOfferPrice,
        bool? isBestSeller,
        bool? isAmazonChoice,
        bool? isPrime,
        bool? climatePledgeFriendly,
        String? salesVolume,
        String? delivery,
    }) => Products(
        asin: asin ?? this.asin,
        productTitle: productTitle ?? this.productTitle,
        productPrice: productPrice ?? this.productPrice,
        productOriginalPrice: productOriginalPrice ?? this.productOriginalPrice,
        currency: currency ?? this.currency,
        productStarRating: productStarRating ?? this.productStarRating,
        productNumRatings: productNumRatings ?? this.productNumRatings,
        productUrl: productUrl ?? this.productUrl,
        productPhoto: productPhoto ?? this.productPhoto,
        productNumOffers: productNumOffers ?? this.productNumOffers,
        productMinimumOfferPrice: productMinimumOfferPrice ?? this.productMinimumOfferPrice,
        isBestSeller: isBestSeller ?? this.isBestSeller,
        isAmazonChoice: isAmazonChoice ?? this.isAmazonChoice,
        isPrime: isPrime ?? this.isPrime,
        climatePledgeFriendly: climatePledgeFriendly ?? this.climatePledgeFriendly,
        salesVolume: salesVolume ?? this.salesVolume,
        delivery: delivery ?? this.delivery,
    );
}