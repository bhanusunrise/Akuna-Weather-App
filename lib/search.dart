import 'package:flutter/material.dart';

import 'components.dart';

class SearchScreen extends StatelessWidget {

  String cityName = "Colombo";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: SearchAppBar(
        onSearch: (searchText) {
          // Handle search
          print('Search Text: $searchText');
          cityName = searchText;
        },
      ),
      body: const Center(
        child: GradiantFiller(),
        //child: Text(cityName),

      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SearchScreen(),
  ));
}



