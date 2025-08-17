class DrinksModel {
  final String image;
  final String name;
  final String description;
  final String price;

  DrinksModel(
    this.price, {
    required this.image,
    required this.name,
    required this.description,
  });
  static List<DrinksModel> drinks = [
    DrinksModel(
      "90",
      image: "assets/drinks/Chocolate.png",
      name: "Chocolate",
      description: "20 Flavors of your drink",
    ),
    DrinksModel(
      "40",
      image: "assets/drinks/Brownie Island.png",
      name: "Brownie Island",
      description: "20 Flavors of your drink",
    ),
    DrinksModel(
      "80",
      image: "assets/drinks/Banana.png",
      name: "Banana",
      description: "20 Flavors of your drink",
    ),
    DrinksModel(
      "50",
      image: "assets/drinks/Chocolate.png",
      name: "Chocolate",
      description: "20 Flavors of your drink",
    ),
    DrinksModel(
      "90",
      image: "assets/drinks/Banana.png",
      name: "Banana",
      description: "20 Flavors of your drink",
    ),
    DrinksModel(
      "60",
      image: "assets/drinks/Brownie Island.png",
      name: "Brownie Island",
      description: "20 Flavors of your drink",
    ),
  ];
}
