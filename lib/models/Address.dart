class Address {
  final String id;
  final String addressText;
  final String addressLocation;
  final String name;
  final String desc;
  final String? user_id;

  Address(
      {required this.addressLocation,
      required this.addressText,
      required this.id,
      required this.name,
      required this.desc,
      required this.user_id});
  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      id: map['id'],
      addressText: map['addressText'],
      addressLocation: map['addressLocation'],
      name: map['name'],
      desc: map['desc'],
      user_id: map['user_id'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'addressText': addressText,
      'addressLocation': addressLocation,
      'name': name,
      'desc': desc,
      'user_id': user_id,
    };
  }
}

List<Address> Addresses = [];
Address currentadd = Addresses[0];
