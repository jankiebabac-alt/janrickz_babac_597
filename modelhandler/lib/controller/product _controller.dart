import 'package:modelhandler/model/product_model.dart';

import 'package:supabase_flutter/supabase_flutter.dart' hide User;

class ProductController {
  final supabase = Supabase.instance.client;
  // Get all product
  Future<List<Product>> getProducts() async {
    final data = await supabase.from('products').select();
    return data.map((item) => Product.fromMap(item)).toList();
  }

  // Add Product
  Future<void> addProduct(Product product) async {
    await supabase.from('products').insert(product.toMap());
  }

  // Delete product
  Future<void> deleteProduct(int id) async {
    await supabase.from('products').delete().eq('id', id);
  }

double calculateGrandTotal(List<Product> products) {
    double total = 0.0;
    for (var product in products) {
      total += product.price * product.quantity;
    }
    return total;
  }

  int calculatetotalitem(List<Product> products) {
    int totalItems = 0;
    for (var product in products) {
      totalItems += product.quantity;
    }
    return totalItems;
  }

  countTotalITems(List<Product> products) {
    int totalItems = 0;
    for (var product in products) {
      totalItems += product.quantity;
    }
    return totalItems;
  }
 
}
