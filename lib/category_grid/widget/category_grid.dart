import 'package:flutter/material.dart';
import 'package:kheloo_app/category_grid/model/category_model.dart';


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


class CategoryGrid extends StatelessWidget {
  const CategoryGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
      shrinkWrap: true,
        itemCount: _photos.length,
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
                      image:AssetImage(_photos[index].image),
                      fit: BoxFit.cover
                  )
              ),
            ),
          );
        },
      );
  }
}
