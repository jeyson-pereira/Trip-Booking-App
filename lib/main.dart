import 'package:flutter/material.dart';
import 'package:trip_app/widgets/options_selector.dart';
import 'package:trip_app/widgets/places_list.dart';
import 'package:trip_app/widgets/search_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TripApp',
      home: Scaffold(
        backgroundColor: Color(0xffF0F0F0),
        body: SafeArea(child: Column(
          children: [
            Header(),
            OptionsSelector(),
            PlacesList(),
          ],
        ))
      ),
    );
  }
}
