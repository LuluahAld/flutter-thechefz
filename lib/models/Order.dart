import 'Meal.dart';

class Orders {
  List<Meal> meals;
  final int subtotal;
  final String id;
  final String time;
  final String rest_id;
  final String rest_img;
  final String rest_name;
  final String address;
  final String? user_id;

  Orders({
    required this.subtotal,
    required this.id,
    required this.time,
    required this.meals,
    required this.rest_id,
    required this.rest_img,
    required this.rest_name,
    required this.address,
    required this.user_id,
  });
  factory Orders.fromMap(Map<String, dynamic> map) {
    return Orders(
      subtotal: map['subtotal'],
      id: map['id'],
      time: map['time'],
      meals: (map['meals'] as List).map((e) => Meal.fromMap(e)).toList(),
      rest_id: map['rest_id'],
      rest_img: map['rest_img'],
      rest_name: map['rest_name'],
      address: map['address'],
      user_id: map['user_id'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'subtotal': subtotal,
      'time': time,
      'meals': meals.map((m) => m.toMap()).toList(),
      'rest_id': rest_id,
      'rest_img': rest_img,
      'rest_name': rest_name,
      'address': address,
      'user_id': user_id,
    };
  }
}

List<Orders> orders = [];
