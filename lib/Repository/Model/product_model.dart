
class ProductModel {
    String? status;
    String? requestId;
    Data? data;

    ProductModel({this.status, this.requestId, this.data});

    ProductModel.fromJson(Map<String, dynamic> json) {
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

    static List<ProductModel> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => ProductModel.fromJson(map)).toList();
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

    ProductModel copyWith({
        String? status,
        String? requestId,
        Data? data,
    }) => ProductModel(
        status: status ?? this.status,
        requestId: requestId ?? this.requestId,
        data: data ?? this.data,
    );
}

class Data {
    String? asin;
    String? productTitle;
    String? productPrice;
    dynamic productOriginalPrice;
    String? currency;
    String? country;
    String? productStarRating;
    int? productNumRatings;
    String? productUrl;
    String? productPhoto;
    int? productNumOffers;
    String? productAvailability;
    bool? isBestSeller;
    bool? isAmazonChoice;
    bool? isPrime;
    bool? climatePledgeFriendly;
    String? salesVolume;
    List<String>? aboutProduct;
    String? productDescription;
    ProductInformation? productInformation;

    List<String>? productPhotos;
    ProductDetails? productDetails;
    String? customersSay;
    ReviewAspects? reviewAspects;
    List<CategoryPath>? categoryPath;
    List<dynamic>? productVariations;
    List<ProductOffers>? productOffers;

    Data({this.asin, this.productTitle, this.productPrice, this.productOriginalPrice, this.currency, this.country, this.productStarRating, this.productNumRatings, this.productUrl, this.productPhoto, this.productNumOffers, this.productAvailability, this.isBestSeller, this.isAmazonChoice, this.isPrime, this.climatePledgeFriendly, this.salesVolume, this.aboutProduct, this.productDescription, this.productInformation, this.productPhotos, this.productDetails, this.customersSay, this.reviewAspects, this.categoryPath, this.productVariations, this.productOffers});

