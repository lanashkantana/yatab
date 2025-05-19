
class Tour {
  final String name;
  final double price;
  final String details;
  final String guideName;
  final int seats;
  final List imageUrl; // Added image URL

  Tour({
    required this.name,
    required this.price,
    required this.details,
    required this.guideName,
    required this.seats,
    required this.imageUrl, // Initialize image URL
  });
}