import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_api/Bloc/Details/details_bloc.dart';
import 'package:e_commerce_api/Bloc/Review/review_bloc.dart';
import 'package:e_commerce_api/Repository/Model/e-commerce_model.dart';
import 'package:e_commerce_api/Repository/Model/product_model.dart';
import 'package:e_commerce_api/Repository/Model/review_model.dart';
import 'package:e_commerce_api/Ui/Screens/Extra_screens/features.dart';

import 'package:e_commerce_api/Ui/Screens/webview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Detailscreen extends StatefulWidget {
  final ECommerceModel model;
  final int index;
  const Detailscreen({super.key, required this.model, required this.index});

  @override
  State<Detailscreen> createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen> {
  late Reviewmodel review;
  late ProductModel product;

  @override
  void initState() {
    BlocProvider.of<ReviewBloc>(context).add(Fetchreview(
        id: widget.model.data!.products![widget.index].asin.toString()));
    BlocProvider.of<DetailsBloc>(context).add(FetchDetails(
        id: widget.model.data!.products![widget.index].asin.toString()));
    super.initState();
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar section

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_circle_left_outlined,
              color: Colors.black,
              size: 30.sp,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Stack(
              children: [
                Icon(
                  Icons.notifications_none,
                  color: Colors.black,
                  size: 30.sp,
                ),
                Positioned(
                    top: 2.h,
                    left: 20.w,
                    child: CircleAvatar(
                      radius: 5.r,
                      backgroundColor: Color(0xFF8204FF),
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  Icons.favorite_outline,
                  color: Colors.black,
                  size: 25.sp,
                ),
                Positioned(
                    top: -8.h,
                    left: 22.w,
                    child: CircleAvatar(
                      radius: 8.r,
                      backgroundColor: Color.fromARGB(89, 130, 4, 255),
                      child: Center(
                        child: Text('1',
                            style: GoogleFonts.roboto(
                              color: Color(0xFF8204FF),
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                            )),
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),

        //calling bloc builder for product model

        child: BlocBuilder<DetailsBloc, DetailsState>(
          builder: (context, state) {
            if (state is Detailsblocloading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is Detailsblocerror) {
              return RefreshIndicator(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * .9,
                    child:
                        const Center(child: Text('Oops something went wrong')),
                  ),
                ),
                onRefresh: () async {
                  return BlocProvider.of<ReviewBloc>(context).add(Fetchreview(
                      id: widget.model.data!.products![widget.index].asin
                          .toString()));
                },
              );
            }
            if (state is Detailsblocloaded) {
              product = BlocProvider.of<DetailsBloc>(context).productModel;
              return ListView(children: [
                SizedBox(
                  height: 10.h,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    //image calling from api

                    CarouselSlider.builder(
                      itemCount: product.data!.productPhotos!.length,
                      itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
                          Container(
                        width: double.infinity,
                        child: Image.network(
                          product.data!.productPhotos![itemIndex].toString(),
                        ),
                      ),
                      options: CarouselOptions(
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                          autoPlay: false),
                    ),
                    Positioned(
                      top: 230.h,
                      left: 120.w,
                      child: AnimatedSmoothIndicator(
                        activeIndex: currentIndex,
                        count: product.data!.productPhotos!.length,
                        effect: WormEffect(
                            dotHeight: 10.h,
                            dotWidth: 10.w,
                            radius: 10.r,
                            dotColor: Color.fromARGB(104, 33, 33, 33),
                            activeDotColor: Colors.black),
                      ),
                    ),
                    Positioned(
                      top: 248.h,
                      left: 100.w,
                      child: Text(product.data!.salesVolume.toString(),
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 70.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        // product rating calling

                        Text(product.data!.productStarRating.toString(),
                            style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400)),
                        RatingBar.builder(
                          itemSize: 17.sp,
                          initialRating: double.parse(
                              product.data!.productStarRating.toString()),
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Color.fromARGB(248, 228, 172, 4),
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(product.data!.productNumRatings.toString(),
                            style: GoogleFonts.roboto(
                                color: Color.fromARGB(255, 6, 124, 130),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400)),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 40.h,
                  width: double.infinity.w,

                  // product name calling

                  child: Text(product.data!.productTitle.toString(),
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400)),
                ),
                Divider(
                  thickness: .5,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                    //product price calling
                    widget.model.data!.products![widget.index]
                        .productMinimumOfferPrice
                        .toString(),
                    style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    Text(
                        '${widget.model.data!.products![widget.index].currency.toString()}:',
                        style: GoogleFonts.roboto(
                            color: Colors.grey,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500)),
                    SizedBox(
                      width: 3.w,
                    ),
                    widget.model.data!.products![widget.index]
                                .productOriginalPrice !=
                            null
                        ? Text(
                            widget.model.data!.products![widget.index]
                                .productOriginalPrice
                                .toString(),
                            style: GoogleFonts.roboto(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500))
                        : Text(
                            widget.model.data!.products![widget.index]
                                .productPrice
                                .toString(),
                            style: GoogleFonts.roboto(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500)),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                    widget.model.data!.products![widget.index].delivery
                        .toString(),
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    )),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('in stock',
                        style: GoogleFonts.roboto(
                          color: Colors.green,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        )),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => Webscreen(
                                      Producturl: widget.model.data!
                                          .products![widget.index].productUrl
                                          .toString(),
                                    )));
                      },
                      child: Text('See More',
                          style: GoogleFonts.roboto(
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          )),
                    )
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  height: 50.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                      color: Color.fromARGB(62, 130, 4, 255)),
                  child: Center(
                    child: Text('Add to Cart',
                        style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 50.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                      color: Color(0xFF8204FF)),
                  child: Center(
                    child: Text('Buy Now',
                        style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Divider(
                  thickness: .5,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 10.h,
                ),
                product.data!.aboutProduct!.isNotEmpty
                    ? Text('Features',
                        style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ))
                    : SizedBox(),
                SizedBox(
                  height: 10.h,
                ),
                product.data!.aboutProduct!.isNotEmpty
                    ? Container(
                        height: 85 * 2,
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: 2,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                              height: 85.h,
                              child: Text(
                                  '->  ${product.data!.aboutProduct![index].toString()}',
                                  style: GoogleFonts.roboto(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  )),
                            );
                          },
                        ),
                      )
                    : SizedBox(),
                 product.data!.aboutProduct!.isNotEmpty?Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('See all features',
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          )),
                      GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => Features(
                                        features: product.data!.aboutProduct!
                                            .toList(),
                                      ))),
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 20.sp,
                          )),
                    ]):SizedBox(),
                SizedBox(
                  height: 5.h,
                ),
                  product.data!.aboutProduct!.isNotEmpty? Divider(
                  thickness: .5,
                  color: Colors.black,
                ):SizedBox(),
                SizedBox(
                  height: 5.h,
                ),
                Text('Product image gallery',
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    )),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: double.infinity,
                  height: 320*product.data!.productPhotos!.length.toDouble(),
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: product.data!.productPhotos!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Image.network(
                            product.data!.productPhotos![index].toString()),
                      );
                    },
                  ),
                ),
                Text('Custumer Reviews',
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    )),
                BlocBuilder<ReviewBloc, ReviewState>(
                  builder: (context, state) {
                    if (state is Reviewblocloading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is Reviewblocerror) {
                      return RefreshIndicator(
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * .9,
                            // color: Colors.red,
                            child: const Center(
                                child: Text('Oops something went wrong')),
                          ),
                        ),
                        onRefresh: () async {
                          return BlocProvider.of<ReviewBloc>(context).add(
                              Fetchreview(
                                  id: widget
                                      .model.data!.products![widget.index].asin
                                      .toString()));
                        },
                      );
                    }
                    if (state is Reviewblocloaded) {
                      review = BlocProvider.of<ReviewBloc>(context).reviewmodel;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: SizedBox(
                          width: double.infinity,
                          height: 380 * review.data!.reviews!.length.toDouble(),
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: review.data!.reviews!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Container(
                                      width: double.infinity,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ListTile(
                                            leading: CircleAvatar(
                                              radius: 10.r,
                                              backgroundImage: NetworkImage(
                                                  review.data!.reviews![index]
                                                      .reviewAuthorAvatar
                                                      .toString()),
                                            ),
                                            title: Text(
                                                review.data!.reviews![index]
                                                    .reviewAuthor
                                                    .toString(),
                                                style: GoogleFonts.roboto(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                )),
                                          ),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 15),
                                            child: Row(
                                              children: [
                                                RatingBar.builder(
                                                  itemSize: 20.sp,
                                                  initialRating: double.parse(
                                                      review
                                                          .data!
                                                          .reviews![index]
                                                          .reviewStarRating
                                                          .toString()),
                                                  minRating: 1,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  itemCount: 5,
                                                  itemPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 1.0),
                                                  itemBuilder: (context, _) =>
                                                      Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                                  onRatingUpdate: (rating) {
                                                    print(rating);
                                                  },
                                                ),
                                                SizedBox(
                                                  width: 5.w,
                                                ),
                                                Text('Verified Purchase',
                                                    style: GoogleFonts.roboto(
                                                      color: Color.fromARGB(
                                                          255, 202, 122, 2),
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    )),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 18),
                                            child: Text(
                                                review.data!.reviews![index]
                                                    .reviewTitle
                                                    .toString(),
                                                style: GoogleFonts.roboto(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                )),
                                          ),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 18),
                                            child: Text(
                                                review.data!.reviews![index]
                                                    .reviewDate
                                                    .toString(),
                                                style: GoogleFonts.roboto(
                                                  color: Colors.black,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w300,
                                                )),
                                          ),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 18),
                                            child: SizedBox(
                                              width: double.infinity,
                                              child: Text(
                                                  review.data!.reviews![index]
                                                      .reviewComment
                                                      .toString(),
                                                  style: GoogleFonts.roboto(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  )),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 18),
                                            child: Text(
                                                review.data!.reviews![index]
                                                    .helpfulVoteStatement
                                                    .toString(),
                                                style: GoogleFonts.roboto(
                                                  color: Colors.black,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w300,
                                                )),
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 18),
                                            child: SizedBox(
                                                width: double.infinity,
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: 45.h,
                                                      width: 90.w,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      30.r),
                                                          border: Border.all(
                                                              color: Colors
                                                                  .black)),
                                                      child: Center(
                                                        child: Text('Helpful',
                                                            style: GoogleFonts
                                                                .roboto(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            )),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10.w,
                                                    ),
                                                    Icon(
                                                      Icons.share,
                                                      color: Colors.black,
                                                      size: 25.sp,
                                                    ),
                                                    SizedBox(
                                                      width: 5.w,
                                                    ),
                                                    Text('Share',
                                                        style:
                                                            GoogleFonts.roboto(
                                                          color: Colors.black,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        )),
                                                    SizedBox(
                                                      width: 120.w,
                                                    ),
                                                    Text('Report',
                                                        style:
                                                            GoogleFonts.roboto(
                                                          color: Colors.black,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        )),
                                                  ],
                                                )),
                                          ),
                                        ],
                                      )),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                ),
              ]);
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