    Data.fromJson(Map<String, dynamic> json) {
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
        if(json["country"] is String) {
            country = json["country"];
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
        if(json["product_availability"] is String) {
            productAvailability = json["product_availability"];
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
        if(json["about_product"] is List) {
            aboutProduct = json["about_product"] == null ? null : List<String>.from(json["about_product"]);
        }
        if(json["product_description"] is String) {
            productDescription = json["product_description"];
        }
        if(json["product_information"] is Map) {
            productInformation = json["product_information"] == null ? null : ProductInformation.fromJson(json["product_information"]);
        }
       
        if(json["product_photos"] is List) {
            productPhotos = json["product_photos"] == null ? null : List<String>.from(json["product_photos"]);
        }
        if(json["product_details"] is Map) {
            productDetails = json["product_details"] == null ? null : ProductDetails.fromJson(json["product_details"]);
        }
        if(json["customers_say"] is String) {
            customersSay = json["customers_say"];
        }
        if(json["review_aspects"] is Map) {
            reviewAspects = json["review_aspects"] == null ? null : ReviewAspects.fromJson(json["review_aspects"]);
        }
        if(json["category_path"] is List) {
            categoryPath = json["category_path"] == null ? null : (json["category_path"] as List).map((e) => CategoryPath.fromJson(e)).toList();
        }
        if(json["product_variations"] is List) {
            productVariations = json["product_variations"] ?? [];
        }
        if(json["product_offers"] is List) {
            productOffers = json["product_offers"] == null ? null : (json["product_offers"] as List).map((e) => ProductOffers.fromJson(e)).toList();
        }
    }

    static List<Data> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Data.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["asin"] = asin;
        _data["product_title"] = productTitle;
        _data["product_price"] = productPrice;
        _data["product_original_price"] = productOriginalPrice;
        _data["currency"] = currency;
        _data["country"] = country;
        _data["product_star_rating"] = productStarRating;
        _data["product_num_ratings"] = productNumRatings;
        _data["product_url"] = productUrl;
        _data["product_photo"] = productPhoto;
        _data["product_num_offers"] = productNumOffers;
        _data["product_availability"] = productAvailability;
        _data["is_best_seller"] = isBestSeller;
        _data["is_amazon_choice"] = isAmazonChoice;
        _data["is_prime"] = isPrime;
        _data["climate_pledge_friendly"] = climatePledgeFriendly;
        _data["sales_volume"] = salesVolume;
        if(aboutProduct != null) {
            _data["about_product"] = aboutProduct;
        }
        _data["product_description"] = productDescription;
        if(productInformation != null) {
            _data["product_information"] = productInformation?.toJson();
        }
      
        if(productPhotos != null) {
            _data["product_photos"] = productPhotos;
        }
        if(productDetails != null) {
            _data["product_details"] = productDetails?.toJson();
        }
        _data["customers_say"] = customersSay;
        if(reviewAspects != null) {
            _data["review_aspects"] = reviewAspects?.toJson();
        }
        if(categoryPath != null) {
            _data["category_path"] = categoryPath?.map((e) => e.toJson()).toList();
        }
        if(productVariations != null) {
            _data["product_variations"] = productVariations;
        }
        if(productOffers != null) {
            _data["product_offers"] = productOffers?.map((e) => e.toJson()).toList();
        }
        return _data;
    }

    Data copyWith({
        String? asin,
        String? productTitle,
        String? productPrice,
        dynamic productOriginalPrice,
        String? currency,
        String? country,
        String? productStarRating,
        int? productNumRatings,
        String? productUrl,
        String? productPhoto,
        int? productNumOffers,
        String? productAvailability,
        bool? isBestSeller,
        bool? isAmazonChoice,
        bool? isPrime,
        bool? climatePledgeFriendly,
        String? salesVolume,
        List<String>? aboutProduct,
        String? productDescription,
        ProductInformation? productInformation,
     
        List<String>? productPhotos,
        ProductDetails? productDetails,
        String? customersSay,
        ReviewAspects? reviewAspects,
        List<CategoryPath>? categoryPath,
        List<dynamic>? productVariations,
        List<ProductOffers>? productOffers,
    }) => Data(
        asin: asin ?? this.asin,
        productTitle: productTitle ?? this.productTitle,
        productPrice: productPrice ?? this.productPrice,
        productOriginalPrice: productOriginalPrice ?? this.productOriginalPrice,
        currency: currency ?? this.currency,
        country: country ?? this.country,
        productStarRating: productStarRating ?? this.productStarRating,
        productNumRatings: productNumRatings ?? this.productNumRatings,
        productUrl: productUrl ?? this.productUrl,
        productPhoto: productPhoto ?? this.productPhoto,
        productNumOffers: productNumOffers ?? this.productNumOffers,
        productAvailability: productAvailability ?? this.productAvailability,
        isBestSeller: isBestSeller ?? this.isBestSeller,
        isAmazonChoice: isAmazonChoice ?? this.isAmazonChoice,
        isPrime: isPrime ?? this.isPrime,
        climatePledgeFriendly: climatePledgeFriendly ?? this.climatePledgeFriendly,
        salesVolume: salesVolume ?? this.salesVolume,
        aboutProduct: aboutProduct ?? this.aboutProduct,
        productDescription: productDescription ?? this.productDescription,
        productInformation: productInformation ?? this.productInformation,
      
        productPhotos: productPhotos ?? this.productPhotos,
        productDetails: productDetails ?? this.productDetails,
        customersSay: customersSay ?? this.customersSay,
        reviewAspects: reviewAspects ?? this.reviewAspects,
        categoryPath: categoryPath ?? this.categoryPath,
        productVariations: productVariations ?? this.productVariations,
        productOffers: productOffers ?? this.productOffers,
    );
}

class ProductOffers {
    String? productPrice;
    String? productCondition;
    String? shipsFrom;
    String? seller;
    String? sellerLink;
    String? sellerStarRating;
    String? sellerStarRatingInfo;
    String? currency;
    String? deliveryPrice;
    String? deliveryTime;

    ProductOffers({this.productPrice, this.productCondition, this.shipsFrom, this.seller, this.sellerLink, this.sellerStarRating, this.sellerStarRatingInfo, this.currency, this.deliveryPrice, this.deliveryTime});

