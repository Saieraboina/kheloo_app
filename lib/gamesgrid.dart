import 'package:flutter/material.dart';
import 'package:kheloo_app/category_grid/data/category_data.dart';


class GamesGrid extends StatefulWidget {
  const GamesGrid({Key? key, }) : super(key: key);

  @override
  State<GamesGrid> createState() => _GamesGridState();
}

class _GamesGridState extends State<GamesGrid> {
  bool showingMore = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Container(
                height: 30,
                width: 5,
                decoration: const BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Most Popular (${photos.length})",
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w300),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    showingMore = !showingMore;
                  });
                },
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.amber,
                    minimumSize: const Size(110, 30)),
                child: Text(!showingMore ? "Show More" : "Hide"),
              )
            ],
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          itemCount: showingMore ? photos.length : 4,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 2.0,
          ),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: AssetImage(photos[index].image),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
