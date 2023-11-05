import 'package:compelete_app/cubits/product_cubit/product_cubit.dart';
import 'package:compelete_app/screens/home_page_screen/home_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp

  ({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context)=>ProductCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false
        ,
        home: HomePageScreen(),
      ),
    );
  }
}