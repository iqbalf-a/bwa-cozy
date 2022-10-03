// import 'package:flutter/foundation.dart';

class Space {
  int id;
  String name;
  String city;
  String country;
  int price;
  String imgUrl;
  int rate;
  String address;
  String phone;
  String mapUrl;
  List photos;
  int numberOfKitchens;
  int numberOfBedrooms;
  int numberOfCupboard;

  // Space(
  //     {required this.id,
  //     required this.name,
  //     required this.city,
  //     required this.country,
  //     required this.price,
  //     required this.imgUrl,
  //     required this.rate,
  //     required this.address,
  //     required this.phone,
  //     required this.mapUrl,
  //     required this.photos,
  //     required this.numberOfKitchens,
  //     required this.numberOfBedrooms,
  //     required this.numberOfCupboard});
  Space(
      {this.id = 1,
      this.name = '',
      this.city = '',
      this.country = '',
      this.price = 1,
      this.imgUrl = '',
      this.rate = 1,
      this.address = '',
      this.phone = '',
      this.mapUrl = '',
      this.photos = const [],
      this.numberOfKitchens = 1,
      this.numberOfBedrooms = 1,
      this.numberOfCupboard = 1});

  factory Space.fromJson(json) {
    return Space(
      id: json['id'],
      name: json['name'],
      city: json['city'],
      country: json['country'],
      price: json['price'],
      imgUrl: json['image_url'],
      rate: json['rating'],
      address: json['address'],
      phone: json['phone'],
      mapUrl: json['map_url'],
      photos: json['photos'],
      numberOfKitchens: json['number_of_kitchens'],
      numberOfBedrooms: json['number_of_bedrooms'],
      numberOfCupboard: json['number_of_cupboards'],
    );
  }
}
