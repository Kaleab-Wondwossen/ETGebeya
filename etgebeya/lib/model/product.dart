class Product {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final String description;
  final String category;
  final double rating; // Optional: Product rating (e.g., 4.5 out of 5)
  final int stock; // Optional: Available stock quantity

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
    required this.category,
    this.rating = 0.0, // Default value for rating
    this.stock = 0, // Default value for stock
  });

  // Optional: Override toString() for easy debugging
  @override
  String toString() {
    return '''
Product Details:
ID: $id
Name: $name
Price: \$${price.toStringAsFixed(2)}
Image URL: $imageUrl
Description: $description
Category: $category
Rating: $rating/5
Stock: $stock
''';
  }
}