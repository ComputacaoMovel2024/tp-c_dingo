import 'package:carousel_slider/carousel_slider.dart';
import 'package:dingo/main.dart';
import 'package:flutter/material.dart';
import '../header.dart';

class Games extends StatelessWidget {
  Games({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomHeader(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background_games.png"), // supostamente games1, mas não está a funcionar
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Stack(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                autoPlay: false,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
          ),
          items: imageSliders,
        ),], // Adicionar botão de play
        )
        ) 
      ),
    );
  }

  final List<Widget> imageSliders = imgList
    .map((item) => Container(
      margin: const EdgeInsets.all(5.0),
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.network(item, fit: BoxFit.cover, width: 1000.0),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                ),
              ),
            ],
          )),
    ))
    .toList();
}

class DemoItem extends StatelessWidget {
  final String title;
  final String route;
  const DemoItem(this.title, this.route, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}