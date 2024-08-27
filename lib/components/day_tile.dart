import 'package:flutter/material.dart';

class DayTile extends StatelessWidget {
  const DayTile({super.key, required this.day, required this.isActive});

  final String day;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(30),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 89, 199, 182),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                day,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        : Text(
            day,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          );
  }
}
