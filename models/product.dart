class Product {
  final int id;
  final String name;
  final double price;
  final String description;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
  });
}

final List<Product> dummyProducts = [
  Product(
    id: 1,
    name: 'Sepatu Lari',
    price: 450000,
    description: 'Sepatu lari ringan dengan bantalan empuk untuk kenyamanan lari jarak jauh maupun harian.',
    imageUrl: 'https://cdn.dummyjson.com/products/images/mens-shoes/Nike%20Air%20Jordan%201%20Red%20And%20Black/1.png',
  ),
  Product(
    id: 2,
    name: 'Tas Ransel',
    price: 275000,
    description: 'Tas ransel kapasitas 25L tahan percikan air, cocok untuk kuliah, kerja, dan traveling.',
    imageUrl: 'https://cdn.dummyjson.com/products/images/womens-bags/Blue%20Women\'s%20Handbag/1.png',
  ),
  Product(
    id: 3,
    name: 'Jam Tangan',
    price: 820000,
    description: 'Jam tangan analog minimalis dengan strap kulit sintetis premium dan tahan air 3 ATM.',
    imageUrl: 'https://cdn.dummyjson.com/products/images/mens-watches/Brown%20Leather%20Belt%20Watch/1.png',
  ),
  Product(
    id: 4,
    name: 'Headphone',
    price: 650000,
    description: 'Headphone wireless over-ear dengan fitur noise isolation dan baterai tahan hingga 20 jam.',
    imageUrl: 'https://cdn.dummyjson.com/products/images/mobile-accessories/Apple%20AirPods%20Max%20Silver/1.png',
  ),
  Product(
    id: 5,
    name: 'Botol Minum',
    price: 95000,
    description: 'Botol minum stainless steel 750ml menjaga suhu dingin hingga 12 jam dan panas 6 jam.',
    imageUrl: 'https://picsum.photos/id/225/600/600',
  ),
];