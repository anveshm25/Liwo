import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:liwo_mobile/screens/cart/controller/cart_controller.dart';
import 'package:provider/provider.dart';

import '../../network/api_response.dart';
import 'model/cart_query_response_model.dart';
import 'package:collection/collection.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CartController>().fetchCart();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            color: Colors.black87,
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back_ios_new)),
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Cart',
          style: TextStyle(color: Colors.black87),
        ),
      ),
      body: Consumer<CartController>(
        builder: (context, value, child) {
          switch (value.cartResponse.status) {
            case Status.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case Status.success:
              Cart? cart = value.cartResponse.data?.cart;
              return ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  CartItem(
                    image: NetworkImage(
                      cart?.lines?.edges?.firstOrNull?.node?.merchandise
                              ?.product?.images?.nodes?.firstOrNull?.url ??
                          '',
                    ),
                    name: cart?.lines?.edges?.firstOrNull?.node?.merchandise
                            ?.product?.title ??
                        '',
                    price: double.parse((cart?.lines?.edges?.firstOrNull?.node
                            ?.cost?.amountPerQuantity?.amount ??
                        '0')),
                    quantity:
                        cart?.lines?.edges?.firstOrNull?.node?.quantity ?? 0,
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Subtotal'),
                      Text('${cart?.cost?.subtotalAmount?.amount ?? 0.0}'),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Shipping'),
                      Text('${cart?.cost?.totalDutyAmount ?? 0.0}'),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${cart?.cost?.totalAmount?.amount ?? 0.0}',
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32.0, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        backgroundColor: Colors.green),
                    child: const Text('Checkout'),
                  ),
                ],
              );
            case Status.error:
              return const Center(
                child: Text('Something went wrong'),
              );

            case Status.none:
              return const Center(
                child: Text('Cart is Empty'),
              );
          }
        },
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final ImageProvider<Object>? image;
  final String name;
  final double price;
  final int quantity;

  const CartItem({
    Key? key,
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ColoredBox(
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 80.0,
                height: 80.0,
                child: image != null
                    ? Image(
                        image: image!,
                        fit: BoxFit.cover,
                      )
                    : const ColoredBox(color: Colors.black),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      price.toStringAsFixed(2),
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Quantity: $quantity',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        const Divider(
          thickness: 2,
        ),
      ],
    );
  }
}
