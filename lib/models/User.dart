class Users {
  final String? phoneNumber;
  final String? id;

  Users({
    required this.phoneNumber,
    required this.id,
  });
  factory Users.fromMap(Map<String, dynamic> map) {
    return Users(
      phoneNumber: map['phoneNumber'],
      id: map['id'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'phoneNumber': phoneNumber,
    };
  }
}

List<Users> userNow = [];