    ProductOffers.fromJson(Map<String, dynamic> json) {
        if(json["product_price"] is String) {
            productPrice = json["product_price"];
        }
        if(json["product_condition"] is String) {
            productCondition = json["product_condition"];
        }
        if(json["ships_from"] is String) {
            shipsFrom = json["ships_from"];
        }
        if(json["seller"] is String) {
            seller = json["seller"];
        }
        if(json["seller_link"] is String) {
            sellerLink = json["seller_link"];
        }
        if(json["seller_star_rating"] is String) {
            sellerStarRating = json["seller_star_rating"];
        }
        if(json["seller_star_rating_info"] is String) {
            sellerStarRatingInfo = json["seller_star_rating_info"];
        }
        if(json["currency"] is String) {
            currency = json["currency"];
        }
        if(json["delivery_price"] is String) {
            deliveryPrice = json["delivery_price"];
        }
        if(json["delivery_time"] is String) {
            deliveryTime = json["delivery_time"];
        }
    }

    static List<ProductOffers> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => ProductOffers.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["product_price"] = productPrice;
        _data["product_condition"] = productCondition;
        _data["ships_from"] = shipsFrom;
        _data["seller"] = seller;
        _data["seller_link"] = sellerLink;
        _data["seller_star_rating"] = sellerStarRating;
        _data["seller_star_rating_info"] = sellerStarRatingInfo;
        _data["currency"] = currency;
        _data["delivery_price"] = deliveryPrice;
        _data["delivery_time"] = deliveryTime;
        return _data;
    }

    ProductOffers copyWith({
        String? productPrice,
        String? productCondition,
        String? shipsFrom,
        String? seller,
        String? sellerLink,
        String? sellerStarRating,
        String? sellerStarRatingInfo,
        String? currency,
        String? deliveryPrice,
        String? deliveryTime,
    }) => ProductOffers(
        productPrice: productPrice ?? this.productPrice,
        productCondition: productCondition ?? this.productCondition,
        shipsFrom: shipsFrom ?? this.shipsFrom,
        seller: seller ?? this.seller,
        sellerLink: sellerLink ?? this.sellerLink,
        sellerStarRating: sellerStarRating ?? this.sellerStarRating,
        sellerStarRatingInfo: sellerStarRatingInfo ?? this.sellerStarRatingInfo,
        currency: currency ?? this.currency,
        deliveryPrice: deliveryPrice ?? this.deliveryPrice,
        deliveryTime: deliveryTime ?? this.deliveryTime,
    );
}

class CategoryPath {
    String? id;
    String? name;
    String? link;

    CategoryPath({this.id, this.name, this.link});

    CategoryPath.fromJson(Map<String, dynamic> json) {
        if(json["id"] is String) {
            id = json["id"];
        }
        if(json["name"] is String) {
            name = json["name"];
        }
        if(json["link"] is String) {
            link = json["link"];
        }
    }

    static List<CategoryPath> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => CategoryPath.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["name"] = name;
        _data["link"] = link;
        return _data;
    }

    CategoryPath copyWith({
        String? id,
        String? name,
        String? link,
    }) => CategoryPath(
        id: id ?? this.id,
        name: name ?? this.name,
        link: link ?? this.link,
    );
}

class ReviewAspects {
    String? value;
    String? easeOfUse;
    String? memorySize;
    String? quality;
    String? batteryLife;
    String? speed;
    String? screen;
    String? charger;

    ReviewAspects({this.value, this.easeOfUse, this.memorySize, this.quality, this.batteryLife, this.speed, this.screen, this.charger});

    ReviewAspects.fromJson(Map<String, dynamic> json) {
        if(json["Value"] is String) {
            value = json["Value"];
        }
        if(json["Ease of use"] is String) {
            easeOfUse = json["Ease of use"];
        }
        if(json["Memory size"] is String) {
            memorySize = json["Memory size"];
        }
        if(json["Quality"] is String) {
            quality = json["Quality"];
        }
        if(json["Battery life"] is String) {
            batteryLife = json["Battery life"];
        }
        if(json["Speed"] is String) {
            speed = json["Speed"];
        }
        if(json["Screen"] is String) {
            screen = json["Screen"];
        }
        if(json["Charger"] is String) {
            charger = json["Charger"];
        }
    }

