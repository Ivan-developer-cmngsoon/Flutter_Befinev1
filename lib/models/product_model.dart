class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String type;
  final int stock;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.type,
    required this.stock,
  });

  // Permite comparar productos en base a su ID
  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Product && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
