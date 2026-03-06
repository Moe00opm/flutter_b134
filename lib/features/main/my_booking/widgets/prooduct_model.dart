class ProoductModel {
  final String image;
  final String name;
  final String location;
  final double rating;
  final double price;
  final String date;
  final String guest;
  final String roomType;
  final String phone;

  ProoductModel({
    required this.image,
    required this.name,
    required this.location,
    required this.rating,
    required this.price,
    required this.date,
    required this.guest,
    required this.roomType,
    required this.phone,
  });
}

List<ProoductModel> bookings = [
  ProoductModel(
    image: "assets/images/the_aston_vill_hotel.png",
    name: "The Aston Vill Hotel",
    location: "Veum Point, Michikoton",
    rating: 4.7,
    price: 120,
    date: "12 - 14 Nov 2024",
    guest: "2 Guests (1 Room)",
    roomType: "Queen Room",
    phone: "0214345646",
  ),
  ProoductModel(
    image: "assets/images/the_horizon_retreat.png",
    name: "Mystic Palms",
    location: "Palm Springs, CA",
    rating: 4.0,
    price: 230,
    date: "20 - 25 Nov 2024",
    guest: "1 Guest (1 Room)",
    roomType: "Deluxe Room",
    phone: "0112233445",
  ),
];
