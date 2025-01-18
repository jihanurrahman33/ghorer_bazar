import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghorer_bazar/views/cart_view/cart_view.dart';

import '../../controllers/cart_controller.dart';
import '../../data/dummy_data.dart';
import '../product_view/product_view.dart';

class HomeView extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());

    return Scaffold(
      key: _scaffoldKey,
      endDrawer: const CartView(),
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            // Add functionality for the menu button if needed.
          },
          icon: const Icon(Icons.menu),
        ),
        title: Image.network(
          'https://ghorerbazar.com/cdn/shop/files/logo.webp?v=1707766182',
          height: 50,
          fit: BoxFit.cover,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.orange),
            onPressed: () {
              // Add functionality for search.
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined, color: Colors.orange),
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Image.network(
                'https://ghorerbazar.com/cdn/shop/files/Web_Banner_Crystal_Honey.png?v=1736946452&width=360',
                fit: BoxFit.cover,
                height: 150,
                width: double.infinity,
              ),
              const SizedBox(height: 20),
              const Text(
                'All Products',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return InkWell(
                    onTap: () {
                      Get.to(() => ProductView(product: product));
                    },
                    child: Card(
                      margin: const EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 4,
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(10),
                            ),
                            child: Image.network(
                              product.image,
                              height: 160,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                //const SizedBox(height: 5),
                                Text(
                                  'Tk ${product.price}',
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: 16,
                                  ),
                                ),
                                //const SizedBox(height: 10),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    backgroundColor: Colors.orange,
                                  ),
                                  onPressed: () {
                                    cartController.addToCart({
                                      'id': DateTime.now().toString(),
                                      'name': product.name,
                                      'price': product.price,
                                      'image': product.image,
                                    });
                                    _scaffoldKey.currentState?.openEndDrawer();
                                  },
                                  child: const Text('Quick Add'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
