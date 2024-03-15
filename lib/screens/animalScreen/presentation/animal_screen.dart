import 'package:flutter/material.dart';
import 'package:todo/model/animal+model.dart';

class AnimalInfoScreen extends StatelessWidget {
  final Animal animal;
  const AnimalInfoScreen({super.key, required this.animal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(animal.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(animal.imageUrl),
            Text(
              "Information about ${animal.name}",
              style: const TextStyle(fontSize: 20),
            ),
            Text(animal.description)
          ],
        ),
      ),
    );
  }
}
