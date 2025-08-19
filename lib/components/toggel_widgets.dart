import 'package:flutter/material.dart';

class ToggelWidget extends StatefulWidget {
  ToggelWidget({super.key});

  @override
  State<ToggelWidget> createState() => _ToggelWidgetState();
}

class _ToggelWidgetState extends State<ToggelWidget> {
  bool isIced = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            buildToggelSelection('Hot', !isIced),
            buildToggelSelection('Iced', isIced),
          ],
        ),
      ),
    );
  }

  Widget buildToggelSelection(String label, bool selected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isIced = label == "Iced"; // set true if Iced tapped
        });
      },
      child: AnimatedContainer(
        curve: Curves.linear,

        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.symmetric(horizontal: 0),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: selected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: selected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
