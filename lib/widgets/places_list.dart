import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:trip_app/models/places_model.dart';
import 'package:trip_app/utils/color_picker.dart';

class PlacesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getPlaces(),
        builder: (BuildContext context, AsyncSnapshot<ReqResponse> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(color: ColorPicker.orange));
          } else {
            return Expanded(
              child: _ListPlaces(
                places: snapshot.data!.places,
              ),
            );
          }
        });
  }

  Future<ReqResponse> getPlaces() async {
    final resp = await http.get(Uri.parse(
        'https://app.fakejson.com/q/sq4lLaWz?token=hGAZsaLy4GOmDulC_CpMsw'));
    return reqResponseFromJson(resp.body);
  }
}

class _ListPlaces extends StatelessWidget {
  final List<Place> places;

  const _ListPlaces({Key? key, required this.places}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: places.length,
        itemBuilder: (BuildContext context, int i) {
          final place = places[i];

          final titleStyle = TextStyle(
              color: ColorPicker.orange,
              fontWeight: FontWeight.bold,
              fontSize: 18);

          final priceStyle = TextStyle(
              color: ColorPicker.orange,
              fontSize: 30,
              fontWeight: FontWeight.bold);

          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(place.img, fit: BoxFit.cover)),
                ),
                Flexible(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          place.name,
                          style: titleStyle,
                          overflow: TextOverflow.clip,
                        ),
                        InfoWithIcons(
                            icon: CupertinoIcons.calendar,
                            text: '${place.days} Days'),
                        InfoWithIcons(
                            icon: CupertinoIcons.person_2_fill,
                            text: '${place.capacity} Adults'),
                        Text(
                          '\$${place.price}',
                          style: priceStyle,
                        ),
                        Rating(
                          rating: place.rating,
                        )
                      ],
                    ),
                  ),
                ),
                AddFavorites()
              ],
            ),
          );
        });
  }
}


class InfoWithIcons extends StatelessWidget {
  const InfoWithIcons({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final subtitleStyle = TextStyle(color: ColorPicker.lightText, fontSize: 16);
    return Row(
      children: [
        Icon(icon, color: ColorPicker.orange),
        SizedBox(width: 5),
        Text(text, style: subtitleStyle)
      ],
    );
  }
}

class Rating extends StatelessWidget {
  const Rating({
    Key? key,
    required this.rating,
  }) : super(key: key);

  final int rating;

  @override
  Widget build(BuildContext context) {
    final subtitleStyle = TextStyle(color: ColorPicker.lightText, fontSize: 16);
    return Row(
      children: [
        Row(
          children: _starsForRating(),
        ),
        SizedBox(width: 5),
        Text(
          rating.toDouble().toString(),
          style: subtitleStyle,
        ),
      ],
    );
  }

  List<Icon> _starsForRating() {
    List<Icon> stars = [];
    for (var i = 1; i <= rating; i++) {
      stars.add(Icon(
        CupertinoIcons.star_fill,
        color: ColorPicker.orange,
        size: 10,
      ));
    }
    return stars;
  }
}


class AddFavorites extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CircleAvatar(
          child: Icon(
            CupertinoIcons.heart_solid,
            color: Colors.white,
            size: 20,
          ),
          backgroundColor: Colors.pink,
          radius: 15,
        ),
        SizedBox(height: 60),
        CircleAvatar(
          child: Icon(
            CupertinoIcons.bookmark,
            color: Colors.white,
            size: 24,
          ),
          backgroundColor: ColorPicker.orange,
          radius: 20,
        )
      ],
    );
  }
}
