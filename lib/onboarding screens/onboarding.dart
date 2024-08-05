import 'package:flutter/material.dart';
import 'package:nam_tour/homePage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  //for keeping track of the page we are
 final PageController  _controller = PageController();
 //check if we are at the last page
 bool _onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //scrolling page view 
          PageView(
            onPageChanged: (index) => {
              setState(() {
                _onLastPage = (index == 2);
              })
            },
            controller: _controller ,
          children: [
            Container(
              color: Colors.grey[100],
              child: const Center(
                child: Text('1st Intro page'),
              ),
            ),
            Container(
              color: Colors.grey[200],
              child: const Center(
                child: Text('2nd Intro page'),
              ),
            ),
            Container(
              color: Colors.grey[300],
              child: const Center(
                child: Text('3rd Intro page'),
              ),
            ),
          ],
        ),

        //dot indicator
        Container(
          alignment: const Alignment(0, 0.90),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //skip button
              GestureDetector(
                onTap: (){
                _controller.jumpToPage(3);
                },
                child: const Text('Skip')),

              //dots
              SmoothPageIndicator(
                controller: _controller, 
                count: 3,
                ),

              //next or done
              _onLastPage == true ?
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Homepage()));
                
                },
                child: const Text('Done'))
                : 
                //Navigate to home screen
              GestureDetector(
                      onTap: () {
                        _controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
                      },
                      child: const Text('Next')),
            ],
          ))
        ],
      )
    );
  }
}