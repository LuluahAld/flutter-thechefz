class Orders {
  final int subtotal;
  final String id;
  final String time;

  Orders({
    required this.subtotal,
    required this.id,
    required this.time,
  });
  factory Orders.fromMap(Map<String, dynamic> map) {
    return Orders(
      subtotal: map['subtotal'],
      id: map['id'],
      time: map['time'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'subtotal': subtotal,
      'time': time,
    };
  }
}

List<Orders> orders = [];
