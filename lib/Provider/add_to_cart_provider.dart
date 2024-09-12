import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../models/product_model.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _cart = [];
  List<Product> all = []; // Store all products
  List<Product> found = []; // Store search results
  List<Product> _searchHistory = []; // Store search history

  List<Product> get cart => _cart;
  List<Product> get foundProducts => found;
  List<Product> get searchHistory => _searchHistory;

  void toggleFavorite(Product product) {
    if (_cart.contains(product)) {
      for (Product element in _cart) {
        element.quantity++;
      }
    } else {
      _cart.add(product);
    }
    notifyListeners();
  }

  // for increment
  void incrementQtn(int index) {
    _cart[index].quantity++;
    notifyListeners();
  }

  // for decrement
  void decrementQtn(int index) {
    if (_cart[index].quantity <= 1) {
      return;
    }
    _cart[index].quantity--;
    notifyListeners();
  }

  // for total amount
  double totalPrice() {
    double myTotal = 0.0; // initial
    for (Product element in _cart) {
      myTotal += element.price * element.quantity;
    }
    return myTotal;
  }

  // Search method
  void searchProducts(String query) {
    if (query.isEmpty) {
      found = all;
    } else {
      found = all.where((product) {
        final title = product.title.toLowerCase();
        final description = product.description.toLowerCase();
        return title.contains(query.toLowerCase()) ||
            description.contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }

  // Add product to search history
  void addToSearchHistory(Product product) {
    if (!_searchHistory.contains(product)) {
      _searchHistory.add(product);
    }
    notifyListeners();
  }

  static CartProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<CartProvider>(context, listen: listen);
  }
}
