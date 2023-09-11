

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cki/project/layers/core/configuration/configuration.dart';
import 'package:flutter/material.dart';

class Books extends StatefulWidget {
  const Books({Key? key}) : super(key: key);

  @override
  State<Books> createState() => _BooksState();
}

class _BooksState extends State<Books> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text("Livros",style: TextStyle(
          fontFamily: SettingsCki.segoeEui,
          color: Colors.white
        ),),
      ),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Todos livros",style: TextStyle(
                  fontSize: 23,color: Colors.white),),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: CarouselSlider.builder(
                  itemCount: imgList.length,
                  options: CarouselOptions(
                      height: 280,
                      autoPlay: true,
                      viewportFraction: 0.55,
                      enlargeCenterPage: true,
                      pageSnapping: true,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      autoPlayAnimationDuration: const Duration(
                          seconds: 1
                      )
                  ),
                  itemBuilder: (context,index,pageViewIndex){
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        height: 250,
                        width: 180,
                        color: Colors.amber,
                        child: Image.asset(imgList[index],
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                  ),
            ),

            const SizedBox(height: 4,),

            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Livros de Ciências",style: TextStyle(
                fontSize: 22,
                  color: Colors.white
              ),),
            ),

            const SizedBox(height: 15,),

            SizedBox(
              height: 200,
              //width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: imgList.length,
                  itemBuilder: (context,index)=>
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            padding: const EdgeInsets.all(0.0),
                            color: Colors.amber,
                            child: Image.asset(imgList[index],
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.contain,),
                          ),
                        ),
                      )
              ),
            ),

            const SizedBox(height: 5,),

            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Livros de História",style: TextStyle(
                fontSize: 22,
                  color: Colors.white,
              ),),
            ),

            const SizedBox(height: 15,),

            SizedBox(
              height: 200,
              width: double.infinity,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context,index)=>
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            height: 200,
                            width: 170,
                            color: Colors.amber,
                          ),
                        ),
                      )
              ),
            ),

            const SizedBox(height: 5,),

            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Livros de língua portuguesa",style: TextStyle(
                fontSize: 22,
                color: Colors.white,
              ),),
            ),

            const SizedBox(height: 15,),

            SizedBox(
              height: 200,
              width: double.infinity,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context,index)=>
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            height: 200,
                            width: 170,
                            color: Colors.amber,
                          ),
                        ),
                      )
              ),
            ),

          ],
        ),

      ),
    );
  }

  final List<String> imgList = [
    'assets/books/book1.jpg',
    'assets/books/book2.jpg',
    'assets/books/book3.png',
    'assets/books/book4.png',
  ];
}
