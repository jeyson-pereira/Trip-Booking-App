import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trip_app/utils/color_picker.dart';

class OptionsSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
          color: ColorPicker.optionsContainer,
          borderRadius: BorderRadius.circular(50)),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          OptionItem(
            icon: CupertinoIcons.calendar,
            title: 'Choose date',
            date: 'Wed. 02 Oct 2022',
          ),
          Separator(),
          OptionItem(
            icon: CupertinoIcons.bed_double,
            title: 'Number of room',
            date: '1 Room - 2 Adults',
          ),
        ],
      ),
    );
  }
}

class Separator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 2,
        decoration: BoxDecoration(
            color: ColorPicker.separator,
            borderRadius: BorderRadius.circular(2)));
  }
}

class OptionItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String date;

  const OptionItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: ColorPicker.orange,
              ),
              SizedBox(width: 5),
              Text(
                title,
                style: TextStyle(color: ColorPicker.lightText),
              )
            ],
          ),
          SizedBox(height: 5),
          Text(
            date,
            style: TextStyle(color: ColorPicker.lightText, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
