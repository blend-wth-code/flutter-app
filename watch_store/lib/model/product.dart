class Product {
  final int id;
  final String name;
  final String desc;
  final String image;
  final double price;
  int quantity;

  Product(
      {required this.id,
      required this.name,
      required this.desc,
      required this.image,
      required this.price,
      required this.quantity});
}
