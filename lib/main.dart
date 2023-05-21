import 'package:flutter/material.dart';
import 'package:kheloo_app/carousel_with_dots_page.dart';
import 'package:kheloo_app/category_grid/model/category_model.dart';
import 'package:kheloo_app/navbar.dart';

void main() => runApp(const MyApp());

final List<String> imgList = [
  'https://kheloo.com/images/bannerDesktop.jpg',
  'https://res.cloudinary.com/jerrick/image/upload/v1680846794/642fafcad68222001dc5353d.jpg',
  'https://newspatrolling.com/wp-content/uploads/2023/04/khello.png',
  'https://kheloo.com/images/10minwith.png',
];

final List _photos = [
  Data(image: "assets/images/img_1.png", text: "Natural Scenes"),
  Data(image: "assets/images/img_2.png", text: "Natural Scenes"),
  Data(image: "assets/images/img_3.png", text: "Natural Scenes"),
  Data(image: "assets/images/img_4.png", text: "Natural Scenes"),
  Data(image: "assets/images/img_5.png", text: "Natural Scenes"),
  Data(image: "assets/images/img_6.png", text: "Natural Scenes"),
  Data(image: "assets/images/img_7.png", text: "Natural Scenes"),
  Data(image: "assets/images/img_8.png", text: "Natural Scenes"),
];

int show = 4;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(slivers: <Widget>[
          SliverAppBar(
              backgroundColor: Colors.black,
              expandedHeight: 60.0,
              floating: true,
              pinned: true,
              actions: <Widget>[
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                    ),
                    child: const Text(
                      "LOGIN",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ))
              ],
              title: Row(
                children: [
                  SizedBox(
                      height: 90,
                      width: 100,
                      child: Image.asset('assets/images/img.png',
                          fit: BoxFit.cover)),
                  const Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: Image.asset('assets/images/giftbox.png',
                            fit: BoxFit.cover),
                      )),
                ],
              )),
          SliverToBoxAdapter(
              child: CarouselWithStepIndicator(imgList: imgList)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Colors.amber,
                        Colors.white,
                        Colors.black,
                        Colors.amber,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withAlpha(60),
                        blurRadius: 6.0,
                        spreadRadius: 0.0,
                        offset: const Offset(
                          0.0,
                          3.0,
                        ),
                      ),
                    ]),
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Text('Enter further widgets here'),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              children: [
                Text("Most Popular",
                  style: TextStyle(
                    color: Colors.white70
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  child: Text("Show More"),
                  onPressed: () {

                  },
                )
              ],
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                    decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                            image: AssetImage(_photos[index].image),
                            fit: BoxFit.cover)));
              },
              childCount: _photos.length,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 2.0,
            ),
          ),
        ]),
        bottomNavigationBar: const NavBar(),
      ),
    );
  }
}
