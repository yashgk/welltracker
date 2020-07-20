import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///D:/AndroidProject/welltracker/lib/Screens/DetailScreen.dart';
import '../util/SlideObject.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<SliderModel> slides= new List<SliderModel>();
  int currentIndex =0;
  bool isActive = false;
  PageController pageController=new PageController();

  @override
  void initState() {
    super.initState();
    slides = getSlides();
  }

  Widget indexIndicator(bool isActive){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      height: isActive ? 10.0 : 6.0,
      width: isActive ? 15.0 : 6.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.lightGreen,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: PageView.builder(
       controller: pageController,
       itemCount: slides.length,
         onPageChanged: (val){
         setState(() {
           currentIndex=val;
         });
         },
         itemBuilder: (context, index){
         return SliderTile(
           AssetImagePath: slides[index].getImagePath(),
         );
         }
     ),
     bottomSheet: currentIndex != slides.length - 1 ? Container(
       padding: EdgeInsets.symmetric(horizontal: 20),
       height: Platform.isIOS? 70 : 60,
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: <Widget>[
           GestureDetector(
             onTap: (){
               pageController.animateToPage(slides.length -1, duration: Duration(milliseconds: 400), curve: Curves.linear);
             },
             child: Text("Skip",
             style: TextStyle(fontWeight: FontWeight.bold),
             ),
           ),
           Row(
             children: <Widget>[
               for(int i=0; i< slides.length;i++) currentIndex == i ? indexIndicator(true) : indexIndicator(false)
             ],
           ),
           GestureDetector(
             onTap: (){
               pageController.animateToPage(currentIndex + 1, duration: Duration(milliseconds: 400), curve: Curves.linear);
             },
             child: Text(
               "Next",
               style: TextStyle(fontWeight: FontWeight.bold),
             ),
           ),
         ],
       ),
     ):
     Container(
       alignment: Alignment.center,
       width: MediaQuery.of(context).size.width,
       color: Colors.blue,
       height: Platform.isIOS ? 70 : 60,
       child: GestureDetector(
         onTap: () {
           Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen()));
         },
         child: Text(
           "GET STARTED",
           style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
         ),
       ),
     ),
   );
  }
}

class SliderTile extends StatelessWidget {
  String AssetImagePath;
  SliderTile({this.AssetImagePath});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Image.asset(
            AssetImagePath,
            fit: BoxFit.fill,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,),
        ],
      ),
    );
  }
}