    static List<ReviewAspects> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => ReviewAspects.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["Value"] = value;
        _data["Ease of use"] = easeOfUse;
        _data["Memory size"] = memorySize;
        _data["Quality"] = quality;
        _data["Battery life"] = batteryLife;
        _data["Speed"] = speed;
        _data["Screen"] = screen;
        _data["Charger"] = charger;
        return _data;
    }

    ReviewAspects copyWith({
        String? value,
        String? easeOfUse,
        String? memorySize,
        String? quality,
        String? batteryLife,
        String? speed,
        String? screen,
        String? charger,
    }) => ReviewAspects(
        value: value ?? this.value,
        easeOfUse: easeOfUse ?? this.easeOfUse,
        memorySize: memorySize ?? this.memorySize,
        quality: quality ?? this.quality,
        batteryLife: batteryLife ?? this.batteryLife,
        speed: speed ?? this.speed,
        screen: screen ?? this.screen,
        charger: charger ?? this.charger,
    );
}

class ProductDetails {
    String? brand;
    String? operatingSystem;
    String? ramMemoryInstalledSize;
    String? memoryStorageCapacity;
    String? screenSize;
    String? resolution;
    String? modelName;
    String? wirelessCarrier;
    String? cellularTechnology;
    String? connectivityTechnology;

    ProductDetails({this.brand, this.operatingSystem, this.ramMemoryInstalledSize, this.memoryStorageCapacity, this.screenSize, this.resolution, this.modelName, this.wirelessCarrier, this.cellularTechnology, this.connectivityTechnology});

    ProductDetails.fromJson(Map<String, dynamic> json) {
        if(json["Brand"] is String) {
            brand = json["Brand"];
        }
        if(json["Operating System"] is String) {
            operatingSystem = json["Operating System"];
        }
        if(json["Ram Memory Installed Size"] is String) {
            ramMemoryInstalledSize = json["Ram Memory Installed Size"];
        }
        if(json["Memory Storage Capacity"] is String) {
            memoryStorageCapacity = json["Memory Storage Capacity"];
        }
        if(json["Screen Size"] is String) {
            screenSize = json["Screen Size"];
        }
        if(json["Resolution"] is String) {
            resolution = json["Resolution"];
        }
        if(json["Model Name"] is String) {
            modelName = json["Model Name"];
        }
        if(json["Wireless Carrier"] is String) {
            wirelessCarrier = json["Wireless Carrier"];
        }
        if(json["Cellular Technology"] is String) {
            cellularTechnology = json["Cellular Technology"];
        }
        if(json["Connectivity Technology"] is String) {
            connectivityTechnology = json["Connectivity Technology"];
        }
    }

    static List<ProductDetails> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => ProductDetails.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["Brand"] = brand;
        _data["Operating System"] = operatingSystem;
        _data["Ram Memory Installed Size"] = ramMemoryInstalledSize;
        _data["Memory Storage Capacity"] = memoryStorageCapacity;
        _data["Screen Size"] = screenSize;
        _data["Resolution"] = resolution;
        _data["Model Name"] = modelName;
        _data["Wireless Carrier"] = wirelessCarrier;
        _data["Cellular Technology"] = cellularTechnology;
        _data["Connectivity Technology"] = connectivityTechnology;
        return _data;
    }

    ProductDetails copyWith({
        String? brand,
        String? operatingSystem,
        String? ramMemoryInstalledSize,
        String? memoryStorageCapacity,
        String? screenSize,
        String? resolution,
        String? modelName,
        String? wirelessCarrier,
        String? cellularTechnology,
        String? connectivityTechnology,
    }) => ProductDetails(
        brand: brand ?? this.brand,
        operatingSystem: operatingSystem ?? this.operatingSystem,
        ramMemoryInstalledSize: ramMemoryInstalledSize ?? this.ramMemoryInstalledSize,
        memoryStorageCapacity: memoryStorageCapacity ?? this.memoryStorageCapacity,
        screenSize: screenSize ?? this.screenSize,
        resolution: resolution ?? this.resolution,
        modelName: modelName ?? this.modelName,
        wirelessCarrier: wirelessCarrier ?? this.wirelessCarrier,
        cellularTechnology: cellularTechnology ?? this.cellularTechnology,
        connectivityTechnology: connectivityTechnology ?? this.connectivityTechnology,
    );
}


