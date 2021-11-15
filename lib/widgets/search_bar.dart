import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trip_app/utils/color_picker.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Row(
        children: [
          SearchBar(),
          ButtonFilters()
        ],
      ),
    );
  }
}

class ButtonFilters extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: -1,
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: CircleAvatar(
          backgroundColor: ColorPicker.orange,
          child: Icon(CupertinoIcons.slider_horizontal_3, color: Colors.white, size: 30,),
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 50.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0), color: Colors.white),
        child: Row(
          children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Icon(
                  CupertinoIcons.search,
                  color: ColorPicker.orange,
                  size: 35,
                )),
            Text(
              'Bali, Indonesia',
              style: TextStyle(color: ColorPicker.lightText, fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
