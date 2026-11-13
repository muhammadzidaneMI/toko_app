
import 'package:flutter/material.dart';
import 'router/app_router.dart';

void main() {
  runApp(const TokoApp());
}

class TokoApp extends StatelessWidget {
  const TokoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Toko App',
      routerConfig: appRouter,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
    );
  }
}