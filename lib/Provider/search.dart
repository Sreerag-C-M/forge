import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../models/product_model.dart';

class SearchProvider extends ChangeNotifier {
  final List<Product> _cart = [];
  final List<Product> _searchHistory = [];

  // Method to add products to the cart
  void addProduct(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  List<Product> searchProducts(String query) {
    if (query.isEmpty) {
      return [];
    }
    final results = _cart.where((product) {
      final titleMatches = product.title.toLowerCase().contains(query.toLowerCase());
      final categoryMatches = product.category.toLowerCase().contains(query.toLowerCase());
      return titleMatches || categoryMatches;
    }).toList();
    return results;
  }

  void addToSearchHistory(Product product) {
    if (!_searchHistory.contains(product)) {
      _searchHistory.add(product);
      notifyListeners();
    }
  }

  List<Product> getSearchHistory() {
    return List.unmodifiable(_searchHistory);
  }

  static SearchProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<SearchProvider>(
      context,
      listen: listen,
    );
  }
}
