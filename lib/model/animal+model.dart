// animal_model.dart

class Animal {
  final String name;
  final String description;
  final String imageUrl;

  Animal({
    required this.name,
    required this.description,
    required this.imageUrl,
  });
}

List<Animal> animalsList = [
  Animal(
    name: 'Dog',
    description:
        'Dogs are domesticated mammals, known for their loyalty and friendly nature. They are commonly kept as pets and are also used for various purposes such as herding, hunting, and assisting people with disabilities.',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/9/90/Labrador_Retriever_portrait.jpg/1200px-Labrador_Retriever_portrait.jpg', // Replace with actual image URL
  ),
  Animal(
    name: 'Cat',
    description:
        'Cats are small carnivorous mammals, known for their independent and curious behavior. They are often kept as pets for companionship and are skilled hunters.',
    imageUrl:
        'https://www.alleycat.org/wp-content/uploads/2019/03/FELV-cat.jpg', // Replace with actual image URL
  ),
  Animal(
    name: 'Sparrow',
    description:
        'Sparrows are small passerine birds, known for their chirping songs and social behavior. They are found in various habitats and are often seen in urban areas.',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Tree_Sparrow_August_2007_Osaka_Japan.jpg/1200px-Tree_Sparrow_August_2007_Osaka_Japan.jpg', // Replace with actual image URL
  ),
  Animal(
    name: 'Pigeon',
    description:
        'Pigeons are stout-bodied birds, known for their homing ability and use in messaging services. They are found in almost every part of the world and have adapted well to urban environments.',
    imageUrl:
        'https://cdn.download.ams.birds.cornell.edu/api/v1/asset/308065631/1800', // Replace with actual image URL
  ),
  Animal(
    name: 'Octopus',
    description:
        'Octopuses are marine animals, known for their intelligence and unique appearance. They have eight arms with suction cups and are skilled at camouflage and escaping from predators.',
    imageUrl:
        'https://easydrawingguides.com/wp-content/uploads/2018/03/how-to-draw-an-octopus-featured-image-1200.png', // Replace with actual image URL
  ),
  Animal(
    name: 'Rhino',
    description:
        'Rhinos are large herbivorous mammals, known for their thick protective skin and horns. They are found in Africa and Asia and are endangered due to habitat loss and poaching.',
    imageUrl:
        'https://i0.wp.com/picflick.co.za/wp-content/uploads/2020/01/manji-3.png?fit=501%2C594&ssl=1', // Replace with actual image URL
  ),
  Animal(
    name: 'Leopard',
    description:
        'Leopards are big cats, known for their agility and spotted coat pattern. They are skilled hunters and are found in various habitats including forests, savannas, and mountains.',
    imageUrl:
        'https://wildlifesos.org/wp-content/uploads/2020/03/Leopard-Vitthal.jpg', // Replace with actual image URL
  ),
  Animal(
    name: 'Lion',
    description:
        'Lions are majestic carnivorous mammals, known as the "king of the jungle." They live in groups called prides and are skilled hunters, primarily preying on large herbivores.',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/Lion_d%27Afrique.jpg/1200px-Lion_d%27Afrique.jpg', // Replace with actual image URL
  ),
  Animal(
    name: 'Jaguar',
    description:
        'Jaguars are powerful big cats, known for their strength and stealthy hunting abilities. They are native to the Americas and are skilled swimmers, often found near water sources.',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaHGtaOHH8vwRORe1Dnw0ry5rJ6ViJGGTj5EEx9jOmWvp10RN_Fic_IaGdFoZDXmqonLg&usqp=CAU', // Replace with actual image URL
  ),
];
