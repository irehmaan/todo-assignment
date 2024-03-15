import 'package:flutter/material.dart';
import 'package:todo/screens/animalScreen/presentation/animal_screen.dart';

import '../../../model/animal+model.dart';

class AnimalList extends StatelessWidget {
  const AnimalList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey.shade300)),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: animalsList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Image.network(
                  animalsList[index].imageUrl,
                  height: 50,
                ),
                title: Text(animalsList[index].name),
                // subtitle: Text(animalsList[index].description),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => AnimalInfoScreen(
                                animal: animalsList[index],
                              )));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
