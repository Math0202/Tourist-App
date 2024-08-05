import 'package:flutter/material.dart';
import 'package:nam_tour/pages/profilePage.dart';

class Profiletab extends StatefulWidget {
  const Profiletab({super.key});

  @override
  State<Profiletab> createState() => _ProfiletabState();
}

class _ProfiletabState extends State<Profiletab> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 9,
      itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.all(6),
          child: GestureDetector(
            onTap: (){
               Navigator.push(
                context, MaterialPageRoute(
                  builder: (context) => const Profilepage(),
                  )
                );
              },
            child: Container(
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10)
              ),
              child: const ListTile(
              leading: Icon(Icons.person),
              title: Text('Full Name • Windhoek \n • Cousine • Last Seen : Yesterday'),
            ),
            ),
          ),
        );
      });
  }
}