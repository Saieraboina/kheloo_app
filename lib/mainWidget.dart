import 'package:flutter/material.dart';
import 'package:kheloo_app/carousel_with_step_indicator.dart';
import 'package:kheloo_app/category_grid/data/category_data.dart';
import 'package:kheloo_app/container_with_border.dart';
import 'package:kheloo_app/counter.dart';
import 'package:kheloo_app/gamesgrid.dart';
import 'package:kheloo_app/gradient_title.dart';
import 'package:kheloo_app/live_withdrawl/widget/withdrawal_container.dart';
import 'package:kheloo_app/navbar.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
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
                    ))
              ];
            },
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      // moving image
                      CarouselWithStepIndicator(imgList: imgList),
                      // counter
                      const ContainerWithBorder(height: 100, child: Counter()),
                      const GradientTitle(title: 'LIVE WITHDRAWAL',),
                      const Divider(
                        color: Colors.amber,
                        thickness: 4.0,
                        height: 20,
                        indent: 120,
                        endIndent: 120,
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      const ContainerWithBorder(
                          height: 150, child: WithdrawalContainer()),
                      const CarouselVideosWithStepIndicator(videoPaths: [
                        "assets/videos/video.mp4",
                        "assets/videos/video2.mp4"
                      ]),

                      const SizedBox(height: 20,),
                      const GradientTitle(title: 'GAMES',),
                      const Divider(
                          color: Colors.amber,
                          thickness: 4.0,
                          height: 20,
                          indent: 150,
                          endIndent: 150),
                      const GamesGrid(),
                      // space
                      const SizedBox(
                        height: 110,
                      ),
                    ],
                  ),
                ),
                const Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: NavBar(),
                ),
              ],
            )),
      ),
    );
  }
}
