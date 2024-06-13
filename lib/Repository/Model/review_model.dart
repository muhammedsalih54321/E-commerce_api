
class Reviewmodel {
    String? status;
    String? requestId;
    Data? data;

    Reviewmodel({this.status, this.requestId, this.data});

    Reviewmodel.fromJson(Map<String, dynamic> json) {
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

    static List<Reviewmodel> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Reviewmodel.fromJson(map)).toList();
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

    Reviewmodel copyWith({
        String? status,
        String? requestId,
        Data? data,
    }) => Reviewmodel(
        status: status ?? this.status,
        requestId: requestId ?? this.requestId,
        data: data ?? this.data,
    );
}

class Data {
    String? asin;
    int? totalReviews;
    int? totalRatings;
    String? country;
    String? domain;
    List<Reviews>? reviews;

    Data({this.asin, this.totalReviews, this.totalRatings, this.country, this.domain, this.reviews});

    Data.fromJson(Map<String, dynamic> json) {
        if(json["asin"] is String) {
            asin = json["asin"];
        }
        if(json["total_reviews"] is num) {
            totalReviews = (json["total_reviews"] as num).toInt();
        }
        if(json["total_ratings"] is num) {
            totalRatings = (json["total_ratings"] as num).toInt();
        }
        if(json["country"] is String) {
            country = json["country"];
        }
        if(json["domain"] is String) {
            domain = json["domain"];
        }
        if(json["reviews"] is List) {
            reviews = json["reviews"] == null ? null : (json["reviews"] as List).map((e) => Reviews.fromJson(e)).toList();
        }
    }

    static List<Data> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Data.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["asin"] = asin;
        _data["total_reviews"] = totalReviews;
        _data["total_ratings"] = totalRatings;
        _data["country"] = country;
        _data["domain"] = domain;
        if(reviews != null) {
            _data["reviews"] = reviews?.map((e) => e.toJson()).toList();
        }
        return _data;
    }

    Data copyWith({
        String? asin,
        int? totalReviews,
        int? totalRatings,
        String? country,
        String? domain,
        List<Reviews>? reviews,
    }) => Data(
        asin: asin ?? this.asin,
        totalReviews: totalReviews ?? this.totalReviews,
        totalRatings: totalRatings ?? this.totalRatings,
        country: country ?? this.country,
        domain: domain ?? this.domain,
        reviews: reviews ?? this.reviews,
    );
}

class Reviews {
    String? reviewId;
    String? reviewTitle;
    String? reviewComment;
    String? reviewStarRating;
    String? reviewLink;
    String? reviewAuthor;
    String? reviewAuthorAvatar;
    List<dynamic>? reviewImages;
    dynamic reviewVideo;
    String? reviewDate;
    bool? isVerifiedPurchase;
    String? helpfulVoteStatement;
    String? reviewedProductAsin;

    Reviews({this.reviewId, this.reviewTitle, this.reviewComment, this.reviewStarRating, this.reviewLink, this.reviewAuthor, this.reviewAuthorAvatar, this.reviewImages, this.reviewVideo, this.reviewDate, this.isVerifiedPurchase, this.helpfulVoteStatement, this.reviewedProductAsin});

    Reviews.fromJson(Map<String, dynamic> json) {
        if(json["review_id"] is String) {
            reviewId = json["review_id"];
        }
        if(json["review_title"] is String) {
            reviewTitle = json["review_title"];
        }
        if(json["review_comment"] is String) {
            reviewComment = json["review_comment"];
        }
        if(json["review_star_rating"] is String) {
            reviewStarRating = json["review_star_rating"];
        }
        if(json["review_link"] is String) {
            reviewLink = json["review_link"];
        }
        if(json["review_author"] is String) {
            reviewAuthor = json["review_author"];
        }
        if(json["review_author_avatar"] is String) {
            reviewAuthorAvatar = json["review_author_avatar"];
        }
        if(json["review_images"] is List) {
            reviewImages = json["review_images"] ?? [];
        }
        reviewVideo = json["review_video"];
        if(json["review_date"] is String) {
            reviewDate = json["review_date"];
        }
        if(json["is_verified_purchase"] is bool) {
            isVerifiedPurchase = json["is_verified_purchase"];
        }
        if(json["helpful_vote_statement"] is String) {
            helpfulVoteStatement = json["helpful_vote_statement"];
        }
        if(json["reviewed_product_asin"] is String) {
            reviewedProductAsin = json["reviewed_product_asin"];
        }
    }

    static List<Reviews> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Reviews.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["review_id"] = reviewId;
        _data["review_title"] = reviewTitle;
        _data["review_comment"] = reviewComment;
        _data["review_star_rating"] = reviewStarRating;
        _data["review_link"] = reviewLink;
        _data["review_author"] = reviewAuthor;
        _data["review_author_avatar"] = reviewAuthorAvatar;
        if(reviewImages != null) {
            _data["review_images"] = reviewImages;
        }
        _data["review_video"] = reviewVideo;
        _data["review_date"] = reviewDate;
        _data["is_verified_purchase"] = isVerifiedPurchase;
        _data["helpful_vote_statement"] = helpfulVoteStatement;
        _data["reviewed_product_asin"] = reviewedProductAsin;
        return _data;
    }

    Reviews copyWith({
        String? reviewId,
        String? reviewTitle,
        String? reviewComment,
        String? reviewStarRating,
        String? reviewLink,
        String? reviewAuthor,
        String? reviewAuthorAvatar,
        List<dynamic>? reviewImages,
        dynamic reviewVideo,
        String? reviewDate,
        bool? isVerifiedPurchase,
        String? helpfulVoteStatement,
        String? reviewedProductAsin,
    }) => Reviews(
        reviewId: reviewId ?? this.reviewId,
        reviewTitle: reviewTitle ?? this.reviewTitle,
        reviewComment: reviewComment ?? this.reviewComment,
        reviewStarRating: reviewStarRating ?? this.reviewStarRating,
        reviewLink: reviewLink ?? this.reviewLink,
        reviewAuthor: reviewAuthor ?? this.reviewAuthor,
        reviewAuthorAvatar: reviewAuthorAvatar ?? this.reviewAuthorAvatar,
        reviewImages: reviewImages ?? this.reviewImages,
        reviewVideo: reviewVideo ?? this.reviewVideo,
        reviewDate: reviewDate ?? this.reviewDate,
        isVerifiedPurchase: isVerifiedPurchase ?? this.isVerifiedPurchase,
        helpfulVoteStatement: helpfulVoteStatement ?? this.helpfulVoteStatement,
        reviewedProductAsin: reviewedProductAsin ?? this.reviewedProductAsin,
    );
}