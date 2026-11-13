
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../state/auth_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toko App'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              AuthState.logout();
              context.go('/login');
            },
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.storefront,
                size: 90,
                color: Colors.blue,
              ),
              const SizedBox(height: 20),
              Text(
                'Selamat Datang, ${AuthState.username}!',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              const Text('Selamat berbelanja di Toko App.'),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    context.push('/products');
                  },
                  icon: const Icon(Icons.shopping_bag),
                  label: const Text('Lihat Daftar Produk'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
