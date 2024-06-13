import 'package:e_commerce_api/Bloc/Details/details_bloc.dart';
import 'package:e_commerce_api/Bloc/E-commerce/e_commerce_bloc.dart';
import 'package:e_commerce_api/Bloc/Review/review_bloc.dart';
import 'package:e_commerce_api/Ui/Screens/Homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 852),
        builder: (BuildContext context, Widget? child) {
          return MultiBlocProvider(
           providers: [
            BlocProvider( create: (context) => ECommerceBloc(),),
             BlocProvider( create: (context) => ReviewBloc(),),
             BlocProvider( create: (context) => DetailsBloc(),)

           ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: Homescreen(),
            ),
          );
        });
  } 
}
