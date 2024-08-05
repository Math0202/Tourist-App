import 'package:flutter/material.dart';

// ignore: camel_case_types
class filterItems extends StatelessWidget {
  const filterItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
                        height: 60,
                        color: Colors.transparent,
                        child: ListView(
    scrollDirection: Axis.horizontal,
                        children: const [
    FilterItem(text: 'Food', icon: Icon(Icons.restaurant, size: 16)),
    FilterItem(text: 'Craft', icon: Icon(Icons.palette, size: 16)),
    FilterItem(text: 'Hot spot', icon: Icon(Icons.warning, size: 16)),
    FilterItem(text: 'Culture', icon: Icon(Icons.art_track, size: 16)),
    FilterItem(text: 'Venders', icon: Icon(Icons.storefront, size: 16)),
    FilterItem(text: 'Art', icon: Icon(Icons.art_track, size: 16)),
    FilterItem(text: 'Food', icon: Icon(Icons.restaurant, size: 16)),
    FilterItem(text: 'Emergency', icon: Icon(Icons.warning, size: 16)),
    FilterItem(text: 'Park', icon: Icon(Icons.park, size: 16)),
    FilterItem(text: 'Coffee', icon: Icon(Icons.local_cafe, size: 16)),
    FilterItem(text: 'Shuttle', icon: Icon(Icons.airport_shuttle, size: 16)),
    FilterItem(text: 'Popular', icon: Icon(Icons.trending_up, size: 16)),
    FilterItem(text: 'Accommodation', icon: Icon(Icons.hotel, size: 16)),
    FilterItem(text: 'Recreation', icon: Icon(Icons.sports, size: 16)),
    FilterItem(text: 'Gas', icon: Icon(Icons.local_gas_station, size: 16)),
    FilterItem(text: 'Emergency', icon: Icon(Icons.warning, size: 16)),
    FilterItem(text: 'Shopping', icon: Icon(Icons.shopping_basket, size: 16)),
    FilterItem(text: 'All', icon: Icon(Icons.list, size: 16)),
    ],
                        ),
                      );
  }
}

class FilterItem extends StatelessWidget {
  final String text;
  final Icon icon;
  const FilterItem({
    super.key, 
    required this.text, 
    required this.icon
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey),
      ),
      child: Center(
        child: Column(
          children: [
            icon,
            Text(text),
          ],
        ),
      ),
    );
  }
}