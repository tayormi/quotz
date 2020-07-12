import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:quotz/cubit/quote_cubit.dart';
import 'package:quotz/repository/quote_repository.dart';
import 'package:quotz/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CubitProvider(
          create: (BuildContext context) =>
              QuoteCubit(quoteRepository: QuoteRepository(Dio())),
          child: HomeScreen()),
    );
  }
}
