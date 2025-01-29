import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = <Map<String, dynamic>>[]
      .obs; // Each item is a map with details like name, price, and quantity.
  var total = 0.0.obs;

  void addToCart(Map<String, dynamic> item) {
    // Check if the item is already in the cart
    var existingItem =
        cartItems.firstWhereOrNull((cartItem) => cartItem['id'] == item['id']);
    if (existingItem != null) {
      // If the item is already in the cart, increase its quantity
      existingItem['quantity'] += 1;
    } else {
      // If the item is not in the cart, add it with quantity 1
      item['quantity'] = 1;
      cartItems.add(item);
    }
    calculateTotal();
  }

  //remove from cart
  void removeFromCart(Map<String, dynamic> item) {
    // Find the item in the cart
    var existingItem =
        cartItems.firstWhereOrNull((cartItem) => cartItem['id'] == item['id']);
    if (existingItem != null) {
      if (existingItem['quantity'] > 1) {
        // Decrease the quantity if it's more than 1
        existingItem['quantity'] -= 1;
      } else {
        // Remove the item if the quantity is 1
        cartItems.remove(existingItem);
      }
    }
    calculateTotal();
  }

  void calculateTotal() {
    total.value = 0.0;
    for (var item in cartItems) {
      total.value += item['price'] * item['quantity'];
    }
  }
}