class ProductInformation {
    String? productDimensions;
    String? itemWeight;
    String? asin;
    String? itemModelNumber;
    String? batteries;
    String? os;
    String? ram;
    String? wirelessCommunicationTechnologies;
    String? connectivityTechnologies;
    String? gps;
    String? specialFeatures;
    String? otherDisplayFeatures;
    String? humanInterfaceInput;
    String? scannerResolution;
    String? otherCameraFeatures;
    String? audioJack;
    String? formFactor;
    String? color;
    String? batteryPowerRating;
    String? whatsInTheBox;
    String? manufacturer;
    String? dateFirstAvailable;
    String? memoryStorageCapacity;
    String? standingScreenDisplaySize;
    String? ramMemoryInstalledSize;
    String? batteryCapacity;
    String? weight;

    ProductInformation({this.productDimensions, this.itemWeight, this.asin, this.itemModelNumber, this.batteries, this.os, this.ram, this.wirelessCommunicationTechnologies, this.connectivityTechnologies, this.gps, this.specialFeatures, this.otherDisplayFeatures, this.humanInterfaceInput, this.scannerResolution, this.otherCameraFeatures, this.audioJack, this.formFactor, this.color, this.batteryPowerRating, this.whatsInTheBox, this.manufacturer, this.dateFirstAvailable, this.memoryStorageCapacity, this.standingScreenDisplaySize, this.ramMemoryInstalledSize, this.batteryCapacity, this.weight});

    ProductInformation.fromJson(Map<String, dynamic> json) {
        if(json["Product Dimensions"] is String) {
            productDimensions = json["Product Dimensions"];
        }
        if(json["Item Weight"] is String) {
            itemWeight = json["Item Weight"];
        }
        if(json["ASIN"] is String) {
            asin = json["ASIN"];
        }
        if(json["Item model number"] is String) {
            itemModelNumber = json["Item model number"];
        }
        if(json["Batteries"] is String) {
            batteries = json["Batteries"];
        }
        if(json["OS"] is String) {
            os = json["OS"];
        }
        if(json["RAM"] is String) {
            ram = json["RAM"];
        }
        if(json["Wireless communication technologies"] is String) {
            wirelessCommunicationTechnologies = json["Wireless communication technologies"];
        }
        if(json["Connectivity technologies"] is String) {
            connectivityTechnologies = json["Connectivity technologies"];
        }
        if(json["GPS"] is String) {
            gps = json["GPS"];
        }
        if(json["Special features"] is String) {
            specialFeatures = json["Special features"];
        }
        if(json["Other display features"] is String) {
            otherDisplayFeatures = json["Other display features"];
        }
        if(json["Human Interface Input"] is String) {
            humanInterfaceInput = json["Human Interface Input"];
        }
        if(json["Scanner Resolution"] is String) {
            scannerResolution = json["Scanner Resolution"];
        }
        if(json["Other camera features"] is String) {
            otherCameraFeatures = json["Other camera features"];
        }
        if(json["Audio Jack"] is String) {
            audioJack = json["Audio Jack"];
        }
        if(json["Form Factor"] is String) {
            formFactor = json["Form Factor"];
        }
        if(json["Color"] is String) {
            color = json["Color"];
        }
        if(json["Battery Power Rating"] is String) {
            batteryPowerRating = json["Battery Power Rating"];
        }
        if(json["Whats in the box"] is String) {
            whatsInTheBox = json["Whats in the box"];
        }
        if(json["Manufacturer"] is String) {
            manufacturer = json["Manufacturer"];
        }
        if(json["Date First Available"] is String) {
            dateFirstAvailable = json["Date First Available"];
        }
        if(json["Memory Storage Capacity"] is String) {
            memoryStorageCapacity = json["Memory Storage Capacity"];
        }
        if(json["Standing screen display size"] is String) {
            standingScreenDisplaySize = json["Standing screen display size"];
        }
        if(json["Ram Memory Installed Size"] is String) {
            ramMemoryInstalledSize = json["Ram Memory Installed Size"];
        }
        if(json["Battery Capacity"] is String) {
            batteryCapacity = json["Battery Capacity"];
        }
        if(json["Weight"] is String) {
            weight = json["Weight"];
        }
    }

