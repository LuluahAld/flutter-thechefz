class Restaurant {
  final String id;
  final String name;
  final String rating;
  final String reviews;
  final String distance;
  final String cat;
  final String img;
  final String imgl;
  final String delivery2;
  final String disc;
  final String closing;
  final String menu_cat1;
  final String menu_cat2;
  final String menu_cat3;

  Restaurant({
    required this.id,
    required this.name,
    required this.rating,
    required this.reviews,
    required this.distance,
    required this.cat,
    required this.img,
    required this.imgl,
    required this.delivery2,
    required this.disc,
    required this.closing,
    required this.menu_cat1,
    required this.menu_cat2,
    required this.menu_cat3,
  });
  factory Restaurant.fromMap(Map<String, dynamic> map) {
    return Restaurant(
      id: map['id'],
      name: map['name'],
      rating: map['rating'],
      reviews: map['reviews'],
      distance: map['distance'],
      cat: map['cat'],
      img: map['img'],
      imgl: map['imgl'],
      delivery2: map['delivery2'],
      disc: map['disc'],
      closing: map['closing'],
      menu_cat1: map['menu_cat1'],
      menu_cat2: map['menu_cat2'],
      menu_cat3: map['menu_cat3'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'rating': rating,
      'reviews': reviews,
      'distance': distance,
      'cat': cat,
      'img': img,
      'imgl': imgl,
      'delivery2': delivery2,
      'disc': disc,
      'closing': closing,
      'menu_cat1': menu_cat1,
      'menu_cat2': menu_cat2,
      'menu_cat3': menu_cat3,
    };
  }
}

List<Restaurant> rests = [
  Restaurant(
    id: '1',
    name: 'Wagyu Burger - واقيو برقر',
    rating: '2.7',
    reviews: '3',
    distance: '3.60 km',
    cat: 'Burger',
    img: 'images/home/restaurants/wagyu.png',
    imgl: 'images/home/restaurants/wagyul.png',
    delivery2: 'no',
    disc: 'no',
    closing: 'Closes at 4:00 PM',
    menu_cat1: 'Most Popular',
    menu_cat2: 'Burgers & Sandwiches',
    menu_cat3: 'Side Orders',
  ),
  Restaurant(
    id: '2',
    name: 'Shiro - شيرو',
    rating: '4.5',
    reviews: '3',
    distance: '5.40 km',
    cat: 'Asian',
    img: 'images/home/restaurants/shiromenu/shiro.png',
    imgl: 'images/home/restaurants/shiromenu/shirol.png',
    delivery2: 'no',
    disc: 'yes',
    closing: 'Closes at 11:59 PM',
    menu_cat1: 'Most Popular',
    menu_cat2: 'Shiro Box',
    menu_cat3: 'Fry Rolls',
  ),
  Restaurant(
    id: '3',
    name: 'Rawk - رووك',
    rating: '4.4',
    reviews: '154',
    distance: '3.80 km',
    cat: 'Healthy',
    img: 'images/home/restaurants/rawkmenu/rawk.png',
    imgl: 'images/home/restaurants/rawkmenu/rawkl.png',
    delivery2: 'yes',
    disc: 'no',
    closing: 'Closes at 11:50 PM',
    menu_cat1: 'Most Popular',
    menu_cat2: 'Boxes',
    menu_cat3: 'Wrap',
  ),
  Restaurant(
    id: '4',
    name: '3eegs - ثري ايجز',
    rating: '4.6',
    reviews: '200',
    distance: '5.20 km',
    cat: 'Breakfast',
    img: 'images/home/restaurants/3eggsmenu/3eggs.png',
    imgl: 'images/home/restaurants/3eggsmenu/3eggsl.png',
    delivery2: 'yes',
    disc: 'yes',
    closing: 'Closes at 11:50 PM',
    menu_cat1: 'Most Popular',
    menu_cat2: 'Burgers & Sandwiches',
    menu_cat3: 'Salad & Sides',
  ),
];
List<Restaurant> favRest = [];
