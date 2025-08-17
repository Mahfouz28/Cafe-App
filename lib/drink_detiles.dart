import 'package:flutter/material.dart';
import 'package:food_menu/models.dart';

class DrinkDetiles extends StatefulWidget {
  const DrinkDetiles({super.key});

  @override
  State<DrinkDetiles> createState() => _DrinkDetilesState();
}

class _DrinkDetilesState extends State<DrinkDetiles> {
  final PageController controller = PageController();
  double currentPage = 0;

  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        currentPage = controller.page ?? 1;
      });
    });
    super.initState();
  }

  final drinks = DrinksModel.drinks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: controller,
            itemCount: drinks.length,
            itemBuilder: (context, index) {
              final scale = 1 - (currentPage - index).abs() * 1;
              final trnsLateY = (currentPage - index).abs() * 590;
              return Transform.translate(
                offset: Offset(trnsLateY, 0),
                child: Transform.scale(
                  scale: scale.clamp(.1, 1),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Positioned(
                            bottom: 3,
                            left: 60,
                            child: Container(
                              width: 200,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade900,
                                    blurRadius: 30,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Image.asset(
                            drinks[index].image,
                            height: 600,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ); // Placeholder for now
            },
          ),
        ],
      ),
    );
  }
}
