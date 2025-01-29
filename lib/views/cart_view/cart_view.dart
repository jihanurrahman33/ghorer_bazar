import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/cart_controller.dart';
import '../../payment_gateway_view/payment_gateway_view.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());

    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Shopping Cart',
              style: TextStyle(fontSize: 20),
            ),
            const Divider(),
            Obx(() {
              if (cartController.cartItems.isEmpty) {
                return const Center(
                  child: Text(
                    'Your cart is empty.',
                    style: TextStyle(fontSize: 16),
                  ),
                );
              }

              return Expanded(
                child: ListView.builder(
                  itemCount: cartController.cartItems.length,
                  itemBuilder: (context, index) {
                    final cartItem = cartController.cartItems[index];

                    return ListTile(
                      leading: Image.network(
                        cartItem['image'],
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        cartItem['name'],
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Tk ${cartItem['price'].toString()}'),
                          Container(
                            width: 120,
                            color: Colors.grey[200],
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () {
                                    cartController.removeFromCart(cartItem);
                                  },
                                ),
                                Text(cartItem['quantity'].toString()),
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () {
                                    cartController.addToCart(cartItem);
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      // trailing: IconButton(
                      //   icon: const Icon(Icons.delete),
                      //   onPressed: () {
                      //     cartController.cartItems.remove(cartItem);
                      //     cartController.calculateTotal();
                      //   },
                      // ),
                    );
                  },
                ),
              );
            }),
            const Divider(),
            Obx(() => Text(
                  'Total: Tk ${cartController.total.value.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 18),
                )),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Add checkout logic here
                Get.to(() => Checkout());
                Get.snackbar('Checkout', 'Proceed to checkout!',
                    snackPosition: SnackPosition.TOP);
                cartController.removeFromCart(cartController.cartItems.first);
              },
              child: const Text('Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}
