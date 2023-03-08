class Meal {
  final String id;
  final String name;
  final String rating;
  final String reviews;
  final int price;
  final String cat;
  final String img;
  final String rest_id;
  final String desc;
  final String calories;
  final int totalM;
  final int number_of_items;
  final String notes;

  final String? user_id;

  Meal({
    required this.id,
    required this.name,
    required this.rating,
    required this.reviews,
    required this.price,
    required this.cat,
    required this.img,
    required this.rest_id,
    required this.desc,
    required this.calories,
    required this.totalM,
    required this.number_of_items,
    required this.notes,
    required this.user_id,
  });
  factory Meal.fromMap(Map<String, dynamic> map) {
    return Meal(
      id: map['id'],
      name: map['name'],
      rating: map['rating'],
      reviews: map['reviews'],
      price: map['price'],
      cat: map['cat'],
      img: map['img'],
      rest_id: map['rest_id'],
      desc: map['desc'],
      calories: map['calories'],
      totalM: map['totalM'],
      number_of_items: map['number_of_items'],
      notes: map['notes'],
      user_id: map['user_id'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'rest_id': rest_id,
      'name': name,
      'rating': rating,
      'reviews': reviews,
      'price': price,
      'cat': cat,
      'img': img,
      'id': id,
      'desc': desc,
      'calories': calories,
      'totalM': totalM,
      'number_of_items': number_of_items,
      'notes': notes,
      'user_id': user_id,
    };
  }
}

List<Meal> meals = [
  Meal(
    id: '1',
    name: 'Fries',
    rating: '4.3',
    reviews: '502',
    price: 9,
    cat: 'Most Popular',
    img: 'images/home/restaurants/wagyumenu/fries.png',
    rest_id: '1',
    desc: 'French fries, spicy mixed salt',
    calories: '470',
    totalM: 0,
    number_of_items: 1,
    notes: '',
    user_id: '',
  ),
  Meal(
    id: '2',
    name: 'Wagyu Fries',
    rating: '4.2',
    reviews: '545',
    price: 29,
    cat: 'Most Popular',
    img: 'images/home/restaurants/wagyumenu/wagyufries.png',
    rest_id: '1',
    desc: 'Fries, jalapeno,wagyu sauce, mix cheese, minced meat, and shredded potatoes',
    calories: '1470',
    totalM: 0,
    number_of_items: 1,
    notes: '',
    user_id: '',
  ),
  Meal(
    id: '3',
    name: 'Wagyu Burger',
    rating: '4.2',
    reviews: '402',
    price: 68,
    cat: 'Most Popular',
    img: 'images/home/restaurants/wagyumenu/wagyuburger.png',
    rest_id: '1',
    desc: 'Wagyu beef 140 G, cheddar cheese, monterey jack cheese, lettuce, pickles, and special mushroom sauce',
    calories: '640',
    totalM: 0,
    number_of_items: 1,
    notes: '',
    user_id: '',
  ),
  Meal(
    id: '4',
    name: 'Wagyu Burger',
    rating: '4.2',
    reviews: '402',
    price: 68,
    cat: 'Burgers & Sandwiches',
    img: 'images/home/restaurants/wagyumenu/wagyuburger.png',
    rest_id: '1',
    desc: 'Wagyu beef 140 G, cheddar cheese, monterey jack cheese, lettuce, pickles, and special mushroom sauce',
    calories: '640',
    totalM: 0,
    number_of_items: 1,
    notes: '',
    user_id: '',
  ),
  Meal(
    id: '5',
    name: 'W Burger',
    rating: '4.4',
    reviews: '9',
    price: 69,
    cat: 'Burgers & Sandwiches',
    img: 'images/home/restaurants/wagyumenu/wburger.png',
    rest_id: '1',
    desc:
        'Wagyu beef 140 G with our special mixture, cheddar cheese, monterey jack cheese, special mushroom sauce, and baby rocca, caramelized onions',
    calories: '650',
    totalM: 0,
    number_of_items: 1,
    notes: '',
    user_id: '',
  ),
  Meal(
    id: '6',
    name: 'Classic Burger',
    rating: '4.5',
    reviews: '407',
    price: 34,
    cat: 'Burgers & Sandwiches',
    img: 'images/home/restaurants/wagyumenu/classicb.png',
    rest_id: '1',
    desc: 'Black angus beef 125 G, cheddar cheese, lettuce, pickles, and wagyu sauce',
    calories: '640',
    totalM: 0,
    number_of_items: 1,
    notes: '',
    user_id: '',
  ),
  Meal(
    id: '7',
    name: 'Buffalo Sweet Shrimp',
    rating: '4.2',
    reviews: '131',
    price: 39,
    cat: 'Side Orders',
    img: 'images/home/restaurants/wagyumenu/buffaloshrimp.png',
    rest_id: '1',
    desc: 'Fried shrimp, buffalo sauce, parmesan cheese, and wagyu sauce',
    calories: '360',
    totalM: 0,
    number_of_items: 1,
    notes: '',
    user_id: '',
  ),
  Meal(
    id: '8',
    name: 'Buffalo Sweet Chicken',
    rating: '4.2',
    reviews: '129',
    price: 34,
    cat: 'Side Orders',
    img: 'images/home/restaurants/wagyumenu/buffalochicken.png',
    rest_id: '1',
    desc: 'Fried chicken, buffalo sauce, parmesan cheese, wagyu sauce',
    calories: '370',
    totalM: 0,
    number_of_items: 1,
    notes: '',
    user_id: '',
  ),
  Meal(
    id: '9',
    name: 'Dynamite Shrimp',
    rating: '4.2',
    reviews: '195',
    price: 43,
    cat: 'Side Orders',
    img: 'images/home/restaurants/wagyumenu/dynamite.png',
    rest_id: '1',
    desc: '8 pieces of fried shrimp, spicy dynamite sauce, shredded potato, fried beetroot, and ranch sauce',
    calories: '480',
    totalM: 0,
    number_of_items: 1,
    notes: '',
    user_id: '',
  ),
  Meal(
    id: '10',
    name: 'SHiRO Special California',
    rating: '4.2',
    reviews: '242',
    price: 36,
    cat: 'Most Popular',
    img: 'images/home/restaurants/shiromenu/special.png',
    rest_id: '2',
    desc: 'Shrimp, king crab, tobico, and cheese',
    calories: '470',
    totalM: 0,
    number_of_items: 1,
    notes: '',
    user_id: '',
  ),
  Meal(
    id: '11',
    name: 'Crazy Crunchy Fry',
    rating: '4.2',
    reviews: '300',
    price: 36,
    cat: 'Most Popular',
    img: 'images/home/restaurants/shiromenu/crazy.png',
    rest_id: '2',
    desc: 'Fried crab',
    calories: '470',
    totalM: 0,
    number_of_items: 1,
    notes: '',
    user_id: '',
  ),
  Meal(
    id: '12',
    name: 'Crunchy Crab Roll',
    rating: '4.2',
    reviews: '300',
    price: 36,
    cat: 'Most Popular',
    img: 'images/home/restaurants/shiromenu/crunchy.png',
    rest_id: '2',
    desc: 'Shrimp tempura, crab mayo spicy, and avocado',
    calories: '470',
    totalM: 0,
    number_of_items: 1,
    notes: '',
    user_id: '',
  ),
];
List<Meal> cart = [];
