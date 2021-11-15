// To parse this JSON data, do
//
//     final reqResponse = reqResponseFromJson(jsonString);

import 'dart:convert';

ReqResponse reqResponseFromJson(String str) => ReqResponse.fromJson(json.decode(str));

String reqResponseToJson(ReqResponse data) => json.encode(data.toJson());

class ReqResponse {
    ReqResponse({
        required this.places,
    });

    List<Place> places;

    factory ReqResponse.fromJson(Map<String, dynamic> json) => ReqResponse(
        places: List<Place>.from(json["places"].map((x) => Place.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "places": List<dynamic>.from(places.map((x) => x.toJson())),
    };
}

class Place {
    Place({
        required this.capacity,
        required this.days,
        required this.img,
        required this.name,
        required this.price,
        required this.rating,
    });

    int capacity;
    int days;
    String img;
    String name;
    int price;
    int rating;

    factory Place.fromJson(Map<String, dynamic> json) => Place(
        capacity: json["capacity"],
        days: json["days"],
        img: json["img"],
        name: json["name"],
        price: json["price"],
        rating: json["rating"],
    );

    Map<String, dynamic> toJson() => {
        "capacity": capacity,
        "days": days,
        "img": img,
        "name": name,
        "price": price,
        "rating": rating,
    };
}
