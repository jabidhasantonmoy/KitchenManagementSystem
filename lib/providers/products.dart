import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'চাষী চাল',
      description: 'চাষী চাল ৫ কেজি',
      price: 300,
      imageUrl:
          'https://chaldn.com/_mpimage/chashi-aromatic-chinigura-rice-2-kg?src=https%3A%2F%2Feggyolk.chaldal.com%2Fapi%2FPicture%2FRaw%3FpictureId%3D70240&q=low&v=1&m=400&webp=1',
    ),
    Product(
      id: 'p2',
      title: 'প্রান চাল',
      description: 'প্রান নাজিরশাল চাল ৫ কেজি',
      price: 290,
      imageUrl:
          'https://chaldn.com/_mpimage/pran-nazirshail-rice-5-kg?src=https%3A%2F%2Feggyolk.chaldal.com%2Fapi%2FPicture%2FRaw%3FpictureId%3D48089&q=low&v=1&m=400&webp=1',
    ),
    Product(
      id: 'p3',
      title: 'আড়ং চাল',
      description: 'আড়ং নাজিরশাইল চাল ৫ কেজি',
      price: 1900,
      imageUrl:
          'https://chaldn.com/_mpimage/aarong-nazirshail-rice-5-kg?src=https%3A%2F%2Feggyolk.chaldal.com%2Fapi%2FPicture%2FRaw%3FpictureId%3D48061&q=low&v=1&m=400&webp=1',
    ),
    Product(
      id: 'p4',
      title: 'এ সি আই লবন',
      description: 'এ সি আই পিওর লবন ১ কেজি',
      price: 40,
      imageUrl:
          'https://chaldn.com/_mpimage/aci-pure-salt-1-kg?src=https%3A%2F%2Feggyolk.chaldal.com%2Fapi%2FPicture%2FRaw%3FpictureId%3D47100&q=low&v=1&m=400&webp=1',
    ),
    Product(
      id: 'p5',
      title: 'তীর চিনি',
      description: 'তীর চিনি ১ কেজি',
      price: 2699,
      imageUrl:
          'https://chaldn.com/_mpimage/teer-sugar-1-kg?src=https%3A%2F%2Feggyolk.chaldal.com%2Fapi%2FPicture%2FRaw%3FpictureId%3D47127&q=low&v=1&m=400&webp=1',
    ),
    Product(
      id: 'p6',
      title: 'সাদ পিংক সল্ট',
      description: 'সাদ পিংক সল্ট ১০০ গ্রাম',
      price: 5190,
      imageUrl:
          'https://chaldn.com/_mpimage/saad-pink-salt-100-gm?src=https%3A%2F%2Feggyolk.chaldal.com%2Fapi%2FPicture%2FRaw%3FpictureId%3D72073&q=low&v=1&m=400&webp=1',
    ),
    Product(
      id: 'p7',
      title: 'রাঁধুনী হলুদ গুঁড়া',
      description: 'রাঁধুনী হলুদ গুঁড়া ২০০ গ্রাম',
      price: 1800,
      imageUrl:
          'https://chaldn.com/_mpimage/radhuni-turmeric-powder-holud-200-gm?src=https%3A%2F%2Feggyolk.chaldal.com%2Fapi%2FPicture%2FRaw%3FpictureId%3D77285&q=low&v=1&m=400&webp=1',
    ),
    Product(
      id: 'p8',
      title: 'আহমেদ জিঞ্জার পেস্ট',
      description: 'আহমেদ জিঞ্জার পেস্ট ১০০ গ্রাম',
      price: 4700,
      imageUrl:
          'https://chaldn.com/_mpimage/ahmed-ginger-paste-100-gm?src=https%3A%2F%2Feggyolk.chaldal.com%2Fapi%2FPicture%2FRaw%3FpictureId%3D59373&q=low&v=1&m=400&webp=1',
    ),
    Product(
      id: 'p9',
      title: 'ফ্রেশ মরিচ গুঁড়া',
      description: 'ফ্রেশ মরিচ গুঁড়া ২০০ গ্রাম',
      price: 1790,
      imageUrl:
          'https://chaldn.com/_mpimage/fresh-chilli-powder-200-gm?src=https%3A%2F%2Feggyolk.chaldal.com%2Fapi%2FPicture%2FRaw%3FpictureId%3D59347&q=low&v=1&m=400&webp=1',
    ),
    Product(
      id: 'p10',
      title: 'বসুন্ধরা সয়াবিন তেল',
      description: 'বসুন্ধরা ফর্টিফাইড সয়াবিন তেল ৫ লিটার',
      price: 4000,
      imageUrl:
          'https://chaldn.com/_mpimage/bashundhara-fortified-soyabean-oil-5-ltr?src=https%3A%2F%2Feggyolk.chaldal.com%2Fapi%2FPicture%2FRaw%3FpictureId%3D71570&q=low&v=1&m=400&webp=1',
    ),
  ];

  // var _showFavoritesOnly = false;

  List<Product> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavourite).toList();
    // }
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavourite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }
  //
  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  Future<void> fetchAndSetProducts() async {
    const url =
        'https://fydpgm-default-rtdb.asia-southeast1.firebasedatabase.app/products.json';
    try {
      final response = await http.get(Uri.parse(url));
      print(response);
    } catch (error) {
      throw (error);
    }
  }

  Future<void> addProduct(Product product) async {
    const url =
        'https://fydpgm-default-rtdb.asia-southeast1.firebasedatabase.app/products.json';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          'title': product.title,
          'description': product.description,
          'price': product.price,
          'imageUrl': product.imageUrl,
          'isFavourite': product.isFavourite,
        }),
      );
      final newProduct = Product(
        id: json.decode(response.body)['name'],
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
      );
      _items.add(newProduct);
      // _items.insert(0, newProduct); // at the start of the list
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  void updateProduct(String id, Product newProduct) {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('...');
    }
  }

  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}
