import 'package:flutter/material.dart';
import 'package:nam_tour/Explore%20Tabs/businessesTab.dart';
import 'package:nam_tour/Explore%20Tabs/galleryTab.dart';
import 'package:nam_tour/Explore%20Tabs/profilesTab.dart';
import 'package:nam_tour/components/filteredItems.dart';
import 'package:nam_tour/pages/map_page.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {


  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: Column(
        children: [

          //map filter items container
          filterItems(),

          //create the tabs
           TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.image),
                text: 'Gallery',
              ),
              Tab(
                icon: Icon(Icons.add_business),
                text: 'Businesses',
              ),
              Tab(
                icon: Icon(Icons.person),
                text: 'Profiles',
              ),
          ]),

          //access the different tab content
           Expanded(child: 
          TabBarView(children: [
            Gallerytab(),
            Businessestab(),
            Profiletab()
          ])
          )
        ],
      ),
      
    );
  }
}