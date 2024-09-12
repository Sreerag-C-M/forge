class Category {
  final String title;
  final String image;

  Category({
    required this.title,
    required this.image,
  });
}

final List<Category> categoriesList = [
  Category(
    title: "All",
    image: "assets/all.png",
  ),
  Category(
    title: "  Men's\nFashion",
    image: "assets/men.jpeg",
  ),
  Category(
    title: "Women's\n Fashion",
    image: "assets/girl.jpg",
  ),
  Category(
    title: "Mobiles",
    image: "assets/phone.png",
  ),
  Category(
    title: " Wireless \nEarphones",
    image: "assets/all/wireless.png",
  ),
];