    static List<ProductInformation> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => ProductInformation.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["Product Dimensions"] = productDimensions;
        _data["Item Weight"] = itemWeight;
        _data["ASIN"] = asin;
        _data["Item model number"] = itemModelNumber;
        _data["Batteries"] = batteries;
        _data["OS"] = os;
        _data["RAM"] = ram;
        _data["Wireless communication technologies"] = wirelessCommunicationTechnologies;
        _data["Connectivity technologies"] = connectivityTechnologies;
        _data["GPS"] = gps;
        _data["Special features"] = specialFeatures;
        _data["Other display features"] = otherDisplayFeatures;
        _data["Human Interface Input"] = humanInterfaceInput;
        _data["Scanner Resolution"] = scannerResolution;
        _data["Other camera features"] = otherCameraFeatures;
        _data["Audio Jack"] = audioJack;
        _data["Form Factor"] = formFactor;
        _data["Color"] = color;
        _data["Battery Power Rating"] = batteryPowerRating;
        _data["Whats in the box"] = whatsInTheBox;
        _data["Manufacturer"] = manufacturer;
        _data["Date First Available"] = dateFirstAvailable;
        _data["Memory Storage Capacity"] = memoryStorageCapacity;
        _data["Standing screen display size"] = standingScreenDisplaySize;
        _data["Ram Memory Installed Size"] = ramMemoryInstalledSize;
        _data["Battery Capacity"] = batteryCapacity;
        _data["Weight"] = weight;
        return _data;
    }

    ProductInformation copyWith({
        String? productDimensions,
        String? itemWeight,
        String? asin,
        String? itemModelNumber,
        String? batteries,
        String? os,
        String? ram,
        String? wirelessCommunicationTechnologies,
        String? connectivityTechnologies,
        String? gps,
        String? specialFeatures,
        String? otherDisplayFeatures,
        String? humanInterfaceInput,
        String? scannerResolution,
        String? otherCameraFeatures,
        String? audioJack,
        String? formFactor,
        String? color,
        String? batteryPowerRating,
        String? whatsInTheBox,
        String? manufacturer,
        String? dateFirstAvailable,
        String? memoryStorageCapacity,
        String? standingScreenDisplaySize,
        String? ramMemoryInstalledSize,
        String? batteryCapacity,
        String? weight,
    }) => ProductInformation(
        productDimensions: productDimensions ?? this.productDimensions,
        itemWeight: itemWeight ?? this.itemWeight,
        asin: asin ?? this.asin,
        itemModelNumber: itemModelNumber ?? this.itemModelNumber,
        batteries: batteries ?? this.batteries,
        os: os ?? this.os,
        ram: ram ?? this.ram,
        wirelessCommunicationTechnologies: wirelessCommunicationTechnologies ?? this.wirelessCommunicationTechnologies,
        connectivityTechnologies: connectivityTechnologies ?? this.connectivityTechnologies,
        gps: gps ?? this.gps,
        specialFeatures: specialFeatures ?? this.specialFeatures,
        otherDisplayFeatures: otherDisplayFeatures ?? this.otherDisplayFeatures,
        humanInterfaceInput: humanInterfaceInput ?? this.humanInterfaceInput,
        scannerResolution: scannerResolution ?? this.scannerResolution,
        otherCameraFeatures: otherCameraFeatures ?? this.otherCameraFeatures,
        audioJack: audioJack ?? this.audioJack,
        formFactor: formFactor ?? this.formFactor,
        color: color ?? this.color,
        batteryPowerRating: batteryPowerRating ?? this.batteryPowerRating,
        whatsInTheBox: whatsInTheBox ?? this.whatsInTheBox,
        manufacturer: manufacturer ?? this.manufacturer,
        dateFirstAvailable: dateFirstAvailable ?? this.dateFirstAvailable,
        memoryStorageCapacity: memoryStorageCapacity ?? this.memoryStorageCapacity,
        standingScreenDisplaySize: standingScreenDisplaySize ?? this.standingScreenDisplaySize,
        ramMemoryInstalledSize: ramMemoryInstalledSize ?? this.ramMemoryInstalledSize,
        batteryCapacity: batteryCapacity ?? this.batteryCapacity,
        weight: weight ?? this.weight,
    );
}