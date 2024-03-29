import 'package:flutter/material.dart';
import 'package:foodvendor/Provider/openCloseBottomSheetProvider.dart';
import 'package:foodvendor/View/home.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

import 'Provider/currentPageProvider.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => OpenCloseRestaurant()),
        ChangeNotifierProvider(create: (context) => CurrentPage()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food-Vendor',
        theme: ThemeData(
            primaryColor: Colors.blue,
            primarySwatch: Colors.blue,
            primaryTextTheme: Typography(platform: TargetPlatform.iOS).black,
            textTheme: Typography(platform: TargetPlatform.iOS).black,
            brightness: Brightness.light),
        routes: {
          
        },
        home: Home(),
      ),
    );
  }
}
