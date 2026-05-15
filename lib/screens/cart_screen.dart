import 'package:flutter/material.dart';

import '../data/cart_store.dart';
import '../models/product.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<Product>>(
      valueListenable: CartStore.instance.products,
      builder: (context, products, child) {
        final cartItems = _groupProducts(products);
        final totalPrice = products.fold<double>(
          0,
          (total, product) => total + product.price,
        );

        return Scaffold(
          appBar: AppBar(title: const Text('Sepetim')),
          body: products.isEmpty
              ? const _EmptyCart()
              : ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                  itemCount: cartItems.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final item = cartItems[index];

                    return _CartItemTile(item: item);
                  },
                ),
          bottomNavigationBar: products.isEmpty
              ? null
              : SafeArea(
                  minimum: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: const Color(0xFFE5E7EB)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Toplam',
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                                Text(
                                  '${totalPrice.toStringAsFixed(2)} TL',
                                  style: Theme.of(context).textTheme.titleLarge
                                      ?.copyWith(fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                          ),
                          FilledButton.icon(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Odeme akisi demo kapsaminda yok.',
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(Icons.payment),
                            label: const Text('Onayla'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }

  List<CartItem> _groupProducts(List<Product> products) {
    final grouped = <int, CartItem>{};

    for (final product in products) {
      final current = grouped[product.id];

      if (current == null) {
        grouped[product.id] = CartItem(product: product, quantity: 1);
      } else {
        grouped[product.id] = current.copyWith(quantity: current.quantity + 1);
      }
    }

    return grouped.values.toList();
  }
}

class CartItem {
  const CartItem({required this.product, required this.quantity});

  final Product product;
  final int quantity;

  double get totalPrice => product.price * quantity;

  CartItem copyWith({int? quantity}) {
    return CartItem(
      product: product,
      quantity: quantity ?? this.quantity,
    );
  }
}

class _CartItemTile extends StatelessWidget {
  const _CartItemTile({required this.item});

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final imageCacheWidth = (96 * MediaQuery.devicePixelRatioOf(context))
        .round();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(0xFFF9FAFB),
                borderRadius: BorderRadius.circular(8),
              ),
              child: SizedBox(
                width: 76,
                height: 76,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Image.network(
                    key: ValueKey(item.product.imageUrl),
                    item.product.imageUrl,
                    fit: BoxFit.contain,
                    cacheWidth: imageCacheWidth,
                    filterQuality: FilterQuality.low,
                    webHtmlElementStrategy: WebHtmlElementStrategy.prefer,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.image_not_supported_outlined);
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.product.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Adet: ${item.quantity}',
                    style: TextStyle(color: colorScheme.onSurfaceVariant),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${item.totalPrice.toStringAsFixed(2)} TL',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyCart extends StatelessWidget {
  const _EmptyCart();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.shopping_bag_outlined,
              size: 56,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              'Sepet boş',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            const Text(
              'Ürün listesinden sepete ekleme yapabilirsiniz.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
