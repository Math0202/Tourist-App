import 'package:flutter/material.dart';
import 'package:nam_tour/components/nav_bar.dart';
import 'package:nam_tour/pages/explore.dart';
import 'package:nam_tour/pages/map_page.dart';
import 'package:nam_tour/pages/home.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // Keep track of the selected index
  int _selectedIndex = 1;

  // Search controller
  late TextEditingController searchController;

  // Pages to navigate to
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    _pages = [
      const Explore(),
      const Home(),
      const MapPage(),
    ];
  }

  // Update selected index
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu, size: 30),
          ),
        ),
        // Search bar
        title: buildSearchBar(),
      ),
      backgroundColor: Colors.grey.shade300,
      bottomNavigationBar: bottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      drawer: buildDrawer(),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 48),
            child: CircleAvatar(
              radius: 46,
              child: Icon(
                Icons.person,
                size: 46,
              ),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star),
            ],),
          Divider(
            color: Colors.grey[700],
          ),
          const ListTile(
            leading: Icon(Icons.photo),
            title: Text('Photos'),
          ),
          const ListTile(
            leading: Icon(Icons.shopping_bag),
            title: Text('Bag'),
          ),
          const ListTile(
            leading: Icon(Icons.history),
            title: Text('Past Visits'),
          ),
          const ListTile(
            leading: Icon(Icons.route),
            title: Text('Routes'),
          ),
          Spacer(),
          Divider(
            color: Colors.grey[700],
          ),
          const ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
          ),
          const ListTile(
            leading: Icon(Icons.delete),
            title: Text('Delete Profile'),
          ),
        ],
      ),
    );
  }

  Container buildSearchBar() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: SizedBox(
          height: 45,
          // width: 460,
          child: Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey),
            ),
            child: Center(
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: const InputDecoration(
                  hintStyle: TextStyle(fontSize: 20),
                  border: InputBorder.none,
                  hintText: 'Find places & services',
                  prefixIcon: Icon(Icons.search, size: 30),
                  contentPadding: EdgeInsets.symmetric(horizontal: 26, vertical: 6),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
