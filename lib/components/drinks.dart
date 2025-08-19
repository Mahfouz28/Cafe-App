import 'package:flutter/material.dart';

class Drinks extends StatelessWidget {
  const Drinks({
    super.key,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
  });

  final String name;
  final String image;
  final String description;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: Colors.white,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 70, horizontal: 3),
              child: Row(),
            ),
          ),
        ),
        Positioned(
          top: -10,
          left: 20,
          bottom: 45,
          child: Stack(
            children: [
              Positioned(
                bottom: 3,
                left: 6,
                child: Container(
                  width: 60,
                  height: 20,
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
              Image.asset(image, fit: BoxFit.contain),
            ],
          ),
        ),
        Positioned(
          top: 70,
          bottom: 0,
          right: 90,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(description, style: const TextStyle(color: Colors.black)),
            ],
          ),
        ),
        Positioned(
          bottom: 40,
          right: 30,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black87),
            ),
            child: const Icon(
              Icons.arrow_forward,
              size: 19,
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }
}
