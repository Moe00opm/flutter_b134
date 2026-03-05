import 'package:flutter/material.dart';

class ProductModel {
  final double? over;
  final String id;
  final String name;
  final double price;
  final String time;
  final String image;
  final String tagkay;
  final String location;
  final String num;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.time,
    required this.image,
    required this.tagkay,
    required this.location,
    required this.num,
    this.over,
  });
}

List<ProductModel> pepular = [
  ProductModel(
    id: '1',
    name: 'The Horizon Retreat',
    price: 480.00,
    time: 'night',
    image: 'assets/images/the_horizon_retreat.png',
    location: 'Los Angeles.CA',
    num: '4,5',
    tagkay: UniqueKey().toString(),
  ),
  ProductModel(
    id: '2',
    name: 'Opal Grove Inn',
    price: 179.99,
    time: 'night',
    location: 'San Diego.CA',
    num: '4,5',
    image: 'assets/images/opal_grove_Inn.png',
    tagkay: UniqueKey().toString(),
  ),
  ProductModel(
    id: '3',
    name: 'The Aston Vill Hotel',
    price: 299.99,
    time: 'night',
    num: '4,5',
    location: 'Santa Barbara.CA',
    image: 'assets/images/the_aston_vill_hotel.png',
    tagkay: UniqueKey().toString(),
  ),
  ProductModel(
    id: '4',
    name: 'Serenity Sands',
    price: 270,
    time: 'night',
    location: 'San Francisco.CA',
    image: 'assets/images/sernity_sands.png',
    num: '4,0',
    tagkay: UniqueKey().toString(),
  ),
  ProductModel(
    id: '5',
    name: 'Elysian Suites',
    location: 'San Diego.CA',
    price: 320,
    time: 'night',
    image: 'assets/images/elysian_suites.png',
    num: '3,8',
    tagkay: UniqueKey().toString(),
  ),
  ProductModel(
    id: '6',
    name: 'Tranquil Shores',
    location: 'Santa Monica.CA',
    price: 120,
    time: 'night',
    image: 'assets/images/tranquil_shores.png',
    num: '4,4',
    tagkay: UniqueKey().toString(),
  ),
];

List<ProductModel> foryou = [
  ProductModel(
    id: '4',
    name: 'Serenity Sands',
    price: 270,
    time: 'night',
    location: 'San Francisco.CA',
    image: 'assets/images/sernity_sands.png',
    num: '4,0',
    tagkay: UniqueKey().toString(),
  ),
  ProductModel(
    id: '5',
    name: 'Elysian Suites',
    location: 'San Diego.CA',
    price: 320,
    time: 'night',
    image: 'assets/images/elysian_suites.png',
    num: '3,8',
    tagkay: UniqueKey().toString(),
  ),
];
List<ProductModel> viewed = [
  ProductModel(
    id: '7',
    name: 'Mystic Palms',
    price: 230,
    time: 'night',
    location: 'Palm Springs.CA',
    image: 'assets/images/mystic_palms.png',
    num: '4,0',
    tagkay: UniqueKey().toString(),
  ),
  ProductModel(
    id: '8',
    name: 'Sapphiro Cove Hotel',
    location: 'Key Viest, FL',
    price: 290,
    time: 'night',
    image: 'assets/images/sapphire.png',
    num: '3,8',
    tagkay: UniqueKey().toString(),
  ),

  ProductModel(
    id: '5',
    name: 'Elysian Suites',
    location: 'San Diego.CA',
    price: 320,
    time: 'night',
    image: 'assets/images/elysian_suites.png',
    num: '3,8',
    tagkay: UniqueKey().toString(),
  ),
];

List<ProductModel> favorite = [
  ProductModel(
    id: '4',
    name: 'Eliinate galian hotel',
    price: 248,
    time: 'night',
    location: 'San Francisco.CA',
    image: 'assets/images/eliinate_galian_hotel.png',
    num: '4,4',
    tagkay: UniqueKey().toString(),
  ),
  ProductModel(
    id: '5',
    name: 'Cerulean Temple Hotel',
    location: 'San Diego.CA',
    price: 320,
    time: 'night',
    image: 'assets/images/cerulean_temple_hotel.png',
    num: '3,8',
    tagkay: UniqueKey().toString(),
  ),
  ProductModel(
    id: '6',
    name: 'Tranquil Shores',
    location: 'Santa Monica.CA',
    price: 163,
    time: 'night',
    image: 'assets/images/double_oak_hotel.png',
    num: '4,4',
    tagkay: UniqueKey().toString(),
  ),

  ProductModel(
    id: '6',
    name: 'jade Gem Resort',
    location: 'Santa Monica.CA',
    price: 211,
    time: 'night',
    image: 'assets/images/jade_gem_resort.png',
    num: '4,4',
    tagkay: UniqueKey().toString(),
  ),
];

List<ProductModel> isBest = [
  ProductModel(
    id: '6',
    name: 'Tranquil Shores',
    location: 'Santa Monica.CA',
    price: 120,
    over: 199,
    time: 'night',
    image: 'assets/images/tranquil_shores.png',
    num: '4,4',
    tagkay: UniqueKey().toString(),
  ),
  ProductModel(
    id: '1',
    name: 'The Horizon Retreat',
    over: 550,
    price: 480.00,
    time: 'night',
    image: 'assets/images/the_horizon_retreat.png',
    location: 'Los Angeles.CA',
    num: '4,5',
    tagkay: UniqueKey().toString(),
  ),
  ProductModel(
    id: '2',
    name: 'Opal Grove Inn',
    over: 200,
    price: 179.99,
    time: 'night',
    location: 'San Diego.CA',
    num: '4,5',
    image: 'assets/images/opal_grove_Inn.png',
    tagkay: UniqueKey().toString(),
  ),
  ProductModel(
    id: '5',
    name: 'Elysian Suites',
    location: 'San Diego.CA',
    over: 390,
    price: 320,
    time: 'night',
    image: 'assets/images/elysian_suites.png',
    num: '3,8',
    tagkay: UniqueKey().toString(),
  ),
  ProductModel(
    id: '3',
    name: 'The Aston Vill Hotel',
    over: 350,
    price: 299.99,
    time: 'night',
    num: '4,5',
    location: 'Santa Barbara.CA',
    image: 'assets/images/the_aston_vill_hotel.png',
    tagkay: UniqueKey().toString(),
  ),
  ProductModel(
    id: '4',
    name: 'Serenity Sands',
    over: 320,
    price: 270,
    time: 'night',
    location: 'San Francisco.CA',
    image: 'assets/images/sernity_sands.png',
    num: '4,0',
    tagkay: UniqueKey().toString(),
  ),
];
