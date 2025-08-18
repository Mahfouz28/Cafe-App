import 'package:flutter/material.dart';
import 'package:food_menu/components/Qty_widget.dart';
import 'package:food_menu/components/toggel_widgets.dart';
import 'package:food_menu/models.dart';

/// A page that displays detailed views of drinks in a horizontal PageView
class DrinkDetiles extends StatefulWidget {
  const DrinkDetiles({super.key});

  @override
  State<DrinkDetiles> createState() => _DrinkDetilesState();
}

class _DrinkDetilesState extends State<DrinkDetiles> {
  /// Controller to handle PageView scrolling
  final PageController controller = PageController();

  /// logic
  int selectedIndex = 0;

  /// Keeps track of the current page index (can be fractional during scroll)
  double currentPage = 0;

  @override
  void initState() {
    super.initState();

    // Listen to page scroll changes and update `currentPage`
    controller.addListener(() {
      setState(() {
        currentPage = controller.page ?? 1; // fallback to 1 if page is null
      });
    });
  }

  /// List of drinks to display (loaded from a model)
  final drinks = DrinksModel.drinks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // header
            Positioned(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          drinks[currentPage.round()].name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(drinks[currentPage.round()].description),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "€ ${drinks[currentPage.round()].price}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Horizontal PageView to scroll through drinks
            PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: controller,
              itemCount: drinks.length,
              itemBuilder: (context, index) {
                // Calculate scale and translation based on the current page
                final scale =
                    1 - (currentPage - index).abs() * 1; // shrinking effect
                final trnsLateY =
                    (currentPage - index).abs() *
                    590; // vertical translation effect

                return Transform.translate(
                  offset: Offset(
                    trnsLateY,
                    150,
                  ), // move horizontally according to distance
                  child: Transform.scale(
                    scale: scale.clamp(
                      .1,
                      1,
                    ), // clamp the scale between 0.1 and 1
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            // Decorative shadow behind the image
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Image.asset("assets/drinks/shadow.png"),
                              // Container(
                              //   width: 100,
                              //   height: 70,
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(100),
                              //     boxShadow: [
                              //       BoxShadow(
                              //         color: Colors.grey.shade900,
                              //         blurRadius: 60,
                              //         spreadRadius: 1,
                              //       ),
                              //     ],
                              //   ),
                              // ),
                            ),

                            // Drink image
                            Image.asset(
                              drinks[index].image,
                              height: 350,
                              fit: BoxFit.fill,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ); // End of transformed drink card
              },
            ),

            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(4, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: selectedIndex == index
                                  ? Colors.blue.shade600
                                  : Colors.white,
                              border: Border.all(color: Colors.black54),
                            ),
                            child: selectedIndex == index
                                ? Icon(
                                    Icons.done,
                                    color: Colors
                                        .white, // icon color when selected
                                  )
                                : Icon(
                                    Icons.add,
                                    color: Colors
                                        .black54, // icon color when selected
                                  ), // nothing shown when not selected
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ToggelWidget(),
                        SizedBox(width: 10),
                        Expanded(child: QtyWidget()),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
