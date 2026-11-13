import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/product.dart';

class CheckoutPage extends StatefulWidget {
  final Product product;

  const CheckoutPage({super.key, required this.product});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int _quantity = 1;
  String _paymentMethod = 'Transfer Bank';
  final _addressController = TextEditingController(text: 'Jl. Margonda Raya, Depok');

  String formatRupiah(num number) {
    final str = number.toInt().toString();
    final buffer = StringBuffer();
    for (int i = 0; i < str.length; i++) {
      if (i > 0 && (str.length - i) % 3 == 0) {
        buffer.write('.');
      }
      buffer.write(str[i]);
    }
    return 'Rp$buffer';
  }

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  void _processCheckout() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green),
            SizedBox(width: 8),
            Text('Pesanan Berhasil!'),
          ],
        ),
        content: Text(
          'Terima kasih telah membeli ${widget.product.name} ($_quantity pcs).\n'
              'Total pembayaran: ${formatRupiah(widget.product.price * _quantity)}\n'
              'Metode: $_paymentMethod',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.go('/home');
            },
            child: const Text('Kembali ke Beranda'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final totalPrice = widget.product.price * _quantity;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ringkasan Produk',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        widget.product.imageUrl,
                        width: 64,
                        height: 64,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.product.name,
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(formatRupiah(widget.product.price)),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: _quantity > 1
                              ? () => setState(() => _quantity--)
                              : null,
                          icon: const Icon(Icons.remove_circle_outline),
                        ),
                        Text('$_quantity', style: const TextStyle(fontSize: 16)),
                        IconButton(
                          onPressed: () => setState(() => _quantity++),
                          icon: const Icon(Icons.add_circle_outline),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Alamat Pengiriman',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _addressController,
              maxLines: 2,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Masukkan alamat lengkap...',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Metode Pembayaran',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              initialValue: _paymentMethod,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              items: ['Transfer Bank', 'E-Wallet (GoPay/OVO)', 'COD (Bayar di Tempat)']
                  .map((method) => DropdownMenuItem(value: method, child: Text(method)))
                  .toList(),
              onChanged: (val) {
                if (val != null) setState(() => _paymentMethod = val);
              },
            ),
            const Divider(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total Pembayaran', style: TextStyle(fontSize: 16)),
                Text(
                  formatRupiah(totalPrice),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _processCheckout,
                child: const Text(
                  'Konfirmasi & Bayar',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}