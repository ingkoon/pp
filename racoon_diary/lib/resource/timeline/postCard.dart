// ignore_for_file: file_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

CarouselController buttonCarouselController = CarouselController();

List<int> list = [1, 2, 3, 4, 5];
CarouselSlider timeLineCard = CarouselSlider(
  options: CarouselOptions(height: 400.0),
  items: [1, 2, 3, 4, 5].map((i) {
    return Builder(
      builder: (BuildContext context) {
        double height = MediaQuery.of(context).size.height;
        double width = MediaQuery.of(context).size.width;
        return Container(          
            width: width,
            height: height/2,
            margin: EdgeInsets.symmetric(horizontal: 3.0),
            decoration: BoxDecoration(color: Colors.amber),
            child: Text(
              '2022년 1월 $i 일',
              style: TextStyle(fontSize: 16.0),
            ));
      },
    );
  }).toList(),
);
ElevatedButton child = ElevatedButton(
  onPressed: () => buttonCarouselController.nextPage(
      duration: Duration(milliseconds: 300), curve: Curves.linear),
  child: Text('→'),
);
