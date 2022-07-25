class Food {
  Food({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.currency,
  });

  final int id;
  final String imageUrl;
  final String title;
  final double price;
  final String currency;
}
