import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build detail screen');
    final Map<String, String> routeArgs =
        ModalRoute.of(context).settings.arguments;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
      ),
      body: Text(routeArgs['id']
      ),
    );
  }
}
