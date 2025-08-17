import 'package:flutter/material.dart';
import 'package:food_menu/components/drinks.dart';
import 'package:food_menu/drink_detiles.dart';
import 'package:food_menu/models.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  shrinkWrap: true,

                  itemCount: DrinksModel.drinks.length,
                  itemBuilder: (context, index) {
                    final drink = DrinksModel.drinks[index];
                    return AnimatedBuilder(
                      animation: scrollController,
                      builder: (context, child) {
                        double offest = 0;
                        if (scrollController.hasClients) {
                          offest = scrollController.offset / 100 - index;
                        }
                        offest = offest.clamp(0, 2);

                        return Transform.scale(
                          scale: 1 - (offest * 0.2),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=>DrinkDetiles()));
                            },
                            child: Drinks(
                              name: drink.name,
                              image: drink.image,
                              description: drink.description,
                              price: drink.price,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
