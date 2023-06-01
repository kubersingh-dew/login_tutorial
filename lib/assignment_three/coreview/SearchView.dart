import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key, required this.searchText});

  final String searchText;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
      child: Row(
        children: <Widget>[
          const Icon(Icons.search),
          const SizedBox(width: 8,),
          Flexible(
            child: TextField(
              decoration: InputDecoration(hintText: searchText,border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }
}
