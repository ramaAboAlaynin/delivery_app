import 'dart:async';

import 'package:flutter/material.dart';

class Customsearch extends SearchDelegate {
  var products;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    {
      final results = products
          .where((product) =>
              product.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
      return ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(results[index].name),
            onTap: () {
              close(context, results[index].name);
            },
          );
        },
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = products
        .where((product) =>
            product.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(suggestions[index].name),
              onTap: () {
                query = suggestions[index].name;
                showResults(context);
              });
        });
  }
}
