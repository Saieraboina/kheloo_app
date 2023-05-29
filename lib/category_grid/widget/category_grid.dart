import 'package:flutter/material.dart';
import 'package:kheloo_app/category_grid/data/category_data.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
      shrinkWrap: true,
        itemCount: photos.length,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration:  BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                      image:AssetImage(photos[index].image),
                      fit: BoxFit.cover
                  )
              ),
            ),
          );
        },
      );
  }
}
