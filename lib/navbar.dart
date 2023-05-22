import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key, }) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SizedBox(
          height: 130,
        ),

        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: SizedBox(
            width: double.infinity,
            height: 100,
            // color: Colors.amber,
            child: Row(
              // you will find this list at the end of the file..
              children: buttonsOfSlide,
            ),
          ),
        ),

        // lil button
        Positioned(
          top: 0,
          left: ((MediaQuery.of(context).size.width) / 2) - 25,
          child: IconButton(
            onPressed: () {},
            icon: const CircleAvatar(
              backgroundColor: Colors.amber,
              child: Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomScrollBehaviour extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

List<Widget> buttonsOfSlide = [
  // left box
  Expanded(
    child: Container(
      height: double.maxFinite,
      width: double.maxFinite,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.amber,
            Colors.black,
          ],
          begin: Alignment.bottomLeft,
          stops: [
            0.8,
            0,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 30.0),
        child: IconButton(
          icon: const Icon(
            Icons.home,
            size: 40,
          ),
          onPressed: () {},
        ),
      ),
    ),
  ),

  // flex, scrollable row
  Expanded(
      flex: 2,
      child: Container(
        color: Colors.black,
        height: double.maxFinite,
        child: ScrollConfiguration(
          behavior: CustomScrollBehaviour(),
          child: Scrollbar(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const RangeMaintainingScrollPhysics(),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 35,
                        ),
                        Text(
                          "Name",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 35,
                        ),
                        Text(
                          "Name",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 35,
                        ),
                        Text(
                          "Name",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 35,
                        ),
                        Text(
                          "Name",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 35,
                        ),
                        Text(
                          "Name",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 35,
                        ),
                        Text(
                          "Name",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 35,
                        ),
                        Text(
                          "Name",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 35,
                        ),
                        Text(
                          "Name",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 35,
                        ),
                        Text(
                          "Name",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 35,
                        ),
                        Text(
                          "Name",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 35,
                        ),
                        Text(
                          "Name",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )),

  // right box
  Expanded(
    child: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.amber,
              Colors.black,
            ],
            begin: Alignment.bottomRight,
            end: Alignment.centerLeft,
            stops: [
              0.8,
              0,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: IconButton(
            icon: const Icon(
              Icons.person_2_rounded,
              size: 40,
            ),
            onPressed: () {},
          ),
        )),
  ),
];
