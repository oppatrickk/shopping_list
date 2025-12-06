import 'package:flutter/material.dart';
import 'package:shopping_list/features/home/domain/entities/shopping_item.dart';

class ShoppingItemSearchDelegate extends SearchDelegate<ShoppingItem?> {
  ShoppingItemSearchDelegate({required this.items});
  final List<ShoppingItem> items;

  @override
  String? get searchFieldLabel => 'Search items';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () => query = '',
        ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = _filterItems();

    return _buildResultList(results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final results = _filterItems();

    return _buildResultList(results);
  }

  List<ShoppingItem> _filterItems() {
    if (query.trim().isEmpty) return items;

    final lower = query.toLowerCase();
    return items.where((item) {
      return item.title.toLowerCase().contains(lower) ||
          item.description.toLowerCase().contains(lower) ||
          item.category.toLowerCase().contains(lower);
    }).toList();
  }

  Widget _buildResultList(List<ShoppingItem> results) {
    if (results.isEmpty) {
      return const Center(
        child: Text('No items found'),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: results.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final item = results[index];

        return ListTile(
          leading: Image.asset(
            item.image,
            height: 48,
            width: 48,
            fit: BoxFit.cover,
          ),
          title: Text(item.title),
          subtitle: Text(item.description, maxLines: 1, overflow: TextOverflow.ellipsis),
          trailing: Text('₱${item.price.toStringAsFixed(2)}'),
          onTap: () => close(context, item),
        );
      },
    );
  }
}
