import 'package:e_commerce_api/Repository/Model/e-commerce_model.dart';
import 'package:e_commerce_api/Ui/Screens/webview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Detailscreen extends StatefulWidget {
  final ECommerceModel model;
  final int index;
  const Detailscreen({super.key, required this.model, required this.index});

  @override
  State<Detailscreen> createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Container(
                height: 250.h,
                width: double.infinity,
                child: Image.network(
                  widget.model.data!.products![widget.index].productPhoto
                      .toString(),
                )),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r)),
                  color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 60.h,
                            width: 270.w,
                            child: Text(
                                widget.model.data!.products![widget.index]
                                    .productTitle
                                    .toString(),
                                style: GoogleFonts.roboto(
                                    color: Colors.black,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500)),
                          ),
                          Container(
                            height: 30.h,
                            width: 75.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.r),
                                color: Color.fromARGB(62, 130, 4, 255)),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.local_offer_outlined,
                                    color: Color(0xFF8204FF),
                                    size: 13.sp,
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text('On sale',
                                      style: GoogleFonts.roboto(
                                        color: Color(0xFF8204FF),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      )),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
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
                                      color: Colors.grey,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500))
                              : Text(
                                  widget.model.data!.products![widget.index]
                                      .productPrice
                                      .toString(),
                                  style: GoogleFonts.roboto(
                                      color: Colors.grey,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500)),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 30.h,
                            width: 70.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.r),
                                color: Color(0x19FF8037)),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/img3.png',
                                    height: 15.h,
                                    width: 15.w,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                      widget.model.data!.products![widget.index]
                                          .productStarRating
                                          .toString(),
                                      style: GoogleFonts.roboto(
                                        color: Color(0xFF414141),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      )),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                              '${widget.model.data!.products![widget.index].productNumRatings.toString()} Reviews ',
                              style: GoogleFonts.roboto(
                                color: Color(0xFF414141),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              )),
                        ],
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
                              TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>Webscreen(Producturl: widget.model.data!.products![widget.index].productUrl
                              .toString() ,)));}, child:  Text('See More',
                              style: GoogleFonts.roboto(
                                decoration: TextDecoration.underline,
                                color: Colors.blue,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              )),)
                         
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
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
