import 'package:e_commerce_api/Bloc/E-commerce/e_commerce_bloc.dart';
import 'package:e_commerce_api/Repository/Model/e-commerce_model.dart';
import 'package:e_commerce_api/Ui/Screens/Detailscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late ECommerceModel ecommerce;
  @override
  void initState() {
    BlocProvider.of<ECommerceBloc>(context).add(FetchEcommerce(brand: '', isAllProduct: true));

    super.initState();
  }
 final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            AppBar(
              leading: Image.asset('assets/images/img1.png'),
              title: Text('Wizo',
                  style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  )),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Stack(
                    children: [
                      Icon(
                        Icons.notifications_none,
                        color: Colors.black,
                        size: 35.sp,
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
                  padding: const EdgeInsets.only(right: 9),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Icon(
                        Icons.favorite_outline,
                        color: Colors.black,
                        size: 30.sp,
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
            SizedBox(
              height: 10.h,
            ),
            Container(
              height: 50.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: const Color.fromARGB(34, 0, 0, 0)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(onChanged: (value){
                  if(controller.text.isEmpty){
                    BlocProvider.of<ECommerceBloc>(context).add(FetchEcommerce(brand: '', isAllProduct: true));
                  }
                },onFieldSubmitted: (value){
                   BlocProvider.of<ECommerceBloc>(context).add(FetchEcommerce(brand:controller.text , isAllProduct: false));
                },
                controller: controller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Image.asset('assets/images/img2.png'),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Featured products',
                    style: GoogleFonts.roboto(
                      color: Color(0xFF414141),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    )),
                Text('See all',
                    style: GoogleFonts.roboto(
                      color: Color(0xFF8204FF),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ))
              ],
            ),
            Expanded(
              child: BlocBuilder<ECommerceBloc, ECommerceState>(
                builder: (context, state) {
                  if (state is ECommerceblocloading) {
                    return Center(child: CircularProgressIndicator(),);
                  }if (state is ECommerceblocerror) {
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
                          return BlocProvider.of<ECommerceBloc>(context)
                              .add(FetchEcommerce(isAllProduct: true, brand: ''));
                        },
                      );
                  }if (state is ECommerceblocloaded) {
                    ecommerce =BlocProvider.of<ECommerceBloc>(context).eCommerceModel;
                     return GridView.builder(
                      itemCount: ecommerce.data!.products!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 310 / 400,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 3),
                      itemBuilder: (context, index) {
                        return Card(
                          shadowColor: Colors.black,
                          elevation: 2,
                          child: GestureDetector(
                            onTap: () => Navigator.push(context,MaterialPageRoute(builder: (_)=>Detailscreen(model: ecommerce, index: index))),
                            child: Container(
                              width: 170.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                 
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10.r),
                                    child: Container(
                                        height: 140.h,
                                        width: double.infinity,
                                        child: Image.network(
                                          ecommerce.data!.products![index].productPhoto.toString(),
                                          
                                        )),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: SizedBox(
                                          height: 20.h,
                                          width: 140.w,
                                          child: Text(
                                             ecommerce.data!.products![index].productTitle.toString(),
                                            style: GoogleFonts.roboto(
                                              color: Colors.black,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                           ecommerce.data!.products![index].productPrice.toString(),
                                          style: GoogleFonts.roboto(
                                            color: Color(0xFF8204FF),
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Icon(
                                          Icons.add_shopping_cart_outlined,
                                          color: Color(0xFF8204FF),
                                          size: 20.sp,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                  }else{
                    return SizedBox();
                  }
                 
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
