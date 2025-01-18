import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/product.dart';

class ProductView extends StatelessWidget {
  final Product product;
  const ProductView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        title: Image.network(
            height: 50,
            fit: BoxFit.cover,
            'https://ghorerbazar.com/cdn/shop/files/logo.webp?v=1707766182'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.orange,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.shopping_bag_outlined,
              color: Colors.orange,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: Image.network(
                fit: BoxFit.cover,
                product.image,
              ),
            ),
            const SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'product description',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Price: ${product.price}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                minimumSize: Size(Get.size.width - 40, 40),
                maximumSize: Size(Get.size.width - 40, 40),
                backgroundColor: Colors.black,
                foregroundColor: Colors.orange,
              ),
              onPressed: () {},
              child: const Text('Add to cart'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                minimumSize: Size(Get.size.width - 40, 40),
                maximumSize: Size(Get.size.width - 40, 40),
                backgroundColor: Colors.orange,
                foregroundColor: Colors.black,
              ),
              onPressed: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_bag_outlined),
                  SizedBox(width: 10),
                  Text('ক্যাশ অন ডেলিভারিতে অর্ডার করুন'),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                minimumSize: Size(Get.size.width - 40, 40),
                maximumSize: Size(Get.size.width - 40, 40),
                backgroundColor: Colors.black,
                foregroundColor: Colors.orange,
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                      fit: BoxFit.cover,
                      height: 20,
                      width: 20,
                      'https://cdn.shopify.com/s/files/1/0651/8007/4153/files/Messenger.png?v=1725863026'),
                  const SizedBox(width: 10),
                  const Text('Chat with us'),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                minimumSize: Size(Get.size.width - 40, 40),
                maximumSize: Size(Get.size.width - 40, 40),
                backgroundColor: Colors.black,
                foregroundColor: Colors.orange,
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                      fit: BoxFit.cover,
                      height: 20,
                      width: 20,
                      'https://cdn.shopify.com/s/files/1/0685/1339/9006/files/whatsapp.png?v=1727853351v=1725863026'),
                  const SizedBox(width: 10),
                  const Text('Whatsapp us'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
