class Product {
  String brandName;
  String productName;
  String image;
  String price;
  bool saved;
  int stars;
  String description;

  Product(this.brandName, this.productName, this.image, this.price, this.saved,
      this.stars, this.description);
}

List<Product> productsList = [
  Product("Nike", "Brasilia", "assets/bag1.png", "45", false, 4,
      "The medium-sized Backpack is ideal for packing everything you need to get you through a day of training when you're away from your locker, gym or home. "),
  Product("Adidas", "Power Backpack", "assets/bag2.png", "56", true, 5,
      "The medium-sized Backpack is ideal for packing everything you need to get you through a day of training when you're away from your locker, gym or home. "),
  Product("Adidas", "Adidas Power", "assets/bag3.png", "56", false, 3,
      "The medium-sized Backpack is ideal for packing everything you need to get you through a day of training when you're away from your locker, gym or home. "),
];
