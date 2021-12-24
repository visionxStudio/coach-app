import 'package:digicoach/src/common/constants/asset_image_link.dart';

class CoachModel {
  final String name;
  final String image;
  final bool isCertified;
  final List<String> courses;
  final List<String> skills;
  final String address;
  final int likes;
  final int comments;
  final double rating;
  final String price;
  final String description;
  final CoachFile coachFile;
  final CoachJourney coachJourney;

  CoachModel({
    required this.name,
    required this.image,
    required this.isCertified,
    required this.courses,
    required this.skills,
    required this.address,
    required this.likes,
    required this.comments,
    required this.rating,
    required this.description,
    required this.price,
    required this.coachFile,
    required this.coachJourney,
  });
}

class CoachFile {
  final String gender;
  final int age;
  final List<String> language;

  CoachFile({
    required this.gender,
    required this.age,
    required this.language,
  });
}

class CoachJourney {
  final String diploma;
  final int experience;
  final String training;

  CoachJourney({
    required this.diploma,
    required this.experience,
    required this.training,
  });
}

final List<CoachModel> coachList = [
  CoachModel(
    name: "Mira Septimus",
    isCertified: true,
    image: ImageAsset.avatar1,
    courses: ["Méditation", "Yoga", "Pilates"],
    skills: ["Masseur", "Maître nageur", "STAPS"],
    address: "France, Lille",
    likes: 7,
    comments: 3,
    rating: 5,
    price: "29",
    description:
        "Je pratique la méditation depuis maintenant 6 ans, je me suis spécialisé au vietnam dans  les pratiques cognitives de bien-être.  J’adore ce que je fais et j’essaie de J'ai pratiqué le yoga de médiation et différents types d'exercices et j'ai une grande expérience dans ces domaines. Je pense donc que je suis l'un des meilleurs candidats qui peut vous enseigner assez bien comme un professionnel.",
    coachFile:
        CoachFile(gender: "Femme", age: 26, language: ["Anglais", "Français"]),
    coachJourney: CoachJourney(
        diploma: 'RNCP',
        experience: 4,
        training: "Stage de pleine conscience "),
  ),
  CoachModel(
    name: "Justin Siphron",
    isCertified: false,
    image: ImageAsset.avatar2,
    courses: ["Méditation", "Yoga", "Mise en forme"],
    skills: ["Skill1", "Skill2", "Skill3"],
    address: "France, Lille",
    likes: 7,
    comments: 3,
    rating: 3.5,
    price: "29",
    description:
        "Je pratique la méditation depuis maintenant 6 ans, je me suis spécialisé au vietnam dans  les pratiques cognitives de bien-être.  J’adore ce que je fais et j’essaie de J'ai pratiqué le yoga de médiation et différents types d'exercices et j'ai une grande expérience dans ces domaines. Je pense donc que je suis l'un des meilleurs candidats qui peut vous enseigner assez bien comme un professionnel.",
    coachFile:
        CoachFile(gender: "Femme", age: 26, language: ["Anglais", "Français"]),
    coachJourney: CoachJourney(
        diploma: 'RNCP',
        experience: 4,
        training: "Stage de pleine conscience "),
  ),
  CoachModel(
    name: "Lincoln Vetrovs",
    isCertified: true,
    image: ImageAsset.avatar3,
    courses: ["Méditation", "Yoga", "Mise en forme"],
    skills: ["Skill1", "Skill2", "Skill3"],
    address: "France, Lille",
    likes: 7,
    comments: 3,
    rating: 4,
    price: "29",
    description:
        "Je pratique la méditation depuis maintenant 6 ans, je me suis spécialisé au vietnam dans  les pratiques cognitives de bien-être.  J’adore ce que je fais et j’essaie de J'ai pratiqué le yoga de médiation et différents types d'exercices et j'ai une grande expérience dans ces domaines. Je pense donc que je suis l'un des meilleurs candidats qui peut vous enseigner assez bien comme un professionnel.",
    coachFile:
        CoachFile(gender: "Femme", age: 26, language: ["Anglais", "Français"]),
    coachJourney: CoachJourney(
        diploma: 'RNCP',
        experience: 4,
        training: "Stage de pleine conscience "),
  ),
  CoachModel(
    name: "Dulce Bergson",
    isCertified: false,
    image: ImageAsset.avatar4,
    courses: ["Méditation", "Yoga", "Mise en forme"],
    skills: ["Skill1", "Skill2", "Skill3"],
    address: "France, Lille",
    likes: 7,
    comments: 3,
    rating: 4.5,
    price: "29",
    description:
        "Je pratique la méditation depuis maintenant 6 ans, je me suis spécialisé au vietnam dans  les pratiques cognitives de bien-être.  J’adore ce que je fais et j’essaie de J'ai pratiqué le yoga de médiation et différents types d'exercices et j'ai une grande expérience dans ces domaines. Je pense donc que je suis l'un des meilleurs candidats qui peut vous enseigner assez bien comme un professionnel.",
    coachFile:
        CoachFile(gender: "Male", age: 26, language: ["Anglais", "Français"]),
    coachJourney: CoachJourney(
        diploma: 'RNCP',
        experience: 4,
        training: "Stage de pleine conscience "),
  ),
  CoachModel(
    name: "Erin Kenter",
    isCertified: false,
    image: ImageAsset.avatar5,
    courses: ["Méditation", "Yoga", "Mise en forme"],
    skills: ["Skill1", "Skill2", "Skill3"],
    address: "France, Lille",
    likes: 7,
    comments: 3,
    rating: 2.5,
    price: "29",
    description:
        "Je pratique la méditation depuis maintenant 6 ans, je me suis spécialisé au vietnam dans  les pratiques cognitives de bien-être.  J’adore ce que je fais et j’essaie de J'ai pratiqué le yoga de médiation et différents types d'exercices et j'ai une grande expérience dans ces domaines. Je pense donc que je suis l'un des meilleurs candidats qui peut vous enseigner assez bien comme un professionnel.",
    coachFile:
        CoachFile(gender: "Femme", age: 26, language: ["Anglais", "Français"]),
    coachJourney: CoachJourney(
        diploma: 'RNCP',
        experience: 4,
        training: "Stage de pleine conscience "),
  ),
  CoachModel(
    name: "Mira Septimus",
    isCertified: true,
    image: ImageAsset.avatar1,
    courses: ["Méditation", "Yoga", "Pilates"],
    skills: ["Masseur", "Maître nageur", "STAPS"],
    address: "France, Lille",
    likes: 7,
    comments: 3,
    rating: 5,
    price: "29",
    description:
        "Je pratique la méditation depuis maintenant 6 ans, je me suis spécialisé au vietnam dans  les pratiques cognitives de bien-être.  J’adore ce que je fais et j’essaie de J'ai pratiqué le yoga de médiation et différents types d'exercices et j'ai une grande expérience dans ces domaines. Je pense donc que je suis l'un des meilleurs candidats qui peut vous enseigner assez bien comme un professionnel.",
    coachFile:
        CoachFile(gender: "Femme", age: 26, language: ["Anglais", "Français"]),
    coachJourney: CoachJourney(
        diploma: 'RNCP',
        experience: 4,
        training: "Stage de pleine conscience "),
  ),
  CoachModel(
    name: "Justin Siphron",
    isCertified: true,
    image: ImageAsset.avatar2,
    courses: ["Méditation", "Yoga", "Mise en forme"],
    skills: ["Skill1", "Skill2", "Skill3"],
    address: "France, Lille",
    likes: 7,
    comments: 3,
    rating: 3.4,
    price: "29",
    description:
        "Je pratique la méditation depuis maintenant 6 ans, je me suis spécialisé au vietnam dans  les pratiques cognitives de bien-être.  J’adore ce que je fais et j’essaie de J'ai pratiqué le yoga de médiation et différents types d'exercices et j'ai une grande expérience dans ces domaines. Je pense donc que je suis l'un des meilleurs candidats qui peut vous enseigner assez bien comme un professionnel.",
    coachFile:
        CoachFile(gender: "Femme", age: 26, language: ["Anglais", "Français"]),
    coachJourney: CoachJourney(
        diploma: 'RNCP',
        experience: 4,
        training: "Stage de pleine conscience "),
  ),
  CoachModel(
    name: "Lincoln Vetrovs",
    isCertified: false,
    image: ImageAsset.avatar3,
    courses: ["Méditation", "Yoga", "Mise en forme"],
    skills: ["Skill1", "Skill2", "Skill3"],
    address: "France, Lille",
    likes: 7,
    comments: 3,
    rating: 4,
    price: "29",
    description:
        "Je pratique la méditation depuis maintenant 6 ans, je me suis spécialisé au vietnam dans  les pratiques cognitives de bien-être.  J’adore ce que je fais et j’essaie de J'ai pratiqué le yoga de médiation et différents types d'exercices et j'ai une grande expérience dans ces domaines. Je pense donc que je suis l'un des meilleurs candidats qui peut vous enseigner assez bien comme un professionnel.",
    coachFile:
        CoachFile(gender: "Femme", age: 26, language: ["Anglais", "Français"]),
    coachJourney: CoachJourney(
        diploma: 'RNCP',
        experience: 4,
        training: "Stage de pleine conscience "),
  ),
  CoachModel(
    name: "Dulce Bergson",
    isCertified: false,
    image: ImageAsset.avatar4,
    courses: ["Méditation", "Yoga", "Mise en forme"],
    skills: ["Skill1", "Skill2", "Skill3"],
    address: "France, Lille",
    likes: 7,
    comments: 3,
    rating: 4.5,
    price: "29",
    description:
        "Je pratique la méditation depuis maintenant 6 ans, je me suis spécialisé au vietnam dans  les pratiques cognitives de bien-être.  J’adore ce que je fais et j’essaie de J'ai pratiqué le yoga de médiation et différents types d'exercices et j'ai une grande expérience dans ces domaines. Je pense donc que je suis l'un des meilleurs candidats qui peut vous enseigner assez bien comme un professionnel.",
    coachFile:
        CoachFile(gender: "Femme", age: 26, language: ["Anglais", "Français"]),
    coachJourney: CoachJourney(
        diploma: 'RNCP',
        experience: 4,
        training: "Stage de pleine conscience "),
  ),
  CoachModel(
    name: "Erin Kenter",
    isCertified: false,
    image: ImageAsset.avatar5,
    courses: ["Méditation", "Yoga", "Mise en forme"],
    skills: ["Skill1", "Skill2", "Skill3"],
    address: "France, Lille",
    likes: 7,
    comments: 3,
    rating: 2.5,
    price: "29",
    description:
        "Je pratique la méditation depuis maintenant 6 ans, je me suis spécialisé au vietnam dans  les pratiques cognitives de bien-être.  J’adore ce que je fais et j’essaie de J'ai pratiqué le yoga de médiation et différents types d'exercices et j'ai une grande expérience dans ces domaines. Je pense donc que je suis l'un des meilleurs candidats qui peut vous enseigner assez bien comme un professionnel.",
    coachFile:
        CoachFile(gender: "Femme", age: 26, language: ["Anglais", "Français"]),
    coachJourney: CoachJourney(
        diploma: 'RNCP',
        experience: 4,
        training: "Stage de pleine conscience "),
  ),
];
