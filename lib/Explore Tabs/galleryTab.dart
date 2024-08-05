import 'package:flutter/material.dart';
import 'package:nam_tour/pages/map_page.dart';
import 'package:nam_tour/pages/profilePage.dart';

class Gallerytab extends StatefulWidget {
  const Gallerytab({super.key});

  @override
  State<Gallerytab> createState() => _GallerytabState();
}

class _GallerytabState extends State<Gallerytab> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 9,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
      itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.all(1),
          child: Container(
            color: Colors.grey.shade500,
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context) => const Profilepage()));
                       },
                      child: Container(
                        margin: const EdgeInsets.all(3),
                        padding:const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black.withOpacity(0.1),
                        ),
                        child: const Icon(Icons.person)
                        ),
                    ),
                      GestureDetector(
                        onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context) => const MapPage()));
                       },
                        child: Container(
                        margin: const EdgeInsets.all(3),
                        padding:const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                           color: Colors.black.withOpacity(0.1),
                        ),
                        child: const Icon(Icons.location_on)
                        ),
                      ),
                  ],
                )
              ],
            ),
          ),
        );
      });
  }
}